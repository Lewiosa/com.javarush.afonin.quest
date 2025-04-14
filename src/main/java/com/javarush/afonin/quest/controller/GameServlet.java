package com.javarush.afonin.quest.controller;

import com.javarush.afonin.quest.service.DetectorIP;
import com.javarush.afonin.quest.service.Game;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "gameServlet", value = "/game")
public class GameServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        System.out.println(">>> gameServlet starting");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        Game game = (Game) session.getAttribute("game");

        // Получаем IP-адрес пользователя
        String ipAddress = new DetectorIP(req).currentIP();
        session.setAttribute("ipAddress", ipAddress);

        // Инициализируем счетчик игр, если он еще не существует
        Integer gamesPlayed = (Integer) session.getAttribute("gamesPlayed");
        if (gamesPlayed == null) {
            gamesPlayed = 0;
            session.setAttribute("gamesPlayed", gamesPlayed);
        }
        if (game == null) {
            String playerName = req.getParameter("playerName");
            game = new Game(playerName);
            session.setAttribute("game", game);
        }

        req.setAttribute("question", game.getCurrentQuestion());
        req.getRequestDispatcher("/question.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        Game game = (Game) session.getAttribute("game");

        int answerIndex = Integer.parseInt(req.getParameter("answer"));
        boolean hasNextQuestion = game.answerQuestion(answerIndex);

        if (hasNextQuestion) {
            resp.sendRedirect("/game");
        } else {
            // Увеличиваем счетчик игр после завершения игры
            Integer gamesPlayed = (Integer) session.getAttribute("gamesPlayed");
            session.setAttribute("gamesPlayed", gamesPlayed + 1);
            resp.sendRedirect("/result");
        }

    }
}

