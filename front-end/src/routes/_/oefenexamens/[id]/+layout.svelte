<script lang="ts">
	import { Logo } from '$lib/components/logo'
	import { Button } from '$lib/components/ui/button'
	import { H } from '$lib/components/ui/heading'
	import { exam, session } from '$lib/stores/app.svelte'
	import { _ } from 'svelte-i18n'
	import { fly } from 'svelte/transition'
	import { expoInOut } from 'svelte/easing'
	import DotIcon from 'lucide-svelte/icons/dot'

	let { children } = $props()
	let username = $derived(session.user?.first_name + ' ' + session.user?.last_name)

	$effect(() => {
		console.log(exam)
	})
</script>

<header class="bg-white p-4 shadow-lg">
	<div class="container flex items-center justify-between">
		<span class="flex items-center gap-4">
			<Logo thumbnail width="35" />
			<span class="font-medium">
				{$_('pages.practice_exams.good_luck', { values: { username } })}
			</span>
		</span>
		{#if exam.isStarted && exam.timeLimitInMinutes > 0}
			<span>
				{@html $_('pages.practice_exams.time_left', { values: { time: exam.timeLimitInMinutes } })}
			</span>
		{/if}
		<Button href="/_/oefenexamens">
			{$_('pages.practice_exams.leave_exam')}
		</Button>
	</div>
</header>
<main class="flex flex-grow flex-col overflow-clip">
	{#if exam.isStarted}
		{@render children()}
	{:else}
		<div
			class="bg-shape flex h-full flex-grow items-center justify-center bg-white"
			transition:fly={{
				y: document.body.clientHeight,
				duration: 600,
				opacity: 0,
				easing: expoInOut
			}}
		>
			<div class="flex max-w-2xl flex-col gap-6">
				<H level="2" class="self-start">
					{exam.current?.exam.title}
				</H>
				<div class=" rounded-xl bg-neutral-100 p-8 shadow-lg">
					<p>{$_('pages.practice_exams.description')}</p>
					<div class="mt-4 rounded-lg bg-white p-6">
						<span class="font-medium">{$_('common.components')}</span>
						<ul class="mt-1">
							{#each exam.current?.exam.components! as component}
								<li class="flex items-center gap-1">
									<DotIcon strokeWidth="5" class="text-primary" />
									{component.title}
								</li>
							{/each}
						</ul>
					</div>
					<Button type="button" onclick={() => exam.start()} class="mt-8" variant="secondary">
						{$_('pages.practice_exams.start_exam')}
					</Button>
				</div>
			</div>
		</div>
	{/if}
</main>
