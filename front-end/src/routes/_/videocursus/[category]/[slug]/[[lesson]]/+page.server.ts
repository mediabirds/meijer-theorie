import { getCourse } from '$lib/directus/models/courses.js'
import { readItems, updateMe } from '@directus/sdk'
import { error, redirect } from '@sveltejs/kit'

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

	/**
	 * Go to the first lesson if no lesson is specified
	 */
	if (!event.params.lesson) {
		redirect(
			301,
			`/_/videocursus/${event.params.category}/${event.params.slug}/${course.lessons[0].title}`
		)
	}

	console.log(event.locals.user!.videoCourses)
	// await event.locals.directus.request(
	// 	updateMe({
	// 		videoCourses: [
	// 			...event.locals.user!.videoCourses,
	// 			{ didFinish: true, videoCourse: course.id, lessonsFinished: [event.params.lesson] }
	// 		]
	// 	})
	// )

	return {
		course
	}
}
