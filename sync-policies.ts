import { transform, isEqual, isObject, isNull, isNil } from 'lodash-es'

const localPermissions = [
	{
		id: 1,
		collection: 'pages',
		action: 'read',
		permissions: {
			_and: [
				{
					status: {
						_eq: 'published'
					}
				},
				{
					published_at: {
						_lte: '$NOW'
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 2,
		collection: 'posts',
		action: 'read',
		permissions: {
			_and: [
				{
					status: {
						_eq: 'published'
					}
				},
				{
					published_at: {
						_lte: '$NOW'
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 3,
		collection: 'block_hero',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 4,
		collection: 'block_richtext',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 5,
		collection: 'globals',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'seo',
			'url',
			'title',
			'tagline',
			'description',
			'social',
			'og_image',
			'twitter_image',
			'social_links',
			'contact',
			'street_address',
			'address_locality',
			'address_region',
			'postal_code',
			'address_country',
			'email',
			'phone',
			'routes',
			'logo_on_dark_bg',
			'logo_on_light_bg',
			'theme',
			'logo',
			'favicon',
			'primary_color',
			'contactMail',
			'kvk'
		],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 6,
		collection: 'page_blocks',
		action: 'read',
		permissions: {
			_and: [
				{
					page: {
						status: {
							_eq: 'published'
						}
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 7,
		collection: 'forms',
		action: 'read',
		permissions: {
			_and: [
				{
					is_active: {
						_eq: true
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: [
			'id',
			'sort',
			'title',
			'is_active',
			'meta_tabs',
			'meta_fields',
			'fields',
			'submit_label',
			'on_success',
			'success_message',
			'success_redirect_url'
		],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 8,
		collection: 'navigation',
		action: 'read',
		permissions: {
			_and: [
				{
					is_active: {
						_eq: true
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 9,
		collection: 'navigation_items',
		action: 'read',
		permissions: {
			_and: [
				{
					_or: [
						{
							navigation: {
								is_active: {
									_eq: true
								}
							}
						},
						{
							parent: {
								navigation: {
									is_active: {
										_eq: true
									}
								}
							}
						}
					]
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 10,
		collection: 'block_gallery',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 11,
		collection: 'blog_settings',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 12,
		collection: 'chat_config',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 13,
		collection: 'block_button_group',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 14,
		collection: 'block_button',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 15,
		collection: 'block_button',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 16,
		collection: 'block_button',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 17,
		collection: 'block_button',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 18,
		collection: 'block_button',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 19,
		collection: 'block_button_group',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 20,
		collection: 'block_button_group',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 21,
		collection: 'block_button_group',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 22,
		collection: 'block_button_group',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 23,
		collection: 'block_gallery',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 24,
		collection: 'block_gallery',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 25,
		collection: 'block_gallery',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 26,
		collection: 'block_gallery',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 27,
		collection: 'block_hero',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 28,
		collection: 'block_hero',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 29,
		collection: 'block_hero',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 30,
		collection: 'block_hero',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 31,
		collection: 'block_richtext',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 32,
		collection: 'block_richtext',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 33,
		collection: 'block_richtext',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 34,
		collection: 'block_richtext',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 35,
		collection: 'blog_settings',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 36,
		collection: 'blog_settings',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 37,
		collection: 'blog_settings',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 38,
		collection: 'blog_settings',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 39,
		collection: 'forms',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 40,
		collection: 'forms',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 41,
		collection: 'forms',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 42,
		collection: 'forms',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 43,
		collection: 'globals',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'title',
			'url',
			'divider_logo',
			'logo',
			'favicon',
			'tagline',
			'description',
			'divider_social',
			'social_links'
		],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 44,
		collection: 'globals',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'title',
			'url',
			'divider_logo',
			'logo',
			'favicon',
			'tagline',
			'description',
			'divider_social',
			'social_links'
		],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 45,
		collection: 'globals',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'title',
			'url',
			'divider_logo',
			'logo',
			'favicon',
			'tagline',
			'description',
			'divider_social',
			'social_links'
		],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 46,
		collection: 'navigation',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 47,
		collection: 'navigation',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 48,
		collection: 'navigation',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 49,
		collection: 'navigation',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 50,
		collection: 'navigation_items',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 51,
		collection: 'navigation_items',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 52,
		collection: 'navigation_items',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 53,
		collection: 'navigation_items',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 54,
		collection: 'page_blocks',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 55,
		collection: 'page_blocks',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 56,
		collection: 'page_blocks',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 57,
		collection: 'page_blocks',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 58,
		collection: 'pages',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 59,
		collection: 'pages',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 60,
		collection: 'pages',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 61,
		collection: 'pages',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 62,
		collection: 'posts',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 63,
		collection: 'posts',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 64,
		collection: 'posts',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 65,
		collection: 'posts',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 66,
		collection: 'projects_settings',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 67,
		collection: 'directus_files',
		action: 'read',
		permissions: {
			_and: [
				{
					_or: [
						{
							folder: {
								name: {
									_contains: 'Public'
								}
							}
						},
						{
							folder: {
								parent: {
									name: {
										_contains: 'Public'
									}
								}
							}
						}
					]
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 68,
		collection: 'directus_files',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 69,
		collection: 'directus_files',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 70,
		collection: 'directus_files',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 71,
		collection: 'directus_files',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 72,
		collection: 'directus_dashboards',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 73,
		collection: 'directus_dashboards',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 74,
		collection: 'directus_dashboards',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 75,
		collection: 'directus_dashboards',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 76,
		collection: 'directus_panels',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 77,
		collection: 'directus_panels',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 78,
		collection: 'directus_panels',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 79,
		collection: 'directus_panels',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 80,
		collection: 'directus_folders',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 81,
		collection: 'directus_folders',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 82,
		collection: 'directus_folders',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 83,
		collection: 'directus_folders',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: null,
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 84,
		collection: 'directus_users',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 85,
		collection: 'directus_users',
		action: 'update',
		permissions: {
			id: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: [
			'first_name',
			'last_name',
			'email',
			'password',
			'location',
			'title',
			'description',
			'avatar',
			'language',
			'appearance',
			'theme_light',
			'theme_dark',
			'theme_light_overrides',
			'theme_dark_overrides',
			'tfa_secret'
		],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 86,
		collection: 'directus_roles',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 87,
		collection: 'directus_shares',
		action: 'read',
		permissions: {
			_or: [
				{
					role: {
						_eq: '$CURRENT_ROLE'
					}
				},
				{
					role: {
						_null: true
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 88,
		collection: 'directus_shares',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 89,
		collection: 'directus_shares',
		action: 'update',
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 90,
		collection: 'directus_shares',
		action: 'delete',
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 91,
		collection: 'directus_flows',
		action: 'read',
		permissions: {
			trigger: {
				_eq: 'manual'
			}
		},
		validation: null,
		presets: null,
		fields: ['id', 'status', 'name', 'icon', 'color', 'options', 'trigger'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 92,
		collection: 'block_form',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 93,
		collection: 'block_posts',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 94,
		collection: 'form_fields',
		action: 'read',
		permissions: {
			_and: [
				{
					form: {
						is_active: {
							_eq: true
						}
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 95,
		collection: 'form_fields',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 96,
		collection: 'form_fields',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 97,
		collection: 'form_fields',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 98,
		collection: 'form_fields',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 99,
		collection: 'form_submission_values',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 100,
		collection: 'form_submission_values',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 101,
		collection: 'form_submissions',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 102,
		collection: 'form_submissions',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 103,
		collection: 'block_posts',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 104,
		collection: 'block_posts',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 105,
		collection: 'block_posts',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 106,
		collection: 'block_posts',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 107,
		collection: 'block_form',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 108,
		collection: 'block_form',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 109,
		collection: 'block_form',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 110,
		collection: 'block_form',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 111,
		collection: 'directus_files',
		action: 'create',
		permissions: null,
		validation: {
			_and: [
				{
					filesize: {
						_lte: '5000000'
					}
				}
			]
		},
		presets: {
			folder: 'e6308546-92fb-4b10-b586-eefaf1d97f7f'
		},
		fields: ['*'],
		policy: '307380fe-195e-44cc-9cc0-6993aeee9428'
	},
	{
		id: 112,
		collection: 'form_submission_values',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 113,
		collection: 'form_submissions',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 114,
		collection: 'form_submission_values',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['id'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 115,
		collection: 'form_submissions',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['id'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 116,
		collection: 'block_gallery_items',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 117,
		collection: 'block_gallery_items',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 118,
		collection: 'block_gallery_items',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 119,
		collection: 'block_gallery_items',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 120,
		collection: 'block_pricing',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 121,
		collection: 'block_pricing',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 122,
		collection: 'block_pricing',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 123,
		collection: 'block_pricing',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 124,
		collection: 'block_pricing_cards',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 125,
		collection: 'block_pricing_cards',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 126,
		collection: 'block_pricing_cards',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 127,
		collection: 'block_pricing_cards',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 128,
		collection: 'block_gallery_items',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 129,
		collection: 'block_pricing',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 130,
		collection: 'block_pricing_cards',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 131,
		collection: 'directus_users',
		action: 'read',
		permissions: {
			_and: [
				{
					posts: {
						_nnull: true
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['first_name', 'last_name', 'avatar', 'title'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 132,
		collection: 'directus_files',
		action: 'read',
		permissions: {
			_and: [
				{
					folder: {
						_eq: 'e6308546-92fb-4b10-b586-eefaf1d97f7f'
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['id'],
		policy: '307380fe-195e-44cc-9cc0-6993aeee9428'
	},
	{
		id: 133,
		collection: 'subscription_tiers',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 135,
		collection: 'video_courses',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 136,
		collection: 'video_courses_lessons',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 137,
		collection: 'globals',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: [
			'title',
			'url',
			'logo',
			'favicon',
			'primary_color',
			'tagline',
			'description',
			'social_links',
			'contactMail',
			'kvk'
		],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 138,
		collection: 'user_exams',
		action: 'update',
		permissions: {
			_and: [
				{
					user: {
						_eq: '$CURRENT_USER'
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 139,
		collection: 'user_exams',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 140,
		collection: 'practice_exams',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 141,
		collection: 'user_video_courses',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 142,
		collection: 'user_video_courses',
		action: 'update',
		permissions: {
			_and: [
				{
					user: {
						_eq: '$CURRENT_USER'
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 143,
		collection: 'subscriptions',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 144,
		collection: 'subscription_tiers',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 145,
		collection: 'video_courses',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 146,
		collection: 'directus_users',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 147,
		collection: 'directus_users',
		action: 'update',
		permissions: {
			_and: [
				{
					id: {
						_eq: '$CURRENT_USER'
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: [
			'first_name',
			'last_name',
			'email',
			'password',
			'practiceExams',
			'videoCourses',
			'expiresAt',
			'subscription',
			'avatar',
			'location',
			'title',
			'language',
			'description',
			'email_notifications'
		],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 148,
		collection: 'user_exams',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 149,
		collection: 'user_video_courses',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 150,
		collection: 'video_courses_subscription_tiers',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 151,
		collection: 'video_courses_lessons',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 152,
		collection: 'video_course_chapters',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 153,
		collection: 'subscription_tiers_practice_exams',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 154,
		collection: 'practice_exams_components',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 155,
		collection: 'practice_exams_components_questions',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 156,
		collection: 'questions_in_order',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 157,
		collection: 'questions_multiple_choice',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		id: 158,
		collection: 'pages',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '62e61efb-20f4-47f4-9e95-6e399256947a'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_collections',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_fields',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_relations',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_translations',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_activity',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_comments',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: {
			comment: {
				_nnull: true
			}
		},
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_comments',
		action: 'create'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['comment'],
		system: true,
		collection: 'directus_comments',
		action: 'update'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_comments',
		action: 'delete'
	},
	{
		policy: null,
		permissions: {
			_or: [
				{
					user: {
						_eq: '$CURRENT_USER'
					}
				},
				{
					_and: [
						{
							user: {
								_null: true
							}
						},
						{
							role: {
								_eq: '$CURRENT_ROLE'
							}
						}
					]
				},
				{
					_and: [
						{
							user: {
								_null: true
							}
						},
						{
							role: {
								_null: true
							}
						}
					]
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'create'
	},
	{
		policy: null,
		permissions: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'update'
	},
	{
		policy: null,
		permissions: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'delete'
	},
	{
		policy: null,
		permissions: {
			id: {
				_in: '$CURRENT_ROLES'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_roles',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_settings',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_translations',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			recipient: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_notifications',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			recipient: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['status'],
		system: true,
		collection: 'directus_notifications',
		action: 'update'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_shares',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			id: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: [
			'id',
			'first_name',
			'last_name',
			'last_page',
			'email',
			'password',
			'location',
			'title',
			'description',
			'tags',
			'preferences_divider',
			'avatar',
			'language',
			'appearance',
			'theme_light',
			'theme_dark',
			'tfa_secret',
			'status',
			'role'
		],
		system: true,
		collection: 'directus_users',
		action: 'read'
	}
]

const remotePermissions = [
	{
		id: 1,
		collection: 'pages',
		action: 'read',
		permissions: {
			_and: [
				{
					status: {
						_eq: 'published'
					}
				},
				{
					published_at: {
						_lte: '$NOW'
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 2,
		collection: 'posts',
		action: 'read',
		permissions: {
			_and: [
				{
					status: {
						_eq: 'published'
					}
				},
				{
					published_at: {
						_lte: '$NOW'
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 3,
		collection: 'block_hero',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 4,
		collection: 'block_richtext',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 5,
		collection: 'globals',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'seo',
			'url',
			'title',
			'tagline',
			'description',
			'social',
			'og_image',
			'twitter_image',
			'social_links',
			'contact',
			'street_address',
			'address_locality',
			'address_region',
			'postal_code',
			'address_country',
			'email',
			'phone',
			'routes',
			'logo_on_dark_bg',
			'logo_on_light_bg',
			'theme',
			'logo',
			'favicon',
			'primary_color',
			'contactMail',
			'kvk'
		],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 6,
		collection: 'page_blocks',
		action: 'read',
		permissions: {
			_and: [
				{
					page: {
						status: {
							_eq: 'published'
						}
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 7,
		collection: 'forms',
		action: 'read',
		permissions: {
			_and: [
				{
					is_active: {
						_eq: true
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: [
			'id',
			'sort',
			'title',
			'is_active',
			'meta_tabs',
			'meta_fields',
			'fields',
			'submit_label',
			'on_success',
			'success_message',
			'success_redirect_url'
		],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 8,
		collection: 'navigation',
		action: 'read',
		permissions: {
			_and: [
				{
					is_active: {
						_eq: true
					}
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 9,
		collection: 'navigation_items',
		action: 'read',
		permissions: {
			_and: [
				{
					_or: [
						{
							navigation: {
								is_active: {
									_eq: true
								}
							}
						},
						{
							parent: {
								navigation: {
									is_active: {
										_eq: true
									}
								}
							}
						}
					]
				}
			]
		},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 10,
		collection: 'block_gallery',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 11,
		collection: 'blog_settings',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 12,
		collection: 'chat_config',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 13,
		collection: 'block_button_group',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 14,
		collection: 'block_button',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 15,
		collection: 'block_button',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 16,
		collection: 'block_button',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 17,
		collection: 'block_button',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 18,
		collection: 'block_button',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 19,
		collection: 'block_button_group',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 20,
		collection: 'block_button_group',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 21,
		collection: 'block_button_group',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 22,
		collection: 'block_button_group',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 23,
		collection: 'block_gallery',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 24,
		collection: 'block_gallery',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 25,
		collection: 'block_gallery',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 26,
		collection: 'block_gallery',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 27,
		collection: 'block_hero',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 28,
		collection: 'block_hero',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 29,
		collection: 'block_hero',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 30,
		collection: 'block_hero',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 31,
		collection: 'block_richtext',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 32,
		collection: 'block_richtext',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 33,
		collection: 'block_richtext',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 34,
		collection: 'block_richtext',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 35,
		collection: 'blog_settings',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 36,
		collection: 'blog_settings',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 37,
		collection: 'blog_settings',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 38,
		collection: 'blog_settings',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 39,
		collection: 'forms',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 40,
		collection: 'forms',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 41,
		collection: 'forms',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 42,
		collection: 'forms',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 43,
		collection: 'globals',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'title',
			'url',
			'divider_logo',
			'logo',
			'favicon',
			'tagline',
			'description',
			'divider_social',
			'social_links'
		],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 44,
		collection: 'globals',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'title',
			'url',
			'divider_logo',
			'logo',
			'favicon',
			'tagline',
			'description',
			'divider_social',
			'social_links'
		],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 45,
		collection: 'globals',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: [
			'id',
			'title',
			'url',
			'divider_logo',
			'logo',
			'favicon',
			'tagline',
			'description',
			'divider_social',
			'social_links'
		],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 46,
		collection: 'navigation',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 47,
		collection: 'navigation',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 48,
		collection: 'navigation',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 49,
		collection: 'navigation',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 50,
		collection: 'navigation_items',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 51,
		collection: 'navigation_items',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 52,
		collection: 'navigation_items',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 53,
		collection: 'navigation_items',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 54,
		collection: 'page_blocks',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 55,
		collection: 'page_blocks',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 56,
		collection: 'page_blocks',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 57,
		collection: 'page_blocks',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 58,
		collection: 'pages',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 59,
		collection: 'pages',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 60,
		collection: 'pages',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 61,
		collection: 'pages',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 62,
		collection: 'posts',
		action: 'create',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 63,
		collection: 'posts',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 64,
		collection: 'posts',
		action: 'update',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 65,
		collection: 'posts',
		action: 'delete',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 66,
		collection: 'projects_settings',
		action: 'read',
		permissions: {},
		validation: {},
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 67,
		collection: 'directus_files',
		action: 'read',
		permissions: {
			_and: [
				{
					_or: [
						{
							folder: {
								name: {
									_contains: 'Public'
								}
							}
						},
						{
							folder: {
								parent: {
									name: {
										_contains: 'Public'
									}
								}
							}
						}
					]
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 68,
		collection: 'directus_files',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 69,
		collection: 'directus_files',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 70,
		collection: 'directus_files',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 71,
		collection: 'directus_files',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 72,
		collection: 'directus_dashboards',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 73,
		collection: 'directus_dashboards',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 74,
		collection: 'directus_dashboards',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 75,
		collection: 'directus_dashboards',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 76,
		collection: 'directus_panels',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 77,
		collection: 'directus_panels',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 78,
		collection: 'directus_panels',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 79,
		collection: 'directus_panels',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 80,
		collection: 'directus_folders',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 81,
		collection: 'directus_folders',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 82,
		collection: 'directus_folders',
		action: 'update',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 83,
		collection: 'directus_folders',
		action: 'delete',
		permissions: {},
		validation: null,
		presets: null,
		fields: null,
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 84,
		collection: 'directus_users',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 85,
		collection: 'directus_users',
		action: 'update',
		permissions: {
			id: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: [
			'first_name',
			'last_name',
			'email',
			'password',
			'location',
			'title',
			'description',
			'avatar',
			'language',
			'appearance',
			'theme_light',
			'theme_dark',
			'theme_light_overrides',
			'theme_dark_overrides',
			'tfa_secret'
		],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 86,
		collection: 'directus_roles',
		action: 'read',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 87,
		collection: 'directus_shares',
		action: 'read',
		permissions: {
			_or: [
				{
					role: {
						_eq: '$CURRENT_ROLE'
					}
				},
				{
					role: {
						_null: true
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 88,
		collection: 'directus_shares',
		action: 'create',
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 89,
		collection: 'directus_shares',
		action: 'update',
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 90,
		collection: 'directus_shares',
		action: 'delete',
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 91,
		collection: 'directus_flows',
		action: 'read',
		permissions: {
			trigger: {
				_eq: 'manual'
			}
		},
		validation: null,
		presets: null,
		fields: ['id', 'status', 'name', 'icon', 'color', 'options', 'trigger'],
		policy: '52598a64-071d-4071-96fa-4b620d6189b5'
	},
	{
		id: 92,
		collection: 'block_form',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 93,
		collection: 'block_posts',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 94,
		collection: 'form_fields',
		action: 'read',
		permissions: {
			_and: [
				{
					form: {
						is_active: {
							_eq: true
						}
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 95,
		collection: 'form_fields',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 96,
		collection: 'form_fields',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 97,
		collection: 'form_fields',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 98,
		collection: 'form_fields',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 99,
		collection: 'form_submission_values',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 100,
		collection: 'form_submission_values',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 101,
		collection: 'form_submissions',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 102,
		collection: 'form_submissions',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 103,
		collection: 'block_posts',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 104,
		collection: 'block_posts',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 105,
		collection: 'block_posts',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 106,
		collection: 'block_posts',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 107,
		collection: 'block_form',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 108,
		collection: 'block_form',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 109,
		collection: 'block_form',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 110,
		collection: 'block_form',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 111,
		collection: 'directus_files',
		action: 'create',
		permissions: null,
		validation: {
			_and: [
				{
					filesize: {
						_lte: '5000000'
					}
				}
			]
		},
		presets: {
			folder: 'e6308546-92fb-4b10-b586-eefaf1d97f7f'
		},
		fields: ['*'],
		policy: '307380fe-195e-44cc-9cc0-6993aeee9428'
	},
	{
		id: 112,
		collection: 'form_submission_values',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 113,
		collection: 'form_submissions',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 114,
		collection: 'form_submission_values',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['id'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 115,
		collection: 'form_submissions',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['id'],
		policy: 'ee1055a2-7c03-4b0b-9b65-ca68491b6329'
	},
	{
		id: 116,
		collection: 'block_gallery_items',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 117,
		collection: 'block_gallery_items',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 118,
		collection: 'block_gallery_items',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 119,
		collection: 'block_gallery_items',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 120,
		collection: 'block_pricing',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 121,
		collection: 'block_pricing',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 122,
		collection: 'block_pricing',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 123,
		collection: 'block_pricing',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 124,
		collection: 'block_pricing_cards',
		action: 'create',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 125,
		collection: 'block_pricing_cards',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 126,
		collection: 'block_pricing_cards',
		action: 'update',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 127,
		collection: 'block_pricing_cards',
		action: 'delete',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: '8ba4ed6f-d330-4675-ae46-119c533a0928'
	},
	{
		id: 128,
		collection: 'block_gallery_items',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 129,
		collection: 'block_pricing',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 130,
		collection: 'block_pricing_cards',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 131,
		collection: 'directus_users',
		action: 'read',
		permissions: {
			_and: [
				{
					posts: {
						_nnull: true
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['first_name', 'last_name', 'avatar', 'title'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 132,
		collection: 'directus_files',
		action: 'read',
		permissions: {
			_and: [
				{
					folder: {
						_eq: 'e6308546-92fb-4b10-b586-eefaf1d97f7f'
					}
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['id'],
		policy: '307380fe-195e-44cc-9cc0-6993aeee9428'
	},
	{
		id: 133,
		collection: 'subscription_tiers',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 135,
		collection: 'video_courses',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		id: 136,
		collection: 'video_courses_lessons',
		action: 'read',
		permissions: null,
		validation: null,
		presets: null,
		fields: ['*'],
		policy: 'abf8a154-5b1c-4a46-ac9c-7300570f4f17'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_collections',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_fields',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_relations',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_translations',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_activity',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_comments',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: {
			comment: {
				_nnull: true
			}
		},
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_comments',
		action: 'create'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['comment'],
		system: true,
		collection: 'directus_comments',
		action: 'update'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_comments',
		action: 'delete'
	},
	{
		policy: null,
		permissions: {
			_or: [
				{
					user: {
						_eq: '$CURRENT_USER'
					}
				},
				{
					_and: [
						{
							user: {
								_null: true
							}
						},
						{
							role: {
								_eq: '$CURRENT_ROLE'
							}
						}
					]
				},
				{
					_and: [
						{
							user: {
								_null: true
							}
						},
						{
							role: {
								_null: true
							}
						}
					]
				}
			]
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'create'
	},
	{
		policy: null,
		permissions: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'update'
	},
	{
		policy: null,
		permissions: {
			user: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_presets',
		action: 'delete'
	},
	{
		policy: null,
		permissions: {
			id: {
				_in: '$CURRENT_ROLES'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_roles',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_settings',
		action: 'read'
	},
	{
		policy: null,
		permissions: {},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_translations',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			recipient: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_notifications',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			recipient: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['status'],
		system: true,
		collection: 'directus_notifications',
		action: 'update'
	},
	{
		policy: null,
		permissions: {
			user_created: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: ['*'],
		system: true,
		collection: 'directus_shares',
		action: 'read'
	},
	{
		policy: null,
		permissions: {
			id: {
				_eq: '$CURRENT_USER'
			}
		},
		validation: null,
		presets: null,
		fields: [
			'id',
			'first_name',
			'last_name',
			'last_page',
			'email',
			'password',
			'location',
			'title',
			'description',
			'tags',
			'preferences_divider',
			'avatar',
			'language',
			'appearance',
			'theme_light',
			'theme_dark',
			'tfa_secret',
			'status',
			'role'
		],
		system: true,
		collection: 'directus_users',
		action: 'read'
	}
]

/**
 * This code is licensed under the terms of the MIT license
 *
 * Deep diff between two object, using lodash
 * @param  {Object} object Object compared
 * @param  {Object} base   Object to compare with
 * @return {Object}        Return a new object who represent the diff
 */
function difference(object, base) {
	function changes(object, base) {
		return transform(object, function (result, value, key) {
			if (!isEqual(value, base[key])) {
				// @ts-ignore
				result[key] = isObject(value) && isObject(base[key]) ? changes(value, base[key]) : value
			}
		})
	}
	return changes(object, base)
}

console.log(difference(localPermissions, remotePermissions).filter((val) => val !== null))

// const LOCAL_DIRECTUS_URL = Bun.env.DIRECTUS_LOCAL_URL
// const REMOTE_DIRECTUS_URL = Bun.env.DIRECTUS_REMOTE_URL
// const DIRECTUS_TOKEN = Bun.env.DIRECTUS_TOKEN

// if (!LOCAL_DIRECTUS_URL || !REMOTE_DIRECTUS_URL) {
// 	console.error(
// 		'Missing API tokens. Please set LOCAL_DIRECTUS_TOKEN and REMOTE_DIRECTUS_TOKEN in your .env file.'
// 	)
// 	process.exit(1)
// }

// async function fetchData(endpoint: string) {
// 	try {
// 		const response = await fetch(`${LOCAL_DIRECTUS_URL}/${endpoint}`, {
// 			headers: { Authorization: `Bearer ${DIRECTUS_TOKEN}` }
// 		})
// 		if (!response.ok) throw new Error(`Failed to fetch ${endpoint}`)
// 		const data = await response.json()
// 		return data.data
// 	} catch (error) {
// 		console.error(`Error fetching ${endpoint} from local instance:`, error)
// 		return []
// 	}
// }

// async function syncData(endpoint: string, data: any[]) {
// 	try {
// 		for (const item of data) {
// 			const existingResponse = await fetch(`${REMOTE_DIRECTUS_URL}/${endpoint}/${item.id}`, {
// 				headers: { Authorization: `Bearer ${DIRECTUS_TOKEN}` }
// 			})

// 			if (existingResponse.ok) {
// 				await fetch(`${REMOTE_DIRECTUS_URL}/${endpoint}/${item.id}`, {
// 					method: 'PATCH',
// 					headers: {
// 						Authorization: `Bearer ${DIRECTUS_TOKEN}`,
// 						'Content-Type': 'application/json'
// 					},
// 					body: JSON.stringify(item)
// 				})
// 				console.log(`Updated ${endpoint.slice(0, -1)}: ${item.id}`)
// 			} else {
// 				const request = await fetch(`${REMOTE_DIRECTUS_URL}/${endpoint}`, {
// 					method: 'POST',
// 					headers: {
// 						Authorization: `Bearer ${DIRECTUS_TOKEN}`,
// 						'Content-Type': 'application/json'
// 					},
// 					body: JSON.stringify(item)
// 				})

// 				console.log(request)
// 				console.log(`Created new ${endpoint.slice(0, -1)}: ${item.name}`)
// 			}
// 		}
// 	} catch (error) {
// 		console.error(`Error syncing ${endpoint}:`, error)
// 	}
// }

// ;(async () => {
// 	console.log('Fetching policies and roles from local Directus...')
// 	const policies = await fetchData('policies')
// 	const roles = await fetchData('roles')

// 	console.log(`Fetched ${policies.length} policies and ${roles.length} roles.`)

// 	if (policies.length > 0) {
// 		console.log('Syncing policies to remote Directus...')
// 		await syncData('policies', policies)
// 	}

// 	if (roles.length > 0) {
// 		console.log('Syncing roles to remote Directus...')
// 		await syncData('roles', roles)
// 	}

// 	console.log('Sync completed.')
// })()
