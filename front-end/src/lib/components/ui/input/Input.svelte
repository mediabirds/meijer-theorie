<script lang="ts">
	import { cn } from '$lib/utils'
	import type { HTMLInputAttributes } from 'svelte/elements'

	type Props = {
		value: string | number
	} & HTMLInputAttributes

	let { value = $bindable(), ...restProps } = $props()
</script>

<input
	bind:value
	{...restProps}
	class={cn(
		'rounded-md bg-white px-6 py-2.5 shadow-lg autofill:shadow-[inset_0_0_0px_1000px_rgb(255,255,255)]',
		'focus-within:ring-offset-background outline-none focus-within:ring-2 focus-within:ring-primary focus-within:ring-offset-2'
	)}
/>
