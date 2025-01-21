<script lang="ts">
	import { Box } from '$lib/components/ui/layout'
	import * as Form from '$lib/components/ui/form'
	import { _ } from 'svelte-i18n'
	import { superForm } from 'sveltekit-superforms'
	import { zodClient } from 'sveltekit-superforms/adapters'
	import { dataSchema, passwordSchema } from './schema'
	import { Label } from '$lib/components/ui/label'
	import { Input } from '$lib/components/ui/input'
	import { H } from '$lib/components/ui/heading'

	const { data } = $props()
	const dataForm = superForm(data.dataForm, {
		validators: zodClient(dataSchema)
	})
	const passwordForm = superForm(data.passwordForm, {
		validators: zodClient(passwordSchema)
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

	// TODO: Finish implementation
</script>

<Box title={$_('common.account')} class="max-w-3xl">
	<form method="POST" class="mt-6 rounded-xl bg-neutral-100 p-8">
		<H level="5" class="mb-6">{$_('account.data')}</H>
		<div class="grid grid-cols-2 gap-4">
			<Form.Field form={dataForm} name="firstName">
				<Form.Control>
					{#snippet children({ props })}
						<Label>{$_('account.first_name')}</Label>
						<Input {...props} type="text" bind:value={$dataFormData.firstName} />
					{/snippet}
				</Form.Control>
				<Form.FieldErrors />
			</Form.Field>
			<Form.Field form={dataForm} name="lastName">
				<Form.Control>
					{#snippet children({ props })}
						<Label>{$_('account.last_name')}</Label>
						<Input {...props} type="text" bind:value={$dataFormData.lastName} />
					{/snippet}
				</Form.Control>
				<Form.FieldErrors />
			</Form.Field>
			<Form.Field form={dataForm} name="email">
				<Form.Control>
					{#snippet children({ props })}
						<Label>{$_('account.email')}</Label>
						<Input {...props} type="email" bind:value={$dataFormData.email} disabled />
					{/snippet}
				</Form.Control>
				<Form.FieldErrors />
			</Form.Field>
		</div>
	</form>
	<form method="POST" class="mt-6 rounded-xl bg-neutral-100 p-8" use:passwordEnhance>
		<H level="5" class="mb-6">{$_('account.password')}</H>
		<div class="mt-6 grid grid-cols-2 gap-4">
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
				{$_('account.change_password')}
			</Form.Button>
		</div>
	</form>
</Box>
