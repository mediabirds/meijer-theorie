import type { AuthenticationData } from '@directus/sdk'
import type { createClient } from './lib/directus'
import type { Services } from '$lib/server/services'

// See https://svelte.dev/docs/kit/types#app.d.ts
// for information about these interfaces
declare global {
	namespace App {
		// interface Error {}
		interface Locals {
			directus: ReturnType<typeof createClient>
			globals: Directus.Globals
			session: AuthenticationData | null
			user: Directus.SchemaMapper<
				Directus.DirectusUsers,
				{
					videoCourses: Directus.SchemaMapper<
						Directus.UserVideoCourses,
						{
							videoCourse: Directus.VideoCourses
							lessonsFinished: string[]
						}
					>[]
					subscription: Directus.SchemaMapper<
						Directus.SubscriptionTiers,
						{ subscription: { type: 'car' | 'scooter' | 'motor' } }
					>
					practiceExams: Directus.SchemaMapper<
						Directus.UserExams,
						{ exam: Directus.PracticeExams }
					>[]
				}
			> | null
			services: Services
		}
		// interface PageData {}
		// interface PageState {}
		// interface Platform {}
	}

	namespace Directus {
		export type BlockButton = {
			button_group?: string | BlockButtonGroup | null
			id: string
			label?: string | null
			page?: string | Pages | null
			post?: string | Posts | null
			sort?: number | null
			type?: string | null
			url?: string | null
			variant?: string | null
		}

		export type BlockButtonGroup = {
			buttons: any[] | BlockButton[]
			id: string
			sort?: number | null
		}

		export type BlockForm = {
			form?: string | Forms | null
			headline?: string | null
			id: string
			tagline?: string | null
		}

		export type BlockGallery = {
			headline?: string | null
			id: string
			items: any[] | BlockGalleryItems[]
			tagline?: string | null
		}

		export type BlockGalleryItems = {
			block_gallery?: string | BlockGallery | null
			directus_file?: string | DirectusFiles | null
			id: string
			sort?: number | null
		}

		export type BlockHero = {
			alignment?: string | null
			button_group?: string | BlockButtonGroup | null
			description?: string | null
			headline?: string | null
			id: string
			image?: string | DirectusFiles | null
			layout?: string | null
			tagline?: string | null
		}

		export type BlockPosts = {
			collection?: string | null
			headline?: string | null
			id: string
			tagline?: string | null
		}

		export type BlockPricing = {
			headline?: string | null
			id: string
			pricing_cards: any[] | BlockPricingCards[]
			tagline?: string | null
		}

		export type BlockPricingCards = {
			badge?: string | null
			button?: string | BlockButton | null
			description?: string | null
			features?: unknown | null
			id: string
			is_highlighted?: boolean | null
			price?: string | null
			pricing?: string | BlockPricing | null
			sort?: number | null
			title?: string | null
		}

		export type BlockRichtext = {
			alignment?: string | null
			content?: string | null
			headline?: string | null
			id: string
			tagline?: string | null
		}

		export type DirectusAccess = {
			id: string
			policy: string | DirectusPolicies
			role?: string | DirectusRoles | null
			sort?: number | null
			user?: string | DirectusUsers | null
		}

		export type DirectusActivity = {
			action: string
			collection: string
			id: number
			ip?: string | null
			item: string
			origin?: string | null
			revisions: any[] | DirectusRevisions[]
			timestamp: string
			user?: string | DirectusUsers | null
			user_agent?: string | null
		}

		export type DirectusCollections = {
			accountability?: string | null
			archive_app_filter: boolean
			archive_field?: string | null
			archive_value?: string | null
			collapse: string
			collection: string
			color?: string | null
			display_template?: string | null
			group?: string | DirectusCollections | null
			hidden: boolean
			icon?: string | null
			item_duplication_fields?: unknown | null
			note?: string | null
			preview_url?: string | null
			singleton: boolean
			sort?: number | null
			sort_field?: string | null
			translations?: unknown | null
			unarchive_value?: string | null
			versioning: boolean
		}

		export type DirectusComments = {
			collection: string | DirectusCollections
			comment: string
			date_created?: string | null
			date_updated?: string | null
			id: string
			item: string
			user_created?: string | DirectusUsers | null
			user_updated?: string | DirectusUsers | null
		}

		export type DirectusDashboards = {
			color?: string | null
			date_created?: string | null
			icon: string
			id: string
			name: string
			note?: string | null
			panels: any[] | DirectusPanels[]
			user_created?: string | DirectusUsers | null
		}

		export type DirectusExtensions = {
			bundle?: string | null
			enabled: boolean
			folder: string
			id: string
			source: string
		}

		export type DirectusFields = {
			collection: string | DirectusCollections
			conditions?: unknown | null
			display?: string | null
			display_options?: unknown | null
			field: string
			group?: string | DirectusFields | null
			hidden: boolean
			id: number
			interface?: string | null
			note?: string | null
			options?: unknown | null
			readonly: boolean
			required?: boolean | null
			sort?: number | null
			special?: unknown | null
			translations?: unknown | null
			validation?: unknown | null
			validation_message?: string | null
			width?: string | null
		}

		export type DirectusFiles = {
			charset?: string | null
			created_on: string
			description?: string | null
			duration?: number | null
			embed?: string | null
			filename_disk?: string | null
			filename_download: string
			filesize?: number | null
			focal_point_x?: number | null
			focal_point_y?: number | null
			folder?: string | DirectusFolders | null
			height?: number | null
			id: string
			location?: string | null
			metadata?: unknown | null
			modified_by?: string | DirectusUsers | null
			modified_on: string
			storage: string
			tags?: unknown | null
			title?: string | null
			tus_data?: unknown | null
			tus_id?: string | null
			type?: string | null
			uploaded_by?: string | DirectusUsers | null
			uploaded_on?: string | null
			width?: number | null
		}

		export type DirectusFlows = {
			accountability?: string | null
			color?: string | null
			date_created?: string | null
			description?: string | null
			icon?: string | null
			id: string
			name: string
			operation?: string | DirectusOperations | null
			operations: any[] | DirectusOperations[]
			options?: unknown | null
			status: string
			trigger?: string | null
			user_created?: string | DirectusUsers | null
		}

		export type DirectusFolders = {
			id: string
			name: string
			parent?: string | DirectusFolders | null
		}

		export type DirectusMigrations = {
			name: string
			timestamp?: string | null
			version: string
		}

		export type DirectusNotifications = {
			collection?: string | null
			id: number
			item?: string | null
			message?: string | null
			recipient: string | DirectusUsers
			sender?: string | DirectusUsers | null
			status?: string | null
			subject: string
			timestamp?: string | null
		}

		export type DirectusOperations = {
			date_created?: string | null
			flow: string | DirectusFlows
			id: string
			key: string
			name?: string | null
			options?: unknown | null
			position_x: number
			position_y: number
			reject?: string | DirectusOperations | null
			resolve?: string | DirectusOperations | null
			type: string
			user_created?: string | DirectusUsers | null
		}

		export type DirectusPanels = {
			color?: string | null
			dashboard: string | DirectusDashboards
			date_created?: string | null
			height: number
			icon?: string | null
			id: string
			name?: string | null
			note?: string | null
			options?: unknown | null
			position_x: number
			position_y: number
			show_header: boolean
			type: string
			user_created?: string | DirectusUsers | null
			width: number
		}

		export type DirectusPermissions = {
			action: string
			collection: string
			fields?: unknown | null
			id: number
			permissions?: unknown | null
			policy: string | DirectusPolicies
			presets?: unknown | null
			validation?: unknown | null
		}

		export type DirectusPolicies = {
			admin_access: boolean
			app_access: boolean
			description?: string | null
			enforce_tfa: boolean
			icon: string
			id: string
			ip_access?: unknown | null
			name: string
			permissions: any[] | DirectusPermissions[]
			roles: any[] | DirectusAccess[]
			users: any[] | DirectusAccess[]
		}

		export type DirectusPresets = {
			bookmark?: string | null
			collection?: string | null
			color?: string | null
			filter?: unknown | null
			icon?: string | null
			id: number
			layout?: string | null
			layout_options?: unknown | null
			layout_query?: unknown | null
			refresh_interval?: number | null
			role?: string | DirectusRoles | null
			search?: string | null
			user?: string | DirectusUsers | null
		}

		export type DirectusRelations = {
			id: number
			junction_field?: string | null
			many_collection: string
			many_field: string
			one_allowed_collections?: unknown | null
			one_collection?: string | null
			one_collection_field?: string | null
			one_deselect_action: string
			one_field?: string | null
			sort_field?: string | null
		}

		export type DirectusRevisions = {
			activity: number | DirectusActivity
			collection: string
			data?: unknown | null
			delta?: unknown | null
			id: number
			item: string
			parent?: number | DirectusRevisions | null
			version?: string | DirectusVersions | null
		}

		export type DirectusRoles = {
			children: any[] | DirectusRoles[]
			description?: string | null
			icon: string
			id: string
			name: string
			parent?: string | DirectusRoles | null
			policies: any[] | DirectusAccess[]
			users: any[] | DirectusUsers[]
			users_group: string
		}

		export type DirectusSessions = {
			expires: string
			ip?: string | null
			next_token?: string | null
			origin?: string | null
			share?: string | DirectusShares | null
			token: string
			user?: string | DirectusUsers | null
			user_agent?: string | null
		}

		export type DirectusSettings = {
			auth_login_attempts?: number | null
			auth_password_policy?: string | null
			basemaps?: unknown | null
			command_palette_settings?: unknown | null
			custom_aspect_ratios?: unknown | null
			custom_css?: string | null
			default_appearance: string
			default_language: string
			default_theme_dark?: string | null
			default_theme_light?: string | null
			id: number
			mapbox_key?: string | null
			module_bar?: unknown | null
			project_color: string
			project_descriptor?: string | null
			project_logo?: string | DirectusFiles | null
			project_name: string
			project_url?: string | null
			public_background?: string | DirectusFiles | null
			public_favicon?: string | DirectusFiles | null
			public_foreground?: string | DirectusFiles | null
			public_note?: string | null
			public_registration: boolean
			public_registration_email_filter?: unknown | null
			public_registration_role?: string | DirectusRoles | null
			public_registration_verify_email: boolean
			report_bug_url?: string | null
			report_error_url?: string | null
			report_feature_url?: string | null
			storage_asset_presets?: unknown | null
			storage_asset_transform?: string | null
			storage_default_folder?: string | DirectusFolders | null
			theme_dark_overrides?: unknown | null
			theme_light_overrides?: unknown | null
			theming_group: string
		}

		export type DirectusShares = {
			collection: string | DirectusCollections
			date_created?: string | null
			date_end?: string | null
			date_start?: string | null
			id: string
			item: string
			max_uses?: number | null
			name?: string | null
			password?: string | null
			role?: string | DirectusRoles | null
			times_used?: number | null
			user_created?: string | DirectusUsers | null
		}

		export type DirectusTranslations = {
			id: string
			key: string
			language: string
			value: string
		}

		export type DirectusUsers = {
			appearance?: string | null
			auth_data?: unknown | null
			avatar?: string | DirectusFiles | null
			description?: string | null
			email?: string | null
			email_notifications?: boolean | null
			expiresAt?: string | null
			external_identifier?: string | null
			first_name?: string | null
			id: string
			language?: string | null
			last_access?: string | null
			last_name?: string | null
			last_page?: string | null
			location?: string | null
			password?: string | null
			policies: any[] | DirectusAccess[]
			posts: any[] | Posts[]
			practiceExams: any[] | UserExams[]
			provider: string
			role?: string | DirectusRoles | null
			status: string
			subscription?: string | SubscriptionTiers | null
			tags?: unknown | null
			tfa_secret?: string | null
			theme_dark?: string | null
			theme_dark_overrides?: unknown | null
			theme_light?: string | null
			theme_light_overrides?: unknown | null
			title?: string | null
			token?: string | null
			videoCourses: any[] | UserVideoCourses[]
		}

		export type DirectusVersions = {
			collection: string | DirectusCollections
			date_created?: string | null
			date_updated?: string | null
			delta?: unknown | null
			hash?: string | null
			id: string
			item: string
			key: string
			name?: string | null
			user_created?: string | DirectusUsers | null
			user_updated?: string | DirectusUsers | null
		}

		export type DirectusWebhooks = {
			actions: unknown
			collections: unknown
			data: boolean
			headers?: unknown | null
			id: number
			method: string
			migrated_flow?: string | DirectusFlows | null
			name: string
			status: string
			url: string
			was_active_before_deprecation: boolean
		}

		export type FormFields = {
			choices?: unknown | null
			form?: string | Forms | null
			help?: string | null
			id: string
			label?: string | null
			name?: string | null
			placeholder?: string | null
			required?: boolean | null
			sort?: number | null
			type?: string | null
			validation?: string | null
			width?: string | null
		}

		export type FormSubmissionValues = {
			field?: string | FormFields | null
			file?: string | DirectusFiles | null
			form_submission?: string | FormSubmissions | null
			id: string
			sort?: number | null
			value?: string | null
		}

		export type FormSubmissions = {
			form?: string | Forms | null
			id: string
			timestamp?: string | null
			values: any[] | FormSubmissionValues[]
		}

		export type Forms = {
			emails?: unknown | null
			fields: any[] | FormFields[]
			id: string
			is_active?: boolean | null
			meta_emails: string
			meta_fields: string
			meta_submissions: string
			meta_tabs: string
			on_success?: string | null
			sort?: number | null
			submissions: any[] | FormSubmissions[]
			submit_label?: string | null
			success_message?: string | null
			success_redirect_url?: string | null
			title?: string | null
		}

		export type Globals = {
			description?: string | null
			directus_url?: string | null
			favicon?: string | DirectusFiles | null
			id: string
			logo?: string | DirectusFiles | null
			meta_credentials: string
			openai_api_key?: string | null
			primary_color?: string | null
			social_links?: unknown | null
			tagline?: string | null
			title?: string | null
			url?: string | null
		}

		export type Navigation = {
			id: string
			is_active?: boolean | null
			items: any[] | NavigationItems[]
			title?: string | null
		}

		export type NavigationItems = {
			children: any[] | NavigationItems[]
			id: string
			navigation?: string | Navigation | null
			page?: string | Pages | null
			parent?: string | NavigationItems | null
			post?: string | Posts | null
			sort?: number | null
			title?: string | null
			type?: string | null
			url?: string | null
		}

		export type PageBlocks = {
			background?: string | null
			collection?: string | null
			hide_block?: boolean | null
			id: string
			item?: string | any | null
			page?: string | Pages | null
			sort?: number | null
		}

		export type Pages = {
			blocks: any[] | PageBlocks[]
			description?: string | null
			id: string
			meta_m2a_button: string
			permalink?: string | null
			published_at?: string | null
			sort?: number | null
			status: string
			title?: string | null
		}

		export type Posts = {
			author?: string | DirectusUsers | null
			content?: string | null
			description?: string | null
			id: string
			image?: string | DirectusFiles | null
			published_at?: string | null
			slug?: string | null
			sort?: number | null
			status: string
			title?: string | null
		}

		export type PracticeExams = {
			category?: string | null
			components: any[] | PracticeExamsComponents[]
			id: string
			limitInMinutes?: number | null
			title: string
		}

		export type PracticeExamsComponents = {
			id: string
			practiceExam?: string | PracticeExams | null
			questions: any[] | PracticeExamsComponentsQuestions[]
			slug?: string | null
			timeLimitInSeconds?: number | null
			title: string
		}

		export type PracticeExamsComponentsQuestions = {
			collection?: string | null
			id: number
			item?: string | any | null
			practice_exams_components_id?: string | PracticeExamsComponents | null
		}

		export type QuestionsInOrder = {
			answers?: unknown | null
			id: number
			thumbnail?: string | DirectusFiles | null
			title: string
		}

		export type QuestionsMultipleChoice = {
			answers?: unknown | null
			id: number
			thumbnail?: string | DirectusFiles | null
			title: string
		}

		export type SubscriptionTiers = {
			daysOfAccess: number
			discountPrice?: number | null
			featureList: unknown
			icon: string | DirectusFiles
			id: string
			maxPracticeExams?: number | null
			practiceExams: any[] | SubscriptionTiersPracticeExams[]
			price: number
			slug?: string | null
			subscription?: number | Subscriptions | null
			title: string
			videoCourses: any[] | VideoCourses[]
		}

		export type SubscriptionTiersPracticeExams = {
			id: number
			practice_exam?: string | PracticeExams | null
			subscription_tier?: string | SubscriptionTiers | null
		}

		export type Subscriptions = {
			id: number
			tiers: any[] | SubscriptionTiers[]
			type: string
		}

		export type UserExams = {
			didPass?: boolean | null
			exam?: string | PracticeExams | null
			id: number
			user?: string | DirectusUsers | null
		}

		export type UserVideoCourses = {
			didFinish?: boolean | null
			id: string
			lessonsFinished?: unknown | null
			user?: string | DirectusUsers | null
			videoCourse: number | VideoCourses
		}

		export type VideoCourseChapters = {
			description?: string | null
			id: string
			lessons: any[] | VideoCoursesLessons[]
			slug?: string | null
			thumbnail: string | DirectusFiles
			title: string
			videoCourse: number | VideoCourses
		}

		export type VideoCourses = {
			category?: string | null
			chapters: any[] | VideoCourseChapters[]
			id: number
			slug: string
			subscriptionTier?: string | SubscriptionTiers | null
			tagline: string
			thumbnail: string | DirectusFiles
			title?: string | null
		}

		export type VideoCoursesLessons = {
			chapter?: string | VideoCourseChapters | null
			description?: string | null
			estimatedDurationInMinutes?: number | null
			id: number
			title: string
			video: string | DirectusFiles
			videoCourse?: number | VideoCourses | null
		}

		export type CustomDirectusTypes = {
			block_button: BlockButton[]
			block_button_group: BlockButtonGroup[]
			block_form: BlockForm[]
			block_gallery: BlockGallery[]
			block_gallery_items: BlockGalleryItems[]
			block_hero: BlockHero[]
			block_posts: BlockPosts[]
			block_pricing: BlockPricing[]
			block_pricing_cards: BlockPricingCards[]
			block_richtext: BlockRichtext[]
			directus_access: DirectusAccess[]
			directus_activity: DirectusActivity[]
			directus_collections: DirectusCollections[]
			directus_comments: DirectusComments[]
			directus_dashboards: DirectusDashboards[]
			directus_extensions: DirectusExtensions[]
			directus_fields: DirectusFields[]
			directus_files: DirectusFiles[]
			directus_flows: DirectusFlows[]
			directus_folders: DirectusFolders[]
			directus_migrations: DirectusMigrations[]
			directus_notifications: DirectusNotifications[]
			directus_operations: DirectusOperations[]
			directus_panels: DirectusPanels[]
			directus_permissions: DirectusPermissions[]
			directus_policies: DirectusPolicies[]
			directus_presets: DirectusPresets[]
			directus_relations: DirectusRelations[]
			directus_revisions: DirectusRevisions[]
			directus_roles: DirectusRoles[]
			directus_sessions: DirectusSessions[]
			directus_settings: DirectusSettings
			directus_shares: DirectusShares[]
			directus_translations: DirectusTranslations[]
			directus_users: DirectusUsers[]
			directus_versions: DirectusVersions[]
			directus_webhooks: DirectusWebhooks[]
			form_fields: FormFields[]
			form_submission_values: FormSubmissionValues[]
			form_submissions: FormSubmissions[]
			forms: Forms[]
			globals: Globals
			navigation: Navigation[]
			navigation_items: NavigationItems[]
			page_blocks: PageBlocks[]
			pages: Pages[]
			posts: Posts[]
			practice_exams: PracticeExams[]
			practice_exams_components: PracticeExamsComponents[]
			practice_exams_components_questions: PracticeExamsComponentsQuestions[]
			questions_in_order: QuestionsInOrder[]
			questions_multiple_choice: QuestionsMultipleChoice[]
			subscription_tiers: SubscriptionTiers[]
			subscription_tiers_practice_exams: SubscriptionTiersPracticeExams[]
			subscriptions: Subscriptions[]
			user_exams: UserExams[]
			user_video_courses: UserVideoCourses[]
			video_course_chapters: VideoCourseChapters[]
			video_courses: VideoCourses[]
			video_courses_lessons: VideoCoursesLessons[]
		}

		export type Schemas = Directus.CustomDirectusTypes[keyof CustomDirectusTypes]

		export type SchemaMapper<T, K extends Partial<Record<keyof T, any>>> = {
			[P in keyof T]: P extends keyof K ? Exclude<K[P], null | undefined> : T[P]
		} & {
			[P in keyof K]: Exclude<K[P], null | undefined>
		}
	}
}

export {}
