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
			<span class="flex hidden items-center gap-4 sm:block">
				<Logo thumbnail width="35" />
				<span class="hidden overflow-hidden text-ellipsis text-nowrap font-medium md:block">
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
			<Button href="/_/oefenexamens">
				{$_('pages.practice_exams.leave_exam')}
			</Button>
		</div>
	</header>
{/if}
<main class="flex flex-grow flex-col overflow-clip md:p-4">
	{@render children()}
</main>
