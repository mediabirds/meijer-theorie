import { auth } from '$lib/server/middlewares/auth'
import { directus } from '$lib/server/middlewares/directus'
import { i18n } from '$lib/server/middlewares/i18n'
import { sequence } from '@sveltejs/kit/hooks'

export const handle = sequence(directus, auth, i18n)
