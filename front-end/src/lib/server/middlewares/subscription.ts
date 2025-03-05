import { redirect, type Handle } from '@sveltejs/kit'
import { isAfter } from 'date-fns/isAfter'

export const subscription: Handle = async ({ event, resolve }) => {
	if (!event.locals.user) {
		return await resolve(event)
	}

	event.locals.isPaused = !!event.locals.user.isPaused

	/**
	 * Only check if the subscription is expired if the subscription is not paused
	 */
	if (isAfter(Date.now(), event.locals.user.expiresAt!) && event.locals.isPaused === false) {
		event.locals.isExpired = true
	} else {
		event.locals.isExpired = false
	}

	if (event.locals.isExpired || event.locals.user.isPaused) {
		if (
			event.url.pathname !== '/_' &&
			!event.url.pathname.startsWith('/_/account') &&
			!event.url.pathname.startsWith('/api')
		) {
			redirect(301, '/_')
		}
	}

	return await resolve(event)
}
