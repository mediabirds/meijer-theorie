<script lang="ts">
	import * as Form from '$lib/components/ui/form'
	import { _ } from 'svelte-i18n'
	import { superForm } from 'sveltekit-superforms'
	import { zodClient } from 'sveltekit-superforms/adapters'
	import { dataSchema, passwordSchema } from './schema'
	import { Label } from '$lib/components/ui/label'
	import { Input } from '$lib/components/ui/input'
	import { H } from '$lib/components/ui/heading'
	import { Alert } from '$lib/components/ui/alert'

	const { data } = $props()
	const dataForm = superForm(data.dataForm, {
		validators: zodClient(dataSchema),
		invalidateAll: true
	})
	const passwordForm = superForm(data.passwordForm, {
		validators: zodClient(passwordSchema),
		invalidateAll: true
	})

	const {
		form: dataFormData,
		enhance: dataEnhance,
		submitting: dataSubmitting,
		message: dataMessage
	} = dataForm
	const {
		form: passwordFormData,
		enhance: passwordEnhance,
		submitting: passwordSubmitting,
		message: passwordMessage
	} = passwordForm
</script>

<form
	method="POST"
	class="mt-6 rounded-xl bg-neutral-100 p-8"
	action="?/changeData"
	use:dataEnhance
>
	<H level="5" class="mb-6">{$_('pages.account.change_data.title')}</H>
	{#if $dataMessage?.code === 'INVALID_DATA'}
		<Alert variant="destructive">
			{$_('pages.account.change_data.error')}
		</Alert>
	{/if}
	{#if $dataMessage?.success === true}
		<Alert variant="success">
			{$_('pages.account.change_data.success')}
		</Alert>
	{/if}
	<div class="mt-6 grid gap-4 lg:grid-cols-2">
		<Form.Field form={dataForm} name="firstName">
			<Form.Control>
				{#snippet children({ props })}
					<Label>{$_('pages.account.change_data.first_name')}</Label>
					<Input {...props} type="text" bind:value={$dataFormData.firstName} />
				{/snippet}
			</Form.Control>
			<Form.FieldErrors />
		</Form.Field>
		<Form.Field form={dataForm} name="lastName">
			<Form.Control>
				{#snippet children({ props })}
					<Label>{$_('pages.account.change_data.last_name')}</Label>
					<Input {...props} type="text" bind:value={$dataFormData.lastName} />
				{/snippet}
			</Form.Control>
			<Form.FieldErrors />
		</Form.Field>
		<Form.Field form={dataForm} name="email">
			<Form.Control>
				{#snippet children({ props })}
					<Label>{$_('pages.account.change_data.email')}</Label>
					<Input {...props} type="email" value={$dataFormData.email} disabled />
				{/snippet}
			</Form.Control>
			<Form.FieldErrors />
		</Form.Field>
	</div>
	<div class="mt-4 flex justify-end">
		<Form.Button variant="secondary" spinner={$dataSubmitting} disabled={$dataSubmitting}>
			{$_('pages.account.change_data.submit')}
		</Form.Button>
	</div>
</form>
<form
	method="POST"
	class="mt-6 rounded-xl bg-neutral-100 p-8"
	action="?/changePassword"
	use:passwordEnhance
>
	<H level="5" class="mb-6">{$_('pages.account.change_password.title')}</H>
	{#if $passwordMessage?.code === 'INVALID_DATA'}
		<Alert variant="destructive">
			{$_('pages.account.change_password.error')}
		</Alert>
	{/if}
	{#if $passwordMessage?.success === true}
		<Alert variant="success">
			{$_('pages.account.change_password.success')}
		</Alert>
	{/if}
	<div class="mt-6 grid gap-4 lg:grid-cols-2">
		<Form.Field form={passwordForm} name="password">
			<Form.Control>
				{#snippet children({ props })}
					<Label>{$_('account.password')}</Label>
					<Input {...props} type="password" bind:value={$passwordFormData.password} />
				{/snippet}
			</Form.Control>
			<Form.FieldErrors />
		</Form.Field>
		<Form.Field form={passwordForm} name="confirmPassword">
			<Form.Control>
				{#snippet children({ props })}
					<Label>{$_('account.confirm_password')}</Label>
					<Input {...props} type="password" bind:value={$passwordFormData.confirmPassword} />
				{/snippet}
			</Form.Control>
			<Form.FieldErrors />
		</Form.Field>
	</div>
	<div class="mt-4 flex justify-end">
		<Form.Button variant="secondary" spinner={$passwordSubmitting} disabled={$passwordSubmitting}>
			{$_('pages.account.change_password.submit')}
		</Form.Button>
	</div>
</form>
