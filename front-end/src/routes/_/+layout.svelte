<script lang="ts">
	import { afterNavigate, beforeNavigate } from '$app/navigation'
	import { page } from '$app/state'
	import { Logo } from '$lib/components/logo'
	import { Button } from '$lib/components/ui/button'
	import { Link } from '$lib/components/ui/link'
	import { session, site } from '$lib/stores/app.svelte'
	import { cn } from '$lib/utils'
	import { _ } from 'svelte-i18n'

	let { children } = $props()
	let username = $derived(session.user?.first_name + ' ' + session.user?.last_name)
	let subscription = $derived(session.user?.subscription.title)

	const menuItems = [
		{
			title: $_('common.dashboard'),
			href: '/_',
			icon: '📚'
		},
		{
			title: $_('common.video_courses'),
			href: '/_/videocursus',
			icon: '💻'
		},
		{
			title: $_('common.partice_exams'),
			href: '/_/oefenexamens',
			icon: '📝'
		},
		{
			title: $_('common.profile'),
			href: '/_/account',
			icon: '👤'
		}
	]

	afterNavigate(() => {
		if (page.url.pathname.startsWith('/_/videocursus')) {
			site.isMenuCollapsedEnabled = true
			site.isMenuCollapsed = true
		} else {
			site.isMenuCollapsedEnabled = false
			site.isMenuCollapsed = false
		}
	})
</script>

{#if page.url.pathname.match(/\/_\/oefenexamens\/.+/) && !page.url.pathname.endsWith('/uitslag')}
	<div class="flex min-h-screen flex-col">{@render children()}</div>
{:else}
	<div class="flex min-h-screen flex-col gap-12">
		<div
			class={cn(
				'grid flex-grow grid-cols-[350px_1fr] transition-all',
				site.isMenuCollapsed && 'grid-cols-[110px_1fr]'
			)}
		>
			<aside
				class="flex flex-col gap-12 rounded-ee-3xl bg-white p-8 shadow-lg"
				onmouseenter={() => {
					if (!site.isMenuCollapsedEnabled) {
						return
					}

					site.isMenuCollapsed = false
				}}
				onmouseleave={() => {
					if (!site.isMenuCollapsedEnabled) {
						return
					}

					site.isMenuCollapsed = true
				}}
			>
				<span class="text-2xl font-bold">
					<Logo
						width="200"
						thumbnail={site.isMenuCollapsed}
						class={cn(
							'w-52 min-w-52',
							site.isMenuCollapsed && 'relative -left-1 w-[45px] min-w-[45px]'
						)}
					/>
				</span>
				<nav class="flex flex-grow flex-col gap-4">
					{#each menuItems as item}
						<Link href={item.href} class="flex items-center gap-4">
							<span
								class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
							>
								<span class="relative -mt-1">{item.icon}</span>
							</span>
							<span
								class={cn(
									'text-nowrap transition-all',
									site.isMenuCollapsed && 'invisible opacity-0'
								)}
							>
								{item.title}
							</span>
						</Link>
					{/each}
					<Link href="/account/logout" class="mt-auto flex items-center gap-4">
						<span
							class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
						>
							<span class="relative -mt-1">🔓</span>
						</span>
						<span
							class={cn(
								'text-nowrap transition-all',
								site.isMenuCollapsed && 'invisible opacity-0'
							)}
						>
							{$_('common.logout')}
						</span>
					</Link>
				</nav>
			</aside>
			<div class="min-h-screen">
				<header class="flex items-center justify-between bg-white p-6 font-medium shadow-lg">
					<span class="flex items-center gap-4">
						{$_('account.welcome', { values: { username } })}
					</span>
					<span>
						{$_('account.subscription', { values: { subscription } })}
					</span>
				</header>
				<main class="p-8">
					<div class="container">
						{@render children()}
					</div>
				</main>
			</div>
		</div>
	</div>
{/if}
