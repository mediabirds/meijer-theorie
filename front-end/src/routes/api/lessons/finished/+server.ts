import { json } from '@sveltejs/kit'

export const POST = async ({ locals, request }) => {
	const body = await request.json()

	if (!body.category || !body.chapter || !body.lesson) {
		return json({ code: 'MISSING_DATA', message: 'Missing data', data: body }, { status: 400 })
	}

	const course = await locals.services
		.videoCourse(body.category, body.course)
		.finishLesson(body.lesson)

	return json(course)
}
