
<html>

<head>

    <title>Bank System</title>
    <!-- Кодировка веб-страницы -->
    <meta charset="utf-8">
    <!-- Настройка viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Подключаем Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css"  href="css/style.css"/>

</head>

<body>

<div style="padding: 10px;">
    <center><h3 class = "marg" >Добро пожаловать в систему!</h3> </center>
</div>

<a href="logout" />">Logout</a>
<form   action="FC.do">  <input type="submit" value="ПЕРЕЙТИ НА ФИН КОНС."/>  </form>

<div class="container">
    <div class="row">
        <div class=" col-sm-4 ">
            <div class="box">
                <a class="txtsettings" href="regions.do"/>Просмотреть список регионов</a>
            </div>
        </div>
        <div class=" col-sm-4 ">
            <div class="box">
                <a class="txtsettings" href="typeofloans.do"/>Просмотреть типы займов</a>
            </div>
        </div>
        <div class=" col-sm-4 ">
            <div class="box">
                <a class="txtsettings" href="tariffs.do"/>Просмотреть список тарифов</a>
            </div>
        </div>
        <div class=" col-sm-4 ">
            <div class="box">
                <a class="txtsettings" href="subjects.do"/>База субъектов</a></div>
        </div>
        <div class=" col-sm-4 ">
            <div class="box">
                <a class="txtsettings" href="applications.do"/>Список заявок</a>
            </div>
        </div>
    </div>

</div>
<form  class="btntest" action="init.do">  <input type="submit" value="Заполнить базу для тестов"/>  </form>
<div class="footer"> <center>© 2019 Copyright: DolotchenkoMV </center>

</div>

</body>

</html>