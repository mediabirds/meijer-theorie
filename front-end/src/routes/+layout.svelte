<script lang="ts">
	import { Tooltip } from 'bits-ui'
	import { site, session } from '$lib/stores/app.svelte'
	import { cn, getImageUrl } from '$lib/utils'
	import { GridLoader } from '$lib/components/ui/loader'
	import { _ } from 'svelte-i18n'

	import '@fontsource/poppins/300.css'
	import '@fontsource/poppins/400.css'
	import '@fontsource/poppins/500.css'
	import '@fontsource/poppins/600.css'

	import '../app.css'
	import { Button } from '$lib/components/ui/button'

	let { children, data } = $props()

	$effect(() => {
		session.set({ ...data.session, user: data.user })
		// @ts-ignore
		site.set({ ...data.globals, isExpired: data.isExpired, isPaused: data.isPaused })
	})
</script>

<svelte:head>
	<link rel="icon" href={getImageUrl(site.favicon, { width: 32 })} sizes="32x32" />
	<link rel="icon" href={getImageUrl(site.favicon, { width: 16 })} sizes="16x16" />
</svelte:head>

{#if site.isLoading}
	<div class="flex h-screen w-screen items-center justify-center">
		<GridLoader />
	</div>
{:else}
	<Tooltip.Provider>
		{@render children()}
	</Tooltip.Provider>

	{#if site.whatsapp}
		<div class="group/whatsapp fixed bottom-4 right-4 z-50 flex items-center gap-4">
			<span
				class={cn(
					'rounded-md bg-white px-4 py-2 opacity-0 shadow-xl transition-opacity',
					'group-hover/whatsapp:opacity-100'
				)}
			>
				{$_('common.whatsapp.description')}
			</span>
			<Button
				type="button"
				class={cn(
					'shadow-xl',
					'h-14 w-14 rounded-full bg-[#25D366] text-white',
					'hover:bg-[#1ba84f] hover:text-white'
				)}
				target="_blank"
				href={`https://wa.me/${site.whatsapp}`}
			>
				<svg role="img" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
					><path
						d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"
					/>
				</svg>
			</Button>
		</div>
	{/if}
{/if}
