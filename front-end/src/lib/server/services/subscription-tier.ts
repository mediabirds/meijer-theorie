import { readItem } from '@directus/sdk'
import type { Services } from '.'

export type SubscriptionTier = Directus.SchemaMapper<
	Directus.SubscriptionTiers,
	{
		subscription: Directus.Subscriptions
	}
>

export class SubscriptionTierService {
	/**
	 * Creates a new instance of the SubscriptionTierService service.
	 *
	 * @param {string} id - The id of the subscription tier.
	 * @returns {SubscriptionTierService} The SubscriptionTierService service instance.
	 */
	constructor(
		public services: Services,
		public id: string
	) {}

	/**
	 * Fetches the subscription tier and its associated subscription
	 * @returns The fetch promise
	 */
	fetch() {
		return this.services.event.locals.directus.request<SubscriptionTier>(
			readItem('subscription_tiers', this.id, {
				fields: ['*', { subscription: ['*'] }]
			})
		)
	}
}
