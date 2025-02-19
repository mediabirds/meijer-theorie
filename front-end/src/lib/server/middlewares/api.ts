import type { Handle } from '@sveltejs/kit'

/**
 * If the request is an API request, get the token from the authorization header,
 * strip the "Bearer " prefix and set it as the token for the Directus instance.
 */
export const api: Handle = async ({ event, resolve }) => {
	if (event.url.pathname.startsWith('/api')) {
		const token = event.request.headers.get('authorization')

		if (token?.startsWith('Bearer')) {
			await event.locals.directus.setToken(token.split(' ')[1])
		}
	}

	return await resolve(event)
}
