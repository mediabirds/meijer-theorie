export const load = async ({ locals }) => {
	return {
		globals: locals.globals,
		session: locals.session,
		user: locals.user
	}
}
