export type PracticeExam = Directus.SchemaMapper<
	Directus.PracticeExams,
	{
		components: Directus.SchemaMapper<
			Directus.PracticeExamsComponents,
			{
				questions: Directus.PracticeExamsComponentsQuestions[]
			}
		>[]
	}
>
