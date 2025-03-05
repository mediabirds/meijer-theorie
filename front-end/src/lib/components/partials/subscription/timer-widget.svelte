<script lang="ts">
	import { invalidateAll } from '$app/navigation'
	import { Button } from '$lib/components/ui/button'
	import { Box } from '$lib/components/ui/layout'
	import { session } from '$lib/stores/app.svelte'
	import { differenceInMilliseconds } from 'date-fns'
	import { onMount } from 'svelte'
	import { _ } from 'svelte-i18n'

	let currentDate = $state(new Date())
	let interval = $state<Timer>()
	let isSendingPauseRequest = $state(false)

	let expiresIn = $derived.by(() => {
		const ms = differenceInMilliseconds(new Date(session.user?.expiresAt!), currentDate)
		const totalSeconds = Math.floor(ms / 1000)
		const totalMinutes = Math.floor(ms / 60000) // Convert milliseconds to minutes
		const days = Math.floor(totalMinutes / (24 * 60))
		const hours = Math.floor((totalMinutes % (24 * 60)) / 60)
		const minutes = totalMinutes % 60
		const seconds = totalSeconds % 60

		return {
			days,
			hours,
			minutes,
			seconds
		}
	})

	onMount(() => {
		interval = setInterval(() => (currentDate = new Date()), 1000)

		return () => clearInterval(interval)
	})
</script>

<Box
	title={$_('common.subscription_timer_widget.title')}
	description={$_('common.subscription_timer_widget.description', {
		values: { subscription: session.user?.subscription.title }
	})}
>
	<div class="flex gap-2">
		<div class="flex flex-col gap-2 rounded-lg bg-neutral-100 p-3">
			<span class="flex gap-1">
				<span
					class="w-7 rounded-md bg-white py-3 text-center text-xl font-bold xs:w-10 xs:text-3xl"
				>
					{expiresIn.days > 9 ? expiresIn.days.toString().split('')[0] : '0'}
				</span>
				<span
					class="w-7 rounded-md bg-white py-3 text-center text-xl font-bold xs:w-10 xs:text-3xl"
				>
					{expiresIn.days > 9
						? expiresIn.days.toString().split('')[1]
						: expiresIn.days < 0
							? 0
							: expiresIn.days.toString().split('')[0]}
				</span>
			</span>
			<span class="text-sm">
				{expiresIn.days === 1
					? $_('common.subscription_timer_widget.day')
					: $_('common.subscription_timer_widget.days')}
			</span>
		</div>
		<div class="flex flex-col gap-2 rounded-lg bg-neutral-100 p-3">
			<span class="flex gap-1">
				<span
					class="w-7 rounded-md bg-white py-3 text-center text-xl font-bold xs:w-10 xs:text-3xl"
				>
					{expiresIn.hours > 9 ? expiresIn.hours.toString().split('')[0] : '0'}
				</span>
				<span
					class="w-7 rounded-md bg-white py-3 text-center text-xl font-bold xs:w-10 xs:text-3xl"
				>
					{expiresIn.hours > 9
						? expiresIn.hours.toString().split('')[1]
						: expiresIn.hours < 0
							? 0
							: expiresIn.hours.toString().split('')[0]}
				</span>
			</span>
			<span class="text-sm">
				{expiresIn.hours === 1
					? $_('common.subscription_timer_widget.hour')
					: $_('common.subscription_timer_widget.hours')}
			</span>
		</div>
		<div class="flex flex-col gap-2 rounded-lg bg-neutral-100 p-3">
			<span class="flex gap-1">
				<span
					class="w-7 rounded-md bg-white py-3 text-center text-xl font-bold xs:w-10 xs:text-3xl"
				>
					{expiresIn.minutes > 9 ? expiresIn.minutes.toString().split('')[0] : '0'}
				</span>
				<span
					class="w-7 rounded-md bg-white py-3 text-center text-xl font-bold xs:w-10 xs:text-3xl"
				>
					{expiresIn.minutes > 9
						? expiresIn.minutes.toString().split('')[1]
						: expiresIn.minutes < 0
							? 0
							: expiresIn.minutes.toString().split('')[0]}
				</span>
			</span>
			<span class="text-sm">
				{expiresIn.minutes === 1
					? $_('common.subscription_timer_widget.minute')
					: $_('common.subscription_timer_widget.minutes')}
			</span>
		</div>
		<!-- <div class="flex flex-col gap-2 rounded-lg bg-neutral-100 p-3">
			<span class="flex gap-1">
				<span class="xs:w-8 w-10 rounded-md bg-white py-3 text-center text-2xl font-bold xs:text-3xl">
					{expiresIn.seconds > 9 ? expiresIn.seconds.toString().split('')[0] : '0'}
				</span>
				<span class="xs:w-8 w-10 rounded-md bg-white py-3 text-center text-2xl font-bold xs:text-3xl">
					{expiresIn.seconds > 9 ? expiresIn.seconds.toString().split('')[1] : expiresIn.seconds}
				</span>
			</span>
			<span class="text-sm">
				{expiresIn.seconds === 1
					? $_('common.subscription_timer_widget.second')
					: $_('common.subscription_timer_widget.seconds')}
			</span>
		</div> -->
	</div>
	<div class="mt-4 flex gap-2">
		<Button
			variant="secondary"
			onclick={() => {
				isSendingPauseRequest = true

				fetch('/api/subscriptions/pause', {
					method: 'POST'
				}).finally(async () => {
					await invalidateAll()
					isSendingPauseRequest = false
				})
			}}
			spinner={isSendingPauseRequest}
		>
			{$_('common.subscription_timer_widget.pause')}
		</Button>
	</div>
</Box>
