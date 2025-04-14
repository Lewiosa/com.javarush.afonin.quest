package com.javarush.afonin.quest.controller;

import com.javarush.afonin.quest.service.Game;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Сервлет для обработки страницы результатов игры.
 * Отображает итоги игры (победа/поражение) и статистику игрока.
 */
@WebServlet(name = "resultServlet", value = "/result")
public class ResultServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        System.out.println(">>> ResultServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // Получаем объект игры из сессии
        Game game = (Game) session.getAttribute("game");

        // Если игры нет или игра не завершена - перенаправляем на страницу игры
        if (game == null || !game.isGameOver()) {
            resp.sendRedirect(req.getContextPath() + "/game");
            return;
        }

        // Получаем статистические данные из сессии
        String ipAddress = (String) session.getAttribute("ipAddress");
        Integer gamesPlayed = (Integer) session.getAttribute("gamesPlayed");

        // Устанавливаем атрибуты для JSP
        req.setAttribute("score", game.getScore());
        req.setAttribute("playerName", game.getPlayerName());
        req.setAttribute("ipAddress", ipAddress);
        req.setAttribute("gamesPlayed", gamesPlayed);
        req.setAttribute("playerWon", game.isPlayerWon());

        // Передаем управление JSP для отображения результатов
        req.getRequestDispatcher("/result.jsp").forward(req, resp);

        // Очищаем игру из сессии после показа результатов
        session.removeAttribute("game");
    }

    @Override
    public void destroy() {
        System.out.println(">>> ResultServlet destroyed");
    }
}