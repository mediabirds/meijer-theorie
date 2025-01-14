import { createClient } from '$lib/directus'
import { readSingleton } from '@directus/sdk'
import type { Handle } from '@sveltejs/kit'

export const directus: Handle = async ({ event, resolve }) => {
	event.locals.directus = createClient(event.fetch)
	event.locals.globals = await event.locals.directus.request<Directus.Globals>(
		readSingleton('globals')
	)

	return await resolve(event)
}
