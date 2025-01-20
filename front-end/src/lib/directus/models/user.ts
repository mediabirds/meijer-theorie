import type { RequestEvent } from '@sveltejs/kit'
import { updateMe as directusUpdateMe, type DirectusUser, type Query } from '@directus/sdk'

export const updateMe = (
	event: RequestEvent,
	data: Partial<DirectusUser<Directus.CustomDirectusTypes>>,
	query?: Query<Directus.CustomDirectusTypes, DirectusUser<Directus.CustomDirectusTypes>>
) => {
	return event.locals.directus.request(directusUpdateMe(data, query))
}
