import { error } from '@sveltejs/kit'

export const load = () => {
	error(404, 'PAGE_NOT_FOUND')
}
