import { getCourse } from '$lib/directus/models/courses.js'
import { readItems } from '@directus/sdk'
import { error } from '@sveltejs/kit'

export const load = async (event) => {
	const course = await getCourse(event, {
		filter: {
			slug: { _eq: event.params.slug },
			category: { _eq: event.params.category }
		}
	})

	if (!course) {
		throw error(404, 'COURSE_NOT_FOUND')
	}

	return {
		course
	}
}
