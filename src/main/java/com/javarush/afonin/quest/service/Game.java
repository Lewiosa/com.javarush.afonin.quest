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
            endGame(false);
            return false;
        }

        int nextQuestionIndex = currentQuestion.getNextQuestionIndex(answerIndex);

        // Обработка вариантов, ведущих к проигрышу (3 или 4)
        if (nextQuestionIndex == 3 || nextQuestionIndex == 4) {
            endGame(false);
            return false;
        }

        // Обработка специальных кодов:
        if (nextQuestionIndex == -2) {  // Победа
            endGame(true);
            return false;
        }
        if (nextQuestionIndex == -1) {  // Поражение
            endGame(false);
            return false;
        }

        // Обычный переход на следующий вопрос
        score++;
        currentQuestionIndex = nextQuestionIndex;

        // Проверяем, есть ли следующий вопрос
        if (getCurrentQuestion() == null) {
            endGame(false);
            return false;
        }

        return true;
    }

    public void endGame(boolean playerWon) {
        this.gameOver = true;
        this.playerWon = playerWon;

        if (playerWon) {
            this.score = getMaxPossibleScore();
        }

        if (!playerWon && (currentQuestionIndex == 3 || currentQuestionIndex == 4)) {
            this.score = 0;
        }
    }

    // Сеттеры для gameOver и playerWon
    public void setGameOver(boolean gameOver) {
        this.gameOver = gameOver;
    }

    public void setPlayerWon(boolean playerWon) {
        this.playerWon = playerWon;
    }

    public int getMaxPossibleScore() {
        return 3;
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