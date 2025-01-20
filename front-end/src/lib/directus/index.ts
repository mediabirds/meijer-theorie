import { PUBLIC_DIRECTUS_URL } from '$env/static/public'
import {
	type AuthenticationData,
	type FetchInterface,
	authentication,
	createDirectus,
	rest
} from '@directus/sdk'

export const createClient = (fetch?: FetchInterface, session?: Required<AuthenticationData>) => {
	const client = createDirectus<Directus.CustomDirectusTypes>(
		PUBLIC_DIRECTUS_URL,
		fetch ? { globals: { fetch } } : {}
	)
		.with(rest({ credentials: 'same-origin' }))
		.with(authentication('json'))

	if (session) {
		client.setToken(session.access_token)
	}

	return client
}
