package com.javarush.afonin.quest.repository;

import com.javarush.afonin.quest.entity.Question;

import java.util.Arrays;
import java.util.List;

public class QuestionRepository {
    private final List<Question> questions = Arrays.asList(
            // 0 - Начальный вопрос
            new Question("Ты потерял память. Принять вызов НЛО?",
                    new String[]{"Принять вызов", "Отклонить вызов"},
                    new int[]{1, 3}),

            // 1 - Приняли вызов
            new Question("Ты принял вызов. Поднимаешься на мостик к капитану?",
                    new String[]{"Подняться на мостик", "Отказаться подниматься на мостик"},
                    new int[]{2, 4}),

            // 2 - На мостике
            new Question("Ты поднялся на мостик. Ты кто?",
                    new String[]{"Рассказать правду о себе", "Солгать о себе"},
                    new int[]{-2, -1}),  // -2 = победа, -1 = поражение

            // Остальные вопросы
            new Question("Ты отклонил вызов. Поражение", new String[]{}, new int[]{-1}),
            new Question("Ты не пошел на переговоры. Поражение", new String[]{}, new int[]{-1}),
            new Question("Твоя ложь разоблачена. Поражение", new String[]{}, new int[]{-1})
    );

    public List<Question> getAllQuestions() {
        return questions;
    }
}