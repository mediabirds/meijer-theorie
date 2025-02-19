import type { Handle } from '@sveltejs/kit'

/**
 * Adds practice exams to the user object for the current request.
 *
 * If the user has not yet reached their maximum allowed exams, this function
 * fetches additional exams and attaches them to the user. The function then
 * returns an updated list of the user's practice exams.
 */
export const exams: Handle = async ({ event, resolve }) => {
	await event.locals.services.practiceExams().getExamsForUser()
	return await resolve(event)
}
