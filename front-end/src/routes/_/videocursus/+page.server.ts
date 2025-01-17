import { getCourses } from '$lib/directus/models/courses.js'
import { readItems } from '@directus/sdk'

export const load = async (event) => {
	const courses = await getCourses(event, {
		filter: {
			subscriptionTier: event.locals.user!.subscription.id
			// TODO: Add category ! IMPORTANT !
		}
	})

	return {
		courses
	}
}
