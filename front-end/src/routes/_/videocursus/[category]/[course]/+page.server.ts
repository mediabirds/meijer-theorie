export const load = async ({ locals, params }) => {
	const chapter = await locals.services.videoCourse(params.category, params.course).current()

	return {
		chapter
	}
}
