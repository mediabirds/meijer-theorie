import { redirect, type Handle } from '@sveltejs/kit'
import { isAfter } from 'date-fns'

export const expired: Handle = async ({ event, resolve }) => {
	if (!event.locals.user) {
		return await resolve(event)
	}

	if (isAfter(Date.now(), event.locals.user.expiresAt!)) {
		event.locals.isExpired = true
	} else {
		event.locals.isExpired = false
	}

	if (event.locals.isExpired) {
		if (event.url.pathname !== '/_' && !event.url.pathname.startsWith('/_/account')) {
			redirect(301, '/_')
		}
	}

	return await resolve(event)
}
