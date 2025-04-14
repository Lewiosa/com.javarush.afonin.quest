package com.javarush.afonin.quest.controller;

import com.javarush.afonin.quest.service.Game;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "resultServlet", value = "/result")
public class ResultServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        System.out.println(">>> ResultServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Game game = (Game) session.getAttribute("game");

        // Если игры нет или игра не завершена - перенаправляем на страницу игры
        if (game == null || !game.isGameOver()) {
            resp.sendRedirect(req.getContextPath() + "/game");
            return;
        }

        // Получаем и обновляем статистические данные
        String ipAddress = (String) session.getAttribute("ipAddress");
        Integer gamesPlayed = (Integer) session.getAttribute("gamesPlayed");
        if (gamesPlayed == null) {
            gamesPlayed = 0;
        }

        // Увеличиваем счетчик сыгранных игр
        session.setAttribute("gamesPlayed", gamesPlayed + 1);

        // Устанавливаем атрибуты для JSP
        req.setAttribute("score", game.getScore());
        req.setAttribute("maxScore", game.getMaxPossibleScore()); // Добавляем максимальный счет
        req.setAttribute("playerName", game.getPlayerName());
        req.setAttribute("ipAddress", ipAddress);
        req.setAttribute("gamesPlayed", gamesPlayed + 1);
        req.setAttribute("playerWon", game.isPlayerWon());

        // Передаем управление JSP
        req.getRequestDispatcher("/result.jsp").forward(req, resp);

        // Очищаем игру из сессии после показа результатов
        session.removeAttribute("game");
    }

    @Override
    public void destroy() {
        System.out.println(">>> ResultServlet destroyed");
    }
}