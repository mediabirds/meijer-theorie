<script lang="ts">
	import { Logo } from '$lib/components/logo'
	import { site as siteSettings, user } from '$lib/contexts/app'
	import { _, locale } from 'svelte-i18n'

	let { children } = $props()
	let username = $derived(user.get()!.first_name + ' ' + user.get()!.last_name)
	let subscription = $derived(user.get()!.subscription.title)

	const site = siteSettings.get()
</script>

<div class="flex min-h-screen flex-col gap-12">
	<div class="grid flex-grow grid-cols-[350px_1fr]">
		<aside class="flex flex-col gap-12 rounded-ee-3xl bg-white p-8 shadow-lg">
			<span class="text-2xl font-bold">
				<Logo width="200" style="width: 200px;min-width: 200px;" />
			</span>
			<nav class="flex flex-col gap-4">
				<a href="/" class="flex items-center gap-4">
					<span
						class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">📚</span>
					</span>
					<span>{$_('common.dashboard')}</span>
				</a>
				<a href="/_/videocursus" class="flex items-center gap-4">
					<span
						class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">💻</span>
					</span>
					<span>{$_('common.video_courses')}</span>
				</a>
				<a href="/" class="flex items-center gap-4">
					<span
						class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">📝</span>
					</span>
					<span>{$_('common.partice_exams')}</span>
				</a>
				<a href="/" class="flex items-center gap-4">
					<span
						class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span class="relative -mt-1">👤</span>
					</span>
					<span>{$_('common.profile')}</span>
				</a>
			</nav>
		</aside>
		<div>
			<header class="flex items-center justify-between bg-white p-4 font-medium shadow-lg">
				<span>{$_('account.welcome', { values: { username } })}</span>
				<span>{$_('account.subscription', { values: { subscription } })}</span>
			</header>
			<main class="p-8">
				<div class="container">
					{@render children()}
				</div>
			</main>
		</div>
	</div>
	<footer></footer>
</div>
