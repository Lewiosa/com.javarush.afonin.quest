package com.javarush.afonin.quest.controller;

import com.javarush.afonin.quest.service.Game;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "stopServlet", value = "/stop")
public class StopServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        System.out.println(">>> stopServlet interrupts the game");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Game game = (Game) session.getAttribute("game");

        if (game != null) {
            // Помечаем игру как завершенную (проигрыш)
            game.setGameOver(true);
            game.setPlayerWon(false);
        }

        // Увеличиваем счетчик игр
        Integer gamesPlayed = (Integer) session.getAttribute("gamesPlayed");
        if (gamesPlayed == null) {
            gamesPlayed = 0;
        }
        session.setAttribute("gamesPlayed", gamesPlayed + 1);

        // Перенаправляем на страницу результата
        resp.sendRedirect(req.getContextPath() + "/result");
    }
}