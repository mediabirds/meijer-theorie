<script lang="ts">
	import { invalidateAll } from '$app/navigation'
	import PracticeExam from '$lib/components/partials/practice-exam/practice-exam.svelte'
	import { TimerWidget } from '$lib/components/partials/subscription'
	import { VideoCourse } from '$lib/components/partials/video-course/index.js'
	import { Button } from '$lib/components/ui/button/index.js'
	import H from '$lib/components/ui/heading/H.svelte'
	import { Box } from '$lib/components/ui/layout'
	import { site } from '$lib/stores/app.svelte.js'
	import { sortBy } from 'lodash-es'
	import { _ } from 'svelte-i18n'

	const { data } = $props()
	const currentVideoCourse = $derived.by(() => {
		const course = data.videoCourses.find((videoCourse) =>
			videoCourse.chapters.find((chapter) => !chapter.didFinish)
		)

		if (!course) {
			return data.videoCourses[0]
		}

		return course
	})

	let isRequestingResume = $state(false)
</script>

<div class="container">
	{#if site.isPaused}
		<Box>
			<div
				class="mx-auto flex max-w-2xl flex-col items-center justify-center gap-4 py-12 text-center"
			>
				<H level="2">{$_('common.subscription_paused.title')}</H>
				<p>{$_('common.subscription_paused.description')}</p>
				<Button
					variant="secondary"
					onclick={() => {
						isRequestingResume = true

						fetch('/api/subscriptions/resume', {
							method: 'POST'
						}).finally(async () => {
							await invalidateAll()
							isRequestingResume = false
						})
					}}
					spinner={isRequestingResume}
				>
					{$_('common.subscription_paused.button')}
				</Button>
			</div>
		</Box>
	{:else if site.isExpired}
		<Box>
			<div
				class="mx-auto flex max-w-2xl flex-col items-center justify-center gap-4 py-12 text-center"
			>
				<H level="2">{$_('common.subscription_expired.title')}</H>
				<p>{$_('common.subscription_expired.description')}</p>
				<Button href="https://meijertheoriecursus.nl/pakketten/" variant="secondary">
					{$_('common.subscription_expired.button')}
				</Button>
			</div>
		</Box>
	{:else}
		<div class="grid grid-cols-1 items-start gap-6 lg:grid-cols-2">
			<div class="flex flex-col gap-6">
				{#if currentVideoCourse}
					<VideoCourse
						course={currentVideoCourse}
						title={$_('common.video_course.title')}
						description={$_('common.video_course.description')}
					/>
				{/if}
				<TimerWidget />
			</div>
			<div class="flex flex-col gap-6">
				<Box
					title={$_('common.practice_exam.title')}
					class="max-w-4xl"
					description={$_('common.practice_exam.description')}
				>
					<div class="mt-6 space-y-4">
						{#each sortBy(data.user?.practiceExams, 'exam.order') as { id, exam, didPass }, i}
							<PracticeExam {id} {exam} {didPass} index={i + 1} />
						{/each}
					</div>
				</Box>
			</div>
		</div>
	{/if}
</div>
