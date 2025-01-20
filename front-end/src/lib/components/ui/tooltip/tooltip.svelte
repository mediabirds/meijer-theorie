<script lang="ts">
	import { cn } from '$lib/utils'
	import { Tooltip } from 'bits-ui'
	import type { Snippet } from 'svelte'

	type Props = {
		trigger: Snippet<[Record<string, any>]>
		tooltip: string
	}

	let { trigger, tooltip }: Props = $props()
</script>

<Tooltip.Root delayDuration={100}>
	<Tooltip.Trigger>
		{#snippet child({ props })}
			{@render trigger({ props })}
		{/snippet}
	</Tooltip.Trigger>
	<Tooltip.Portal>
		<Tooltip.Content
			sideOffset={6}
			class={cn(
				'border border-neutral-100 bg-secondary-500 px-3 py-1 text-sm text-white',
				'rounded-lg font-medium shadow-lg shadow-black/5'
			)}
		>
			{tooltip}
		</Tooltip.Content>
	</Tooltip.Portal>
</Tooltip.Root>
