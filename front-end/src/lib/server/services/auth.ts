import { error } from '@sveltejs/kit'
import type { Services } from '.'
import { updateItem, updateUser } from '@directus/sdk'

export class AuthService {
	constructor(readonly services: Services) {}

	async login(email: string, password: string, remember: boolean = false) {
		return await this.services.event.locals.directus.login(email, password, { mode: 'json' })
	}

	async changePassword(password: string) {
		return await this.services.event.locals.directus.request(
			updateUser(this.services.state.user!.id, { password })
		)
	}

	async updateProfile(data: { firstName: string; lastName: string }) {
		return await this.services.event.locals.directus.request(
			updateUser(this.services.state.user!.id, {
				first_name: data.firstName,
				last_name: data.lastName
			})
		)
	}
}
