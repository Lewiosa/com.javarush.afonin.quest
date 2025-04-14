<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${question.text}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #1a1a2e;
            color: #e6e6e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
            background-image: radial-gradient(circle at 10% 20%, rgba(26, 26, 46, 0.9) 0%, rgba(40, 40, 80, 0.9) 90%);
        }

        h1 {
            color: #f8f9fa;
            text-align: center;
            margin: 30px 0;
            padding: 20px;
            background-color: rgba(30, 40, 60, 0.7);
            border-radius: 10px;
            border-left: 5px solid #4cc9f0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .question-form {
            max-width: 800px;
            margin: 0 auto;
            background-color: rgba(30, 40, 60, 0.7);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .answer-option {
            display: block;
            margin: 15px 0;
            padding: 15px;
            background-color: rgba(50, 60, 80, 0.5);
            border-radius: 8px;
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
        }

        .answer-option:hover {
            background-color: rgba(70, 80, 100, 0.7);
            border-left: 3px solid #4cc9f0;
            transform: translateX(5px);
        }

        input[type="radio"] {
            margin-right: 15px;
            transform: scale(1.3);
        }

        .btn-submit {
            background-color: #4361ee;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 1.1rem;
            border-radius: 8px;
            margin-top: 20px;
            transition: all 0.3s ease;
            display: block;
            width: 100%;
        }

        .btn-submit:hover {
            background-color: #3a56d4;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(67, 97, 238, 0.4);
        }

        .btn-stop {
            background-color: #f72585;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            margin-top: 15px;
            transition: all 0.3s ease;
            display: block;
            width: 100%;
        }

        .btn-stop:hover {
            background-color: #e5177b;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(247, 37, 133, 0.4);
        }

        .stats-panel {
            position: fixed;
            bottom: 20px;
            left: 20px;
            background-color: rgba(30, 40, 50, 0.9);
            border: 1px solid #4e5d6c;
            border-radius: 8px;
            padding: 12px 15px;
            color: #f8f9fa;
            font-size: 0.9rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(5px);
        }

        .stats-panel div {
            margin: 5px 0;
        }

        @media (max-width: 768px) {
            .question-form {
                padding: 20px;
            }

            h1 {
                font-size: 1.5rem;
                padding: 15px;
            }

            .answer-option {
                padding: 12px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>${question.text}</h1>

    <!-- Основная форма для ответа -->
    <form action="/game" method="post" class="question-form">
        <c:forEach items="${question.answers}" var="answer" varStatus="loop">
            <label class="answer-option">
                <input type="radio" name="answer" value="${loop.index}" required>
                    ${answer}
            </label>
        </c:forEach>

        <button type="submit" class="btn btn-submit">
            <i class="fas fa-paper-plane me-2"></i>Ответить
        </button>
    </form>

    <!-- Отдельная форма для остановки игры -->
    <form action="/stop" method="post" class="mt-3">
        <button type="submit" class="btn btn-stop">
            <i class="fas fa-stop-circle me-2"></i>Остановить игру
        </button>
    </form>
</div>

<div class="stats-panel">
    <div><i class="fas fa-user me-2"></i> Игрок: ${game.playerName}</div>
    <div><i class="fas fa-network-wired me-2"></i> IP: ${ipAddress}</div>
    <div><i class="fas fa-gamepad me-2"></i> Сыграно игр: ${gamesPlayed}</div>
</div>
</body>
</html>