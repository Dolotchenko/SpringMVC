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
        <form action="addtypeloan.do">
            <tr>
                <td> <input type="submit" value="Добавить тип займа" id="btn"/> <td/>
                <td> <input name="tl"/> <td/>
            </tr>
        </form>
        <form action="deltypeloan.do">
            <tr>
                <td><input type="submit" value="Удалить "  id="btn2"/> <td/>
                <td><select name="select" id="test" >
                      <#list loans! as l>
                          <option value="${l.id}">${l.loanName}</option>
                      </#list>
                </select> <td/>
            </tr>
        </form>
        <table/>

        <script>
            if (document.getElementById('test').value==''){
                document.getElementById('btn2').disabled=true;
            }else {
                document.getElementById('btn2').disabled=false;
            }
        </script>


<h2>Типы займов:</h2>
<table border="1" class="table table-striped">
    <tbody>
    <tr >
        <td class="rowColor">ID Займа</td>
        <td class="rowColor">Тип Займа</td>
    </tr>
    <#list loans as l>
        <tr>
            <td>${l.id}</td>
            <td>${l.loanName}</td>
        </tr>
    </#list>
    <tbody>
</table>
</div>
</body>

</html>