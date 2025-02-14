import type { PracticeExam } from '$lib/stores/exam/exam.svelte'
import { getContext, setContext } from 'svelte'

export type ExamContext = {
	outcome: PracticeExam
	showResult: boolean
}

export const setExamContext = (context: ExamContext) => setContext('EXAM_RESULT', context)
export const getExamContext = () => getContext<ReturnType<typeof setExamContext>>('EXAM_RESULT')
