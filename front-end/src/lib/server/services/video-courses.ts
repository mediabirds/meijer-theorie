import type { Services } from '.'
import { createItem, readItems, updateItem } from '@directus/sdk'
import type { VideoCourse } from './video-course'

export class VideoCourses {
	private _userVideoCourses: Map<
		number,
		Directus.SchemaMapper<
			Directus.UserVideoCourses,
			{
				videoCourse: Directus.VideoCourses
				lessonsFinished: string[]
			}
		>
	>

	/**
	 * Constructs a new instance of the VideoCourses service.
	 *
	 * @param {Services} services - The services instance containing dependencies and shared resources.
	 */
	constructor(readonly services: Services) {
		this._userVideoCourses = new Map(
			this.services.state.user!.videoCourses.map((vc) => [vc.videoCourse.id, vc])
		)
	}

	/**
	 * Retrieves all video courses that the user has access to.
	 *
	 * This method fetches all video courses that the user has access to based on their subscription tier.
	 * It fetches the courses, chapters, and lessons, and enriches the course data with user-specific
	 * information such as whether the course is finished and the lessons the user has completed.
	 *
	 * @returns {Promise<VideoCourse[]>} A promise that resolves to an array of video courses
	 *          enriched with user-specific information.
	 */
	async list(): Promise<VideoCourse[]> {
		const courses = await this.services.event.locals.directus.request<VideoCourse[]>(
			readItems('video_courses', {
				filter: {
					_or: [
						{
							subscriptionTiers: {
								subscriptionTier: { _eq: this.services.state.user!.subscription.id }
							}
						}
					]
				},
				fields: ['*', { chapters: ['*', { lessons: ['*'] }], subscriptionTiers: ['*.*'] }]
			})
		)

		return await Promise.all(courses.map((course) => this.getOne(course.category!, course.slug)))
	}

	/**
	 * Fetches a specific video course based on category and slug.
	 *
	 * This method retrieves the current video course identified by the provided category and slug,
	 * enriching it with user-specific information.
	 *
	 * @param {string} category - The category of the video course.
	 * @param {string} slug - The slug identifier of the video course.
	 * @returns {Promise<VideoCourse>} A promise that resolves to the video course data.
	 */
	async getOne(category: string, slug: string): Promise<VideoCourse> {
		return await this.services.videoCourse(category, slug).current()
	}
}
