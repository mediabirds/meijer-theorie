<script>
	import { superForm } from 'sveltekit-superforms'
	import { zodClient } from 'sveltekit-superforms/adapters'
	import * as Form from '$lib/components/ui/form'
	import { schema } from './schema'
	import { H } from '$lib/components/ui/heading'
	import { Checkbox, Input } from '$lib/components/ui/input'
	import { _ } from 'svelte-i18n'
	import { cn } from '$lib/utils'
	import { Label } from '$lib/components/ui/label'
	import { Alert } from '$lib/components/ui/alert'

	let { data } = $props()

	const form = superForm(data.form, {
		validators: zodClient(schema),
		invalidateAll: 'force'
	})
	const { form: formData, enhance, submitting, message } = form

	$inspect($message)
</script>

<div class="container flex flex-col items-center px-8">
	<H level="1" class="mb-8">{$_('account.login.title')}</H>
	<form
		class={cn('w-full rounded-3xl bg-neutral-100 p-8 shadow-lg sm:w-[550px]')}
		method="POST"
		use:enhance
	>
		{#if $message?.code === 'INVALID_CREDENTIALS'}
			<Alert variant="destructive" class="mb-6">{$_('account.login.invalid_credentials')}</Alert>
		{/if}
		<div class="flex flex-col gap-4">
			<Form.Field {form} name="username">
				<Form.Control>
					{#snippet children({ props })}
						<Label>{$_('account.login.username')}</Label>
						<Input {...props} type="email" bind:value={$formData.username} />
					{/snippet}
				</Form.Control>
				<Form.FieldErrors />
			</Form.Field>
			<Form.Field {form} name="password">
				<Form.Control>
					{#snippet children({ props })}
						<Label>{$_('account.login.password')}</Label>
						<Input {...props} type="password" bind:value={$formData.password} />
					{/snippet}
				</Form.Control>
				<Form.FieldErrors />
			</Form.Field>
			<Form.Field {form} name="remember">
				<Form.Control>
					{#snippet children({ props })}
						<Checkbox
							{...props}
							bind:checked={$formData.remember}
							label={$_('account.login.remember')}
						/>
					{/snippet}
				</Form.Control>
				<Form.FieldErrors />
			</Form.Field>
		</div>
		<Form.Button variant="secondary" class="mt-6 w-full" spinner={$submitting}>
			{$_('account.login.submit')}
		</Form.Button>
	</form>
</div>
