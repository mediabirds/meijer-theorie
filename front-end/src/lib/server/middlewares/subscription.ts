import { redirect, type Handle } from '@sveltejs/kit'
import { differenceInWeeks } from 'date-fns'
import { isAfter } from 'date-fns/isAfter'

export const subscription: Handle = async ({ event, resolve }) => {
	if (!event.locals.user) {
		return await resolve(event)
	}

	event.locals.isPaused = !!event.locals.user.isPaused

	/**
	 * Can only pause subscription for a maximum of 4 weeks
	 * If greater than that, resume the subscription
	 */
	if (event.locals.user.expiresAt) {
		const difference = differenceInWeeks(new Date(), event.locals.user.expiresAt!)

		if (difference >= 4) {
			await event.locals.services.user().resumeSubscription()
		}
	}

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
