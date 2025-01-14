import { PUBLIC_DIRECTUS_URL } from '$env/static/public'
import {
	type AuthenticationClient,
	type AuthenticationData,
	type DirectusClient,
	type FetchInterface,
	type RestClient,
	authentication,
	createDirectus,
	rest
} from '@directus/sdk'

export const createClient = (fetch?: FetchInterface, session?: Required<AuthenticationData>) => {
	const client = createDirectus<Directus.CustomDirectusTypes>(
		PUBLIC_DIRECTUS_URL,
		fetch ? { globals: { fetch } } : {}
	)
		.with(rest())
		.with(authentication('json'))

	if (session) {
		client.setToken(session.access_token)
	}

	return client
}
