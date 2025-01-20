import type { Handle } from '@sveltejs/kit'
import { Services } from '../services'
import { readSingleton } from '@directus/sdk'

export const boot: Handle = async ({ event, resolve }) => {
	event.locals.services = new Services(event)
	event.locals.globals = await event.locals.directus.request<Directus.Globals>(
		readSingleton('globals')
	)

	return await resolve(event)
}
