export const load = async ({ locals }) => {
	const videoCourses = await locals.services.videoCourses().list()

	return {
		videoCourses
	}
}
