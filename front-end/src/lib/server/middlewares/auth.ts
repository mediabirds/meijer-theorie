import { readMe } from '@directus/sdk'
import type { Handle } from '@sveltejs/kit'

export const auth: Handle = async ({ event, resolve }) => {
	const token = event.cookies.get('token')

	if (token) {
		await event.locals.directus.setToken(token)

		event.locals.session = token
		event.locals.user = await event.locals.directus.request<Directus.DirectusUsers>(readMe())
	} else {
		event.locals.session = null
		event.locals.user = null
	}

	return await resolve(event)
}
