<html>

<head>
    <title>Bank System</title>
    <!-- Кодировка веб-страницы -->
    <meta charset="utf-8">
    <!-- Настройка viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Подключаем Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>
<body bgcolor="#DCDCDC">
<div style="padding: 10px;">


<h3><a href="main.do"/><< На главную</a></h3>

<h2>Типы субъектов:</h2>
<table border="1" class="table table-striped">
    <tbody>
    <tr >
        <td class="rowColor">ID Субъекта</td>
        <td class="rowColor">Тип Субъекта</td>
    </tr>
    <#list typeSubj as tsubj>
        <tr>
            <td>${tsubj.id}</td>
            <td>${tsubj.typeSubject}</td>
        </tr>
    </#list>
    <tbody>
</table>
</div>
</body>

</html>