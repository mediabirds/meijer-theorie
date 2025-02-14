<script lang="ts">
	import type { PracticeExam } from '$lib/server/services/practice-exam'
	import { _ } from 'svelte-i18n'
	import { Button } from '$lib/components/ui/button'
	import { cn } from '$lib/utils'

	type Props = {
		id: number
		exam: PracticeExam
		index: number
		didPass?: boolean | null
	}

	let { id, exam, index, didPass = $bindable(undefined) }: Props = $props()
</script>

<div class="flex items-center gap-2">
	<span
		class={cn(
			'flex flex-grow gap-2 rounded-xl bg-neutral-100 px-6 py-3 text-sm font-medium',
			true === didPass && 'bg-primary-100 text-primary',
			false === didPass && 'bg-destructive-100 text-destructive'
		)}
	>
		<span>#{index}</span>
		<span>{exam.title}</span>
		{#if didPass === true}
			<span>🎉</span>
		{:else if didPass === false}
			<span>😒</span>
		{/if}
	</span>
	<Button
		variant={didPass === undefined || didPass === null ? 'secondary' : 'default'}
		class="w-24"
		href="/_/oefenexamens/{id}/intro"
	>
		{#if didPass === undefined || didPass === null}
			{$_('pages.practice_exams.start')}
		{:else}
			{$_('pages.practice_exams.again')}
		{/if}
	</Button>
</div>
