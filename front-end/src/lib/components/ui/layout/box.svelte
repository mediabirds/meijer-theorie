<script lang="ts">
	import type { Snippet } from 'svelte'
	import { H } from '../heading'
	import type { HTMLAttributes } from 'svelte/elements'
	import { cn } from '$lib/utils'

	type Props = {
		children: Snippet
		title?: Snippet
	} & Omit<HTMLAttributes<HTMLDivElement>, 'title'>

	const { children, title, ...restProps }: Props = $props()
</script>

<div {...restProps} class={cn('rounded-3xl bg-white p-6 shadow-lg', restProps.class)}>
	{#if title}
		{@render title()}
	{/if}
	{@render children()}
</div>
