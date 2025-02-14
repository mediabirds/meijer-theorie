import { createItem, readItem, readItems, updateItem } from '@directus/sdk'
import type { Services } from '.'
import { uniq, type filter } from 'lodash-es'

export type VideoCourse = Directus.SchemaMapper<
	Directus.VideoCourses,
	{
		chapters: Directus.SchemaMapper<
			Directus.VideoCourseChapters,
			{
				lessons: Directus.VideoCoursesLessons[]
				lessonsFinished: string[]
				userVideoCourseId?: string
				didFinish: boolean
			}
		>[]
	}
>

export class VideoCourseService {
	/**
	 * Constructs a new instance of the VideoCourseService class.
	 *
	 * @param services - The services instance containing dependencies and shared resources.
	 * @param course - The slug identifier of the video course.
	 */
	constructor(
		readonly services: Services,
		readonly category: string,
		readonly course: string
	) {}

	async current() {
		const [course] = await this.services.event.locals.directus.request<VideoCourse[]>(
			readItems('video_courses', {
				filter: {
					category: { _eq: this.category },
					slug: { _eq: this.course }
				},
				fields: ['*', { chapters: ['*', { lessons: ['*'] }], subscriptionTiers: ['*.*'] }]
			})
		)

		return {
			...course,
			chapters: await this.chapters()
		}
	}

	/**
	 * Retrieves all chapters for the current video course.
	 *
	 * This method fetches all chapters for the current video course and enriches the chapter data
	 * with user-specific information such as the lessons the user has completed.
	 *
	 * @returns {Promise<VideoCourse['chapters']>} A promise that resolves to an array of chapters
	 *          enriched with user-specific information.
	 */
	async chapters() {
		const chapters = await this.services.event.locals.directus.request<
			Directus.VideoCourseChapters[]
		>(
			readItems('video_course_chapters', {
				filter: {
					videoCourse: {
						slug: { _eq: this.course },
						category: { _eq: this.category }
					}
				},
				fields: ['*', { lessons: ['*'] }]
			})
		)

		return Promise.all(chapters.map((chapter) => this.chapter(chapter.slug!)))
	}

	/**
	 * Fetches a specific video course chapter and enriches the data with user-specific information.
	 *
	 * This method fetches a video course chapter along with its lessons based on the provided slug.
	 * It also enriches the chapter data with user-specific information such as whether the chapter is finished
	 * and the lessons the user has completed.
	 *
	 * @param {string} slug - The slug identifier of the video course chapter.
	 * @returns {Promise<VideoCourseChapter | null>} A promise that resolves to the video course chapter
	 *          data enriched with user-specific information, or null if the chapter is not found.
	 */
	async chapter(slug: string) {
		const [chapter] = await this.services.event.locals.directus.request<VideoCourse['chapters']>(
			readItems('video_course_chapters', {
				filter: {
					videoCourse: {
						slug: { _eq: this.course },
						category: { _eq: this.category }
					},
					slug: { _eq: slug }
				},
				fields: ['*', { lessons: ['*'] }]
			})
		)

		const userCourse = this.services.state.user!.videoCourses.find(
			(vc) => vc.videoCourse.slug === this.course
		)
		const lessonsFinished = chapter.lessons
			.map((l) => l.title)
			.filter((l) => userCourse?.lessonsFinished.includes(l))

		return {
			...chapter,
			lessonsFinished,
			didFinish: lessonsFinished.length === chapter.lessons.length,
			userVideoCourseId: userCourse?.id
		}
	}

	/**
	 * Marks a lesson as finished for the current user and video course.
	 *
	 * This method updates the user's video course record to include the specified lesson
	 * as finished. If the user hasn't yet been associated with the current video course,
	 * it creates a new association in the database. The list of finished lessons is updated
	 * to ensure uniqueness.
	 *
	 * @param {string} lessonTitle - The title of the lesson to mark as finished.
	 * @returns {Promise<void>} A promise that resolves when the operation is complete.
	 */
	async finishLesson(lessonTitle: string) {
		const course = await this.current()
		const user = this.services.state.user!

		let userCourse = this.services.state.user!.videoCourses.find(
			(vc) => vc.videoCourse.slug === this.course
		)

		if (!userCourse) {
			userCourse = await this.services.event.locals.directus.request<typeof userCourse>(
				createItem(
					'user_video_courses',
					{
						user: user.id,
						videoCourse: course.id
					},
					{
						fields: ['*', { videoCourse: ['*'] }]
					}
				)
			)
		}

		return await this.services.event.locals.directus.request(
			updateItem('user_video_courses', userCourse!.id, {
				lessonsFinished: uniq([...userCourse!.lessonsFinished, lessonTitle])
			})
		)
	}
}
