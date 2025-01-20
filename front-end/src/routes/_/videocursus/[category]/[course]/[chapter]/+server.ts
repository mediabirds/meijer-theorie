import { error, json, redirect } from '@sveltejs/kit'

/**
 * Redirects to the first lesson of the chapter that the user has not finished yet.
 * If all lessons are finished, redirects to the first lesson of the chapter.
 */
export const GET = async ({ params, locals }) => {
	const chapter = await locals.services
		.videoCourse(params.category, params.course)
		.chapter(params.chapter)
	const lesson =
		chapter.lessons.find((l) => !chapter.lessonsFinished.includes(l.title)) || chapter.lessons[0]

	return redirect(
		302,
		`/_/videocursus/${params.category}/${params.course}/${params.chapter}/${lesson.title}`
	)
}
