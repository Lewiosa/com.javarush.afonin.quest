package com.javarush.afonin.quest.service;

import com.javarush.afonin.quest.entity.Question;
import com.javarush.afonin.quest.repository.QuestionRepository;

import java.util.List;

public class Game {
    private final List<Question> questions;
    private int currentQuestionIndex;
    private int score;
    private final String playerName;
    private boolean gameOver;
    private boolean playerWon;

    public Game(String playerName) {
        this.playerName = playerName;
        this.questions = new QuestionRepository().getAllQuestions();
        this.currentQuestionIndex = 0;
        this.score = 0;
        this.gameOver = false;
        this.playerWon = false;
    }

    public Question getCurrentQuestion() {
        if (gameOver || currentQuestionIndex < 0 || currentQuestionIndex >= questions.size()) {
            return null;
        }
        return questions.get(currentQuestionIndex);
    }

    public boolean answerQuestion(int answerIndex) {
        if (gameOver) return false;

        Question currentQuestion = getCurrentQuestion();
        if (currentQuestion == null) {
            gameOver = true;
            return false;
        }

        int nextQuestionIndex = currentQuestion.getNextQuestionIndex(answerIndex);

        // Обработка специальных кодов:
        if (nextQuestionIndex == -2) {  // Победа (правда)
            playerWon = true;
            gameOver = true;
            score = getMaxPossibleScore();  // Максимальный балл
            return false; // Возвращаем false, так как игра завершена
        }
        if (nextQuestionIndex == -1) {  // Поражение (ложь)
            gameOver = true;
            playerWon = false;
            return false;
        }

        // Обычный переход на следующий вопрос
        score++;
        currentQuestionIndex = nextQuestionIndex;
        gameOver = (getCurrentQuestion().getAnswers().length == 0);

        return !gameOver;
    }

    public int getMaxPossibleScore() {
        return 3; // Максимум можно получить 3 очка за полное прохождение
    }

    public int getScore() {
        return score;
    }

    public String getPlayerName() {
        return playerName;
    }

    public boolean isGameOver() {
        return gameOver;
    }

    public boolean isPlayerWon() {
        return playerWon;
    }

    public int getCurrentQuestionId() {
        return currentQuestionIndex;
    }
}