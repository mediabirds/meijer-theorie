import { readMe, type AuthenticationData } from '@directus/sdk'
import { redirect, type Handle } from '@sveltejs/kit'
import { logout, me, refresh } from '../modules/auth'
import { createClient } from '$lib/directus'

export const protectedRoutes = ['', '/_']

/**
 * Auth middleware.
 *
 * Handles authentication for protected routes.
 * If session cookie is present, it will refresh the token and fetch the user data.
 * If not, it will redirect to /account/login.
 * If the session is expired, it will logout the user and redirect to /account/login.
 *
 * @param {import('@sveltejs/kit').RequestEvent} event
 * @param {import('@sveltejs/kit').Resolve} resolve
 */
export const auth: Handle = async ({ event, resolve }) => {
	event.locals.directus = createClient(event.fetch)
	const token = event.cookies.get('session')

	if (token) {
		let authData = JSON.parse(token) as AuthenticationData

		if (authData.expires_at! < Date.now()) {
			logout(event)
			redirect(301, '/account/login')
		}

		await event.locals.directus.setToken(authData.access_token!)
		const [user, error] = await me(event)

		if (error || !user) {
			logout(event)
			redirect(301, '/account/login')
		}

		event.locals.session = authData
		event.locals.user = user
	} else {
		event.locals.session = null
		event.locals.user = null

		for (const route of protectedRoutes) {
			if (route === event.url.pathname) {
				redirect(301, '/account/login')
			}
			if (route !== '' && event.url.pathname.startsWith(route)) {
				redirect(301, '/account/login')
			}
		}
	}

	return await resolve(event)
}
