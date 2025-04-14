<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Игра завершена</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #0f0c29;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        .result-container {
            background-color: rgba(15, 23, 42, 0.9);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            width: 100%;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }

        h1 {
            color: #ffffff;
            margin-bottom: 30px;
            font-weight: 700;
            text-shadow: 0 0 15px rgba(100, 149, 237, 0.7);
        }

        .result-score {
            font-size: 1.5rem;
            margin: 25px 0;
            padding: 15px;
            border-radius: 10px;
            background-color: rgba(30, 41, 59, 0.7);
            border-left: 4px solid #4f46e5;
        }

        .player-name {
            color: #4f46e5;
            font-weight: bold;
        }

        .stats {
            margin: 20px 0;
            padding: 0;
            list-style: none;
        }

        .stats li {
            margin: 10px 0;
            padding: 10px;
            background-color: rgba(30, 41, 59, 0.5);
            border-radius: 8px;
        }

        .restart-btn {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background-color: #4f46e5;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(79, 70, 229, 0.3);
        }

        .restart-btn:hover {
            background-color: #4338ca;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(79, 70, 229, 0.4);
            color: white;
            text-decoration: none;
        }

        .icon {
            margin-right: 10px;
            color: #818cf8;
        }

        .progress-container {
            height: 10px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            margin: 25px 0;
            overflow: hidden;
        }

        .progress-bar {
            height: 100%;
            background: linear-gradient(to right, #4f46e5, #818cf8);
            border-radius: 5px;
            transition: width 1s ease-in-out;
        }

        .result-message {
            font-size: 1.8rem;
            margin-bottom: 25px;
            padding: 15px;
            border-radius: 10px;
            font-weight: bold;
        }

        .text-success {
            color: #4ade80;
            background-color: rgba(74, 222, 128, 0.1);
        }

        .text-danger {
            color: #f87171;
            background-color: rgba(248, 113, 113, 0.1);
        }

        @media (max-width: 576px) {
            .result-container {
                padding: 25px;
            }

            h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
<div class="result-container">
    <h1>Игра завершена!</h1>

    <!-- Добавляем блок с результатом -->
    <div class="result-message ${playerWon ? 'text-success' : 'text-danger'}">
        <i class="fas ${playerWon ? 'fa-trophy' : 'fa-skull'}"></i>
        ${playerWon ? 'ПОБЕДА! Тебя вернули домой!' : 'ПОРАЖЕНИЕ!'}
    </div>

    <div class="result-score">
        <span class="player-name">${playerName}</span>, вы прошли
        <strong>${score}</strong> из ${maxScore} этапов
    </div>

    <div class="progress-container">
        <div class="progress-bar" style="width: ${(score/3)*100}%"></div>
    </div>

    <ul class="stats">
        <li><i class="fas fa-network-wired icon"></i>Ваш IP: ${ipAddress}</li>
        <li><i class="fas fa-gamepad icon"></i>Сыграно игр: ${gamesPlayed}</li>
    </ul>

    <a href="/" class="restart-btn">
        <i class="fas fa-redo-alt"></i> Начать заново
    </a>
</div>

<script>
    // Анимация прогресс-бара при загрузке страницы
    document.addEventListener('DOMContentLoaded', function() {
        const progressBar = document.querySelector('.progress-bar');
        progressBar.style.width = '0';
        setTimeout(() => {
            progressBar.style.width = '${(score/3)*100}%';
        }, 100);
    });
</script>
</body>
</html>