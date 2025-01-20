import { auth } from '$lib/server/middlewares/auth'
import { boot } from '$lib/server/middlewares/boot'
import { i18n } from '$lib/server/middlewares/i18n'
import { sequence } from '@sveltejs/kit/hooks'

export const handle = sequence(auth, boot, i18n)
