import { readItems } from '@directus/sdk'
import type { Services } from '.'

export type Download = {
	id: string
	file: string
	filename: string
}

export class DownloadsService {
	constructor(private services: Services) {}

	/**
	 * Fetches a list of downloads that the user has access to based on their subscription.
	 *
	 * @returns {Promise<Download[]>}
	 */
	async list() {
		const downloads = await this.services.event.locals.directus.request(
			readItems('subscriptions_downloads', {
				filter: {
					subscriptions_id: { _eq: this.services.state.user!.subscription.subscription.id }
				},
				fields: [{ downloads_id: ['*'] }]
			})
		)

		return downloads.map((d) => d.downloads_id) as Download[]
	}
}
