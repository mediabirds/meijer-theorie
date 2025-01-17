<script lang="ts">
	import { cn } from '$lib/utils'
	import type { Snippet } from 'svelte'
	import type { HTMLAttributes } from 'svelte/elements'

	type Props = {
		level?: '1' | '2' | '3' | '4' | '5' | '6'
		children: Snippet
	} & HTMLAttributes<HTMLHeadingElement>

	const { level = '1', children, ...restProps }: Props = $props()
</script>

<svelte:element
	this={`h${level}`}
	{...restProps}
	class={cn(
		level === '1' && 'text-5xl font-bold',
		level === '2' && 'text-4xl font-semibold',
		level === '3' && 'text-3xl font-semibold',
		level === '4' && 'text-2xl font-semibold',
		level === '5' && 'text-xl font-semibold',
		level === '6' && 'text-lg font-semibold',
		restProps.class
	)}
>
	{@render children()}
</svelte:element>
