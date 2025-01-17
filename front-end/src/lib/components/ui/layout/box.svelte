<script lang="ts">
	import type { Snippet } from 'svelte'
	import { H } from '../heading'

	type Props = {
		children: Snippet
		title?: Snippet
	}

	const { children, title }: Props = $props()
</script>

<div class="rounded-xl bg-white p-8 shadow-lg">
	{#if title}
		<H level="3" class="mb-2 text-2xl font-bold">{@render title()}</H>
	{/if}
	{@render children()}
</div>
