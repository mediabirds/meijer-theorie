import { readItems } from '@directus/sdk'
import type { Services } from '.'

export type Subscription = Directus.SchemaMapper<
	Directus.Subscriptions,
	{
		tiers: Directus.SubscriptionTiers[]
	}
>

export class SubscriptionsService {
	constructor(public services: Services) {}

	/**
	 * Fetches a list of subscriptions from the Directus API.
	 *
	 * @returns {Promise<Subscription[]>} A promise that resolves to an array of Subscription objects,
	 * each containing their respective tiers.
	 */
	list(): Promise<Subscription[]> {
		return this.services.event.locals.directus.request<Subscription[]>(
			readItems('subscriptions', {
				fields: ['*', { tiers: ['*'] }]
			})
		)
	}
}
