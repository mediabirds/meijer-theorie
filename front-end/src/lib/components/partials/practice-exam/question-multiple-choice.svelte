<script lang="ts">
	import Radio from '$lib/components/ui/input/radio.svelte'
	import { cn } from '$lib/utils'

	type Props = {
		answers: { label: string; isCorrectAnswer: boolean }[]
	}

	let { answers }: Props = $props()

	console.log(answers)
</script>

<div class="mt-6 flex flex-col gap-2">
	{#each answers as answer}
		<label class={cn('rounded-lg bg-neutral-100 px-6 py-4')}>
			<Radio />
			<label class="font-medium">{answer.label}</label>
		</label>
	{/each}
</div>
