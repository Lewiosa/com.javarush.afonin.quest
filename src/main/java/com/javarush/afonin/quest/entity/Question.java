package com.javarush.afonin.quest.entity;

public class Question {
    private String text;
    private String[] answers;
    private int[] nextQuestionIndices; // Массив индексов следующих вопросов для каждого ответа

    public Question(String text, String[] answers, int[] nextQuestionIndices) {
        this.text = text;
        this.answers = answers;
        this.nextQuestionIndices = nextQuestionIndices;
    }

    public String getText() {
        return text;
    }

    public String[] getAnswers() {
        return answers;
    }

    public int getNextQuestionIndex(int answerIndex) {
        if (answerIndex >= 0 && answerIndex < nextQuestionIndices.length) {
            return nextQuestionIndices[answerIndex];
        }
        return -1; // Если что-то пошло не так - завершаем игру
    }
}