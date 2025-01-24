<script lang="ts">
	import { Breadcrumbs } from '$lib/components/ui/breadcrumbs'
	import PracticeExam from '$lib/components/partials/practice-exam/practice-exam.svelte'
	import { Box } from '$lib/components/ui/layout'
	import { _ } from 'svelte-i18n'

	const { data } = $props()
</script>

<Breadcrumbs />
<Box title={$_('pages.practice_exams.title')} class="mt-6 max-w-4xl">
	<div class="mt-6 space-y-4">
		{#each data.exams as { exam, didPass }, i}
			<PracticeExam {exam} {didPass} index={i + 1} />
		{/each}
	</div>
</Box>
