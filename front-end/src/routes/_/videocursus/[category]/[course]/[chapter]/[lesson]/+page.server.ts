export const load = async ({ locals, params }) => {
	const course = await locals.services.videoCourse(params.category, params.course).current()
	const chapters = await locals.services.videoCourse(params.category, params.course).chapters()
	const chapter = await locals.services
		.videoCourse(params.category, params.course)
		.chapter(params.chapter)

	return {
		course,
		chapters,
		chapter
	}
}
