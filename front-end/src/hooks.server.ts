import { auth } from '$lib/server/middlewares/auth'
import { directus } from '$lib/server/middlewares/directus'
import { sequence } from '@sveltejs/kit/hooks'

export const handle = sequence(directus, auth)
