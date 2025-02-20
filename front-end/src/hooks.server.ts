import { api } from '$lib/server/middlewares/api'
import { auth } from '$lib/server/middlewares/auth'
import { boot } from '$lib/server/middlewares/boot'
import { exams } from '$lib/server/middlewares/exams'
import { expired } from '$lib/server/middlewares/expired'
import { i18n } from '$lib/server/middlewares/i18n'
import { sequence } from '@sveltejs/kit/hooks'

export const handle = sequence(auth, boot, i18n, expired, exams, api)
