<script lang="ts">
	import { page } from '$app/state'
	import { Logo } from '$lib/components/logo'
	import Drawer from '$lib/components/ui/drawer/drawer.svelte'
	import { H } from '$lib/components/ui/heading'
	import { Box } from '$lib/components/ui/layout'
	import { Link } from '$lib/components/ui/link'
	import { SocialLink } from '$lib/components/ui/social'
	import { session, site } from '$lib/stores/app.svelte'
	import { cn } from '$lib/utils'
	import { debounce } from 'lodash-es'
	import { _ } from 'svelte-i18n'
	import { innerWidth } from 'svelte/reactivity/window'
	import MenuIcon from 'lucide-svelte/icons/menu'
	import XIcon from 'lucide-svelte/icons/x'
	import { afterNavigate } from '$app/navigation'

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
			icon: '💻',
			subscription: true
		},
		{
			title: $_('common.partice_exams'),
			href: '/_/oefenexamens',
			icon: '📝',
			subscription: true
		},
		{
			title: $_('common.profile'),
			href: '/_/account',
			icon: '👤'
		}
	]

	$effect(() => {
		const shouldCollapseMenu =
			page.url.pathname.startsWith('/_/videocursus') ||
			(innerWidth.current !== undefined && innerWidth.current < 1180)

		site.isMenuCollapsedEnabled = shouldCollapseMenu
		site.isMenuCollapsed = shouldCollapseMenu
	})

	afterNavigate(() => {
		site.mobileMenuOpen = false
	})
</script>

{#if page.url.pathname.match(/\/_\/oefenexamens\/.+/) && !page.url.pathname.endsWith('/uitslag')}
	<div class="flex min-h-screen flex-col">{@render children()}</div>
{:else}
	<div class="flex min-h-screen flex-col gap-12">
		<div
			class={cn(
				'grid flex-grow grid-cols-[350px_1fr] transition-all',
				site.isMenuCollapsed && 'grid-cols-[110px_1fr]',
				innerWidth.current && innerWidth.current <= 640 && 'grid-cols-1'
			)}
		>
			{#if innerWidth.current && innerWidth.current >= 640}
				<aside
					class="flex flex-col gap-12 rounded-ee-3xl bg-white p-8 shadow-lg"
					onmouseenter={debounce(() => {
						if (!site.isMenuCollapsedEnabled) {
							return
						}

						site.isMenuCollapsed = false
					}, 100)}
					onmouseleave={debounce(() => {
						if (!site.isMenuCollapsedEnabled) {
							return
						}

						site.isMenuCollapsed = true
					}, 100)}
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
							<Link
								href={item.href}
								class={cn(
									'flex items-center gap-4',
									item.subscription &&
										(site.isExpired || site.isPaused) &&
										'pointer-events-none text-neutral-400',
									item.subscription && (site.isExpired || site.isPaused) && 'hover:text-neutral-400'
								)}
							>
								<span
									class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
								>
									<span
										class={cn(
											'relative -mt-1',
											item.subscription && (site.isExpired || site.isPaused) && 'opacity-30'
										)}
									>
										{item.icon}
									</span>
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
			{/if}
			<div class="">
				<header
					class="flex items-center justify-between bg-white px-6 py-4 font-medium shadow-lg sm:p-6"
				>
					<span class="flex items-center gap-4">
						{$_('account.welcome', { values: { username } })}
					</span>
					<span class="flex items-center">
						<span class="hidden sm:block">
							{$_('account.subscription', { values: { subscription } })}
						</span>
						<button
							class={cn(
								'rounded-md bg-primary p-2 text-white outline-none transition-colors sm:hidden',
								site.mobileMenuOpen && 'bg-secondary'
							)}
							onclick={() => (site.mobileMenuOpen = !site.mobileMenuOpen)}
						>
							{#if site.mobileMenuOpen}
								<XIcon />
							{:else}
								<MenuIcon />
							{/if}
						</button>
					</span>
				</header>
				<main class="p-6">
					<div class="container">
						{@render children()}
					</div>
				</main>
			</div>
		</div>
		<footer class="mb-12 px-6">
			<div class="container">
				<Box>
					<div class="grid gap-y-12 md:grid-cols-[35%_1fr] lg:grid-cols-2">
						<div class="flex flex-col">
							<Logo width="200" />
						</div>
						<div class="flex flex-col gap-12 md:flex-row md:justify-end">
							<div class="flex flex-col gap-1">
								<H level="6" class="mb-2">{$_('common.contact')}</H>
								<span>
									<Link href={`mailto:${site.contactMail}`}>
										{site.contactMail}
									</Link>
								</span>
								<span>KVK: {site.kvk}</span>
							</div>
							<div class="md:text-end">
								<H level="6" class="mb-2 text-nowrap">{$_('common.social_media')}</H>
								<div class="flex flex-wrap gap-2 md:justify-end">
									{#each site.social_links as link}
										<SocialLink {...link} />
									{/each}
								</div>
							</div>
						</div>
					</div>
					<div class="mt-12 flex flex-col justify-between md:flex-row">
						<span class="mt-auto">© {site.title} {new Date().getFullYear()}</span>
						<span>
							Platform door
							<Link
								href="https://mediabirds.nl"
								target="_blank"
								rel="noopener noreferrer"
								class="font-extrabold"
							>
								Mediabirds
							</Link>
						</span>
					</div>
				</Box>
			</div>
		</footer>
	</div>
{/if}
<Drawer bind:open={site.mobileMenuOpen}>
	<aside class="flex w-full flex-col gap-12">
		<span class="flex items-center justify-between text-2xl font-bold">
			<Logo width="200" class={cn('w-52 min-w-52')} />
			<button
				class={cn(
					'rounded-md bg-primary p-2 text-white outline-none transition-colors sm:hidden',
					site.mobileMenuOpen && 'bg-secondary'
				)}
				onclick={() => (site.mobileMenuOpen = !site.mobileMenuOpen)}
			>
				{#if site.mobileMenuOpen}
					<XIcon />
				{:else}
					<MenuIcon />
				{/if}
			</button>
		</span>
		<nav class="flex flex-grow flex-col gap-4">
			{#each menuItems as item}
				<Link
					href={item.href}
					class={cn(
						'flex items-center gap-4',
						item.subscription &&
							(site.isExpired || site.isPaused) &&
							'pointer-events-none text-neutral-400',
						item.subscription && (site.isExpired || site.isPaused) && 'hover:text-neutral-400'
					)}
				>
					<span
						class="flex min-h-11 min-w-11 items-center justify-center rounded-md bg-neutral-100 text-2xl"
					>
						<span
							class={cn(
								'relative -mt-1',
								item.subscription && (site.isExpired || site.isPaused) && 'opacity-30'
							)}
						>
							{item.icon}
						</span>
					</span>
					<span class={cn('text-nowrap transition-all')}>
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
				<span class={cn('text-nowrap transition-all')}>
					{$_('common.logout')}
				</span>
			</Link>
		</nav>
	</aside>
</Drawer>
