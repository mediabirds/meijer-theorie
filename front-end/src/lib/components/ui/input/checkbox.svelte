<script lang="ts">
	import { cn } from '$lib/utils'
	import type { HTMLInputAttributes } from 'svelte/elements'

	type Props = {
		checked: boolean
		label: string
	} & HTMLInputAttributes

	let { checked = $bindable(), label, ...restProps }: Props = $props()
	let id = '_' + crypto.randomUUID()
</script>

<div class="flex items-center gap-2">
	<label
		class={cn(
			'group h-5 w-5 rounded border-2 p-[2px]',
			'has-[input:checked]:border-primary',
			'transition-colors'
		)}
	>
		<span
			class="bg-transparent block h-full w-full rounded transition-colors group-has-[input:checked]:bg-primary"
		></span>
		<input type="checkbox" bind:checked {...restProps} class={cn('peer hidden')} {id} />
	</label>
	<label for={id}>{label}</label>
</div>
