<script lang="ts">
	import { page } from '$app/state'
	import { Box } from '$lib/components/ui/layout'
	import { cn } from '$lib/utils'
	import { _ } from 'svelte-i18n'

	const { children } = $props()
</script>

<Box title={$_('common.account')} class="max-w-3xl">
	<div class="mb-6 mt-6 flex max-w-3xl gap-2">
		<a
			href="/_/account/gegevens"
			class={cn(
				'border-b-2 border-neutral-100 p-2 transition-colors hover:text-neutral-600',
				page.url.pathname === '/_/account/gegevens' &&
					'border-primary font-bold text-black hover:text-black'
			)}
		>
			{$_('common.personal_data')}
		</a>
		<a
			href="/_/account/mijn-pakket"
			class={cn(
				'border-b-2 border-neutral-100 p-2 transition-colors hover:text-neutral-600',
				page.url.pathname === '/_/account/mijn-pakket' &&
					'border-primary font-bold text-black hover:text-black'
			)}
		>
			{$_('common.my_subscription')}
		</a>
	</div>
	{@render children()}
</Box>
