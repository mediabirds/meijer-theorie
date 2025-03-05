<script lang="ts">
	import { page } from '$app/state'
	import { Logo } from '$lib/components/logo'
	import { Button } from '$lib/components/ui/button'
	import { exam, session } from '$lib/stores/app.svelte'
	import { onMount } from 'svelte'
	import { _ } from 'svelte-i18n'

	let { children, data } = $props()
	let username = $derived(session.user?.first_name + ' ' + session.user?.last_name)

	onMount(() => {
		// @ts-ignore
		exam.init(data.practiceExam)
	})
</script>

{#if !page.url.pathname.endsWith('/uitslag')}
	<header class="bg-white p-4 shadow-lg">
		<div class="container flex items-center justify-between">
			<span class="flex items-center gap-4">
				<Logo thumbnail width="35" />
				<span class="overflow-hidden text-ellipsis text-nowrap font-medium">
					{$_('pages.practice_exams.good_luck', { values: { username } })}
				</span>
			</span>
			{#if exam.componentTimer}
				<span class="text-center md:col-start-2">
					{@html $_('pages.practice_exams.time_remaining', {
						values: { time: `${exam.componentTimer.minutes}:${exam.componentTimer.seconds}` }
					})}
				</span>
			{/if}
			{#if exam.questionTimer}
				<span class="flex items-center">
					<span class="relative top-[1px] w-6 font-medium"
						>{(exam.questionTimer.value / 1000).toFixed(0)}</span
					>
					<span class="block h-4 w-16 overflow-clip rounded-full bg-primary-200">
						<span
							class="block h-full w-full bg-primary"
							style={`width: ${100 - (exam.questionTimer.value / 1000 / exam.currentComponent!.timeLimitPerQuestionSeconds!) * 100}%;`}
						></span>
					</span>
				</span>
			{/if}
			<Button href="/_/oefenexamens">
				{$_('pages.practice_exams.leave_exam')}
			</Button>
		</div>
	</header>
{/if}
<main class="flex flex-grow flex-col overflow-clip md:p-4">
	{@render children()}
</main>
