import { redirect } from '@sveltejs/kit'

export const GET = async ({ locals, cookies }) => {
	locals.session = null
	locals.user = null

	cookies.delete('session', { path: '/' })

	return redirect(301, '/account/login')
}
