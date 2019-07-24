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

    <h2>Редактирование таблицы субъектов</h2>
    <form action="addsubject.do">
        <table>
            <tr><td>ФИО: </td><td> <input name="fio"/> </td></tr>
            <tr><td>Дата рождения:</td><td> <input name="birth"/> </td></tr>
            <tr><td>Серия паспорта:</td><td> <input name="passeria"/> </td></tr>
            <tr><td>Номер паспорта:</td><td> <input name="pasnumber"/> </td></tr>
            <tr><td>Регион проживания:</td><td><select name="regid" id="test" >
                                                  <#list regions! as r>
                                                      <option value="${r.id}">${r.regionName}</option>
                                                  </#list>
                                                </select> </td></tr>
            <tr><td> <input type="submit" value="Добавить субъект" id="btn"/> </td><td></td> </tr>
        </table>
    </form>


    <form action="delsubject.do">
        <table>
            <tr>
                <td><input type="submit" value="Удалить субъект"  id="btn2"/> </td>
                <td> <input name="id"/> </td>
            </tr>
        </table>
    </form>




<h2>Просмотр субъектов</h2>
<table border="1" class="table table-striped" id="listsubject">
    <tbody>
    <tr >
        <td class="rowColor">ID Субъекта</td>
        <td class="rowColor">ФИО</td>
        <td class="rowColor">Дата рождения</td>
        <td class="rowColor">Паспорт серия</td>
        <td class="rowColor">Паспорт номер</td>
        <td class="rowColor">Регион проживания</td>
    </tr>
    <#list allSubj as tsubj>
        <tr>
            <td>${tsubj.id}</td>
            <td>${tsubj.FIO}</td>
            <td>${tsubj.birthDay}</td>
            <td>${tsubj.pasportSeria}</td>
            <td>${tsubj.pasportNumber}</td>
            <td>${tsubj.region.regionName}</td>
            <td><input type="radio" checked></td>
        </tr>
    </#list>
    <tbody>
</table>
</div>
<script>
   // alert(document.getElementsByTagName("tr")[0].innerHTML);
    var table = document.getElementById("listsubject");
    var cells = table.getElementsByTagName("td");
    // alert(cells.length);
    for (var i = 0; i < cells.length; i++) {
        var status = cells[i+6].firstChild.nodeValue;
        //alert(status);
    }
</script>
</body>

</html>