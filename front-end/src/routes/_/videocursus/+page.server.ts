import { getCourses } from '$lib/directus/models/courses.js'
import { readItems } from '@directus/sdk'

export const load = async (event) => {
	const courses = await event.locals.services.videoCourses().list()

	return {
		courses
	}
}
