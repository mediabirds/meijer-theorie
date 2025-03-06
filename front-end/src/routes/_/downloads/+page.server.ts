export const load = async ({ locals }) => {
	const downloads = await locals.services.downloads().list()

	return {
		downloads
	}
}
