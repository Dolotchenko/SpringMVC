<!DOCTYPE html>
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
<table>
    <form action="addregion.do">
        <tr>
            <td> <input type="submit" value="Добавить регион" id="btn"/> <td/>
            <td> <input name="reg"/> <td/>
        </tr>
    </form>
    <form action="delregion.do">
        <tr>
            <td><input type="submit" value="Удалить регион"  id="btn2"/> <td/>
            <td><select name="select" id="test" >
              <#list regions! as r>
                  <option value="${r.id}">${r.regionName}</option>
              </#list>
            </select> <td/>
        </tr>
    </form>
</table>

    <script>
        if (document.getElementById('test').value==''){
            document.getElementById('btn2').disabled=true;
        }else {
            document.getElementById('btn2').disabled=false;
        }
    </script>

<center><h5>Регионы</h5></center>
<table border="1" class="table table-striped ">
    <tbody>
    <tr >
        <td class="rowColor">ID Региона</td>
        <td class="rowColor">Название Региона</td>
    </tr>
    <#list regions as c>
        <tr >
            <td>${c.id}</td>
            <td>${c.regionName}</td>
        </tr>
    </#list>
    <tbody>
</table>
</div>
</body>

</html>