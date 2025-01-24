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
	<input type="radio" bind:checked {...restProps} class={cn('hidden')} {id} />
	<label for={id} class="cursor-pointer">{label}</label>
</div>
