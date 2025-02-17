<script lang="ts">
	import PracticeExam from '$lib/components/partials/practice-exam/practice-exam.svelte'
	import { TimerWidget } from '$lib/components/partials/subscription'
	import { VideoCourse } from '$lib/components/partials/video-course/index.js'
	import { Box } from '$lib/components/ui/layout'
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
</script>

<div class="container">
	<div class="grid grid-cols-1 items-start gap-6 lg:grid-cols-2">
		<VideoCourse
			course={currentVideoCourse}
			title={$_('common.video_course.title')}
			description={$_('common.video_course.description')}
		/>
		<Box
			title={$_('common.practice_exam.title')}
			class="max-w-4xl"
			description={$_('common.practice_exam.description')}
		>
			<div class="mt-6 space-y-4">
				{#each data.user?.practiceExams! as { id, exam, didPass }, i}
					<PracticeExam {id} {exam} {didPass} index={i + 1} />
				{/each}
			</div>
		</Box>
		<TimerWidget />
	</div>
</div>
