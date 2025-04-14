<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Welcome to the game</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    body {
      background-color: #0f0f1a;
      color: #e0e0e0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-image: radial-gradient(circle at 10% 20%, rgba(15, 15, 26, 0.9) 0%, rgba(40, 40, 60, 0.9) 90%);
    }

    .how-section1 {
      padding: 50px 0;
    }

    .how-section1 h1, .how-section1 h4 {
      color: #f8f9fa;
      font-weight: 600;
      text-shadow: 0 0 10px rgba(100, 149, 237, 0.5);
    }

    .how-section1 .text-muted {
      color: #b8c2cc !important;
      font-size: 1.1rem;
      line-height: 1.8;
    }

    .how-img {
      text-align: center;
    }

    .how-img img {
      width: 200px;
      height: 200px;
      object-fit: cover;
      border: 3px solid #4e5d6c;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
      transition: all 0.3s ease;
    }

    .how-img img:hover {
      transform: scale(1.05);
      box-shadow: 0 8px 20px rgba(100, 149, 237, 0.4);
    }

    .rounded-circle {
      border-radius: 50% !important;
    }

    .btn-outline-secondary {
      color: #f8f9fa;
      border-color: #6c757d;
      transition: all 0.3s ease;
      margin-left: 10px;
    }

    .btn-outline-secondary:hover {
      background-color: #4e5d6c;
      border-color: #4e5d6c;
      transform: translateY(-2px);
    }

    input[type="text"] {
      background-color: #adb2b7;
      border: 1px solid #4e5d6c;
      color: #000;
      padding: 10px 15px;
      border-radius: 5px;
      transition: all 0.3s ease;
    }

    input[type="text"]:focus {
      outline: none;
      border-color: #6699ff;
      box-shadow: 0 0 10px rgba(102, 153, 255, 0.5);
      background-color: #fff;
    }

    .stats-panel {
      position: fixed;
      bottom: 20px;
      left: 20px;
      background-color: rgba(30, 40, 50, 0.8);
      border: 1px solid #4e5d6c;
      border-radius: 5px;
      padding: 10px 15px;
      color: #f8f9fa;
      font-size: 0.9rem;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      backdrop-filter: blur(5px);
    }

    .section-divider {
      height: 1px;
      background: linear-gradient(to right, transparent, #4e5d6c, transparent);
      margin: 40px 0;
    }

    .img-size{
      width: 20px;
    }

    @media (max-width: 768px) {
      .how-img {
        margin-bottom: 30px;
      }

      .how-section1 .row {
        flex-direction: column;
      }

      .how-section1 .col-md-6 {
        order: 2;
      }

      .how-section1 .col-md-2 {
        order: 1;
      }
    }
  </style>
</head>
<body>

<div class="container how-section1">
  <div class="row align-items-center">
    <div class="col-md-2 how-img">
      <img src="img/1.jpg" class="rounded-circle img-fluid img-size" alt="Космический корабль"/>
    </div>
    <div class="col-md-6">
      <h1 class="mb-4">Пролог</h1>
      <p class="text-muted">
        Ты стоишь в космическом порту и готов подняться на борт
        своего корабля. Разве ты не об этом мечтал?
        Стать капитаном галактического судна с экипажем,
        который будет совершать подвиги под твоим командованием.
        Так что вперед!
      </p>
    </div>
  </div>

  <div class="section-divider"></div>

  <div class="row align-items-center">
    <div class="col-md-6 order-md-1">
      <h4 class="mb-3">Знакомство с экипажем</h4>
      <p class="text-muted">
        Когда ты поднялся на борт корабля, тебя поприветствовала
        девушка с черной папкой в руках:
        <br><br>
        – Здравствуйте, командир! Я Зинаида – ваша помощница.
        Видите? Там в углу пьет кофе наш штурман – сержант Перегарный Серж,
        под штурвалом спит наш бортмеханик – Черный Богдан.
        <br><br>
        А как обращаться к вам?
      </p>
    </div>
    <div class="col-md-2 how-img order-md-2">
      <img src="img/2.jpeg" class="rounded-circle img-fluid" alt="Экипаж корабля"/>
    </div>
  </div>
</div>

<section class="bg-dark text-center p-5 mt-4">
  <div class="container p-3">
    <h3 class="text-white mb-4">ДЛЯ НАЧАЛА ИГРЫ ПРЕДСТАВЬТЕСЬ</h3>
    <form action="/game" method="get">
      <div class="d-flex justify-content-center">
        <input type="text" name="playerName" class="form-control col-md-4"
               placeholder="Введите имя"
               required pattern="[A-Za-zА-Яа-яЁё]+"
               style="max-width: 400px;">
        <button type="submit" class="btn btn-outline-secondary">
          <i class="fas fa-rocket me-2"></i>Представиться
        </button>
      </div>
    </form>
  </div>
</section>

<c:if test="${not empty gamesPlayed}">
  <div class="stats-panel">
    <div><i class="fas fa-network-wired me-2"></i> IP: ${ipAddress}</div>
    <div><i class="fas fa-gamepad me-2"></i> Сыграно игр: ${gamesPlayed}</div>
  </div>
</c:if>

</body>
</html>