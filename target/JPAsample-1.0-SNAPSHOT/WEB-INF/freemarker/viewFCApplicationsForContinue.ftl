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
<body bgcolor="#DCDCDC">
<div style="padding: 10px;">


<h3><a href="main.do"/><< На главную</a></h3>

    <form action="taketoworkapplication.do">
        <tr>
            <td><select name="appl" id="test" >
              <#list contAppl! as с>

                  <option value="${с.id}">${с.id} </option>
              </#list>
            </select> <td/>
            <td><input type="submit" value="Продолжить заявку"  id="btn2"/> <td/>
        </tr>
    </form>
<h5>Список заявок для продолжения</h5>
<table border="1" class="table table-striped">
    <tbody>
    <tr >
        <td class="rowColor">ID заявки</td>
        <td class="rowColor">Статус</td>
        <td class="rowColor">ФИО</td>

    </tr
    <#list contAppl as a>
        <tr>
            <td>${a.id}</td>
            <td>${a.status}</td>
            <td>
                ${(a.subject.FIO)!"-----------"}
            </td>
        </tr>
    </#list>
    <tbody>
</table>
</div>
</body>

</html>