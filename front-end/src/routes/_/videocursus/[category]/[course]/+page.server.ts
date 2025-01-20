export const load = async (event) => {
	const chapter = await event.locals.services.videoCourse().current()

	return {
		chapter
	}
}
