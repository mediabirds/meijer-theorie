<script lang="ts">
	import { Logo } from '$lib/components/logo'
	import { Button } from '$lib/components/ui/button'
	import { exam, session } from '$lib/stores/app.svelte'
	import { onMount } from 'svelte'
	import { _ } from 'svelte-i18n'

	let { children, data } = $props()
	let username = $derived(session.user?.first_name + ' ' + session.user?.last_name)

	onMount(() => {
		exam.init(data.practiceExam.exam)
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
		<Button href="/_/oefenexamens">
			{$_('pages.practice_exams.leave_exam')}
		</Button>
	</div>
</header>
<main class="flex flex-grow flex-col overflow-clip p-4">
	{@render children()}
</main>
