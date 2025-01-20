import { createItem, readItems, updateItem } from '@directus/sdk'
import type { Services } from '.'
import { uniq, isEqual } from 'lodash-es'

export type VideoCourseType = Directus.SchemaMapper<
	Directus.VideoCourses,
	{
		lessons: Directus.VideoCoursesLessons[]
		didFinish: boolean
		lessonsFinished: string[]
		userVideoCourseId?: string
	}
>

export type UserVideoCourseType = Directus.SchemaMapper<
	Directus.UserVideoCourses,
	{
		lessonsFinished: string[]
		videoCourse: Directus.VideoCourses
	}
>

export class VideoCourse {
	private _current: VideoCourseType | undefined

	private _chapters: VideoCourseType[] | undefined

	/**
	 * Constructs a new instance of the VideoCourse class.
	 *
	 * @param {Services} services - The services instance containing dependencies and shared resources.
	 * @param {string} category - The category of the video course.
	 * @param {string} chapter - The chapter of the video course.
	 */
	constructor(
		readonly services: Services,
		readonly category: string,
		readonly chapter?: string
	) {}

	/**
	 * Fetches the current video course.
	 *
	 * @returns {Promise<VideoCourseType>} A promise that resolves to the current video course.
	 */
	async current(): Promise<VideoCourseType> {
		if (this._current) {
			return this._current
		}

		const chapters = await this.chapters()

		return (this._current = chapters.find((chapter) => chapter.slug === this.chapter))!
	}

	async chapters() {
		if (this._chapters) {
			return this._chapters
		}

		const user = this.services.event.locals.user!
		const courses = await this.services.event.locals.directus.request<VideoCourseType[]>(
			readItems('video_courses', {
				filter: {
					category: { _eq: this.category },
					subscriptionTier: { _eq: user.subscription.id }
				},
				fields: ['*', { lessons: ['*'] }]
			})
		)

		const userVideoCoursesMap = new Map(user.videoCourses.map((vc) => [vc.videoCourse.id, vc]))

		return (this._chapters = courses.map((course) => {
			const userCourse = userVideoCoursesMap.get(course.id)

			return {
				...course,
				userVideoCourseId: userCourse?.id,
				didFinish: userCourse?.lessonsFinished.length === course.lessons.length,
				lessonsFinished: userCourse?.lessonsFinished ?? []
			}
		}))
	}

	/**
	 * Updates the user's video courses to mark the given lesson as finished.
	 *
	 * If the user has not added the course to their video courses yet, it will do so automatically.
	 *
	 * @param {string} lessonTitle - The title of the lesson to mark as finished
	 * @returns {Promise<void>}
	 */
	async finishLesson(lessonTitle: string) {
		if (!this._current) {
			await this.current()
		}

		if (!this._current?.userVideoCourseId) {
			await this.addToUserCourses()
		}

		return await this.services.event.locals.directus.request(
			updateItem('user_video_courses', this._current!.userVideoCourseId!, {
				lessonsFinished: uniq([...this._current!.lessonsFinished, lessonTitle])
			})
		)
	}

	/**
	 * Adds the current course to the user's video courses if it hasn't been added yet.
	 *
	 * @returns {Promise<void>}
	 */
	async addToUserCourses() {
		if (!this._current) {
			await this.current()
		}

		const userVideoCourse = await this.services.event.locals.directus.request(
			createItem('user_video_courses', {
				user: this.services.event.locals.user!.id,
				videoCourse: this._current!.id
			})
		)

		this._current!.userVideoCourseId = userVideoCourse.id

		return userVideoCourse
	}

	/**
	 * Fetches all video courses that the user has access to.
	 *
	 * This is done by filtering the video courses by the user's subscription tier.
	 *
	 * @returns {Promise<Directus.VideoCourses[]>} A promise that resolves to an array of video courses.
	 */
	async list() {
		return await this.services.event.locals.directus.request(
			readItems('video_courses', {
				filter: {
					subscriptionTier: { _eq: this.services.event.locals.user!.subscription.id }
				},
				fields: ['*', { chapters: ['*'] }]
			})
		)
	}
}
