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
        <tr>
            <td>
                <table class="clstbl table table-striped">
                    <form action="addtariff.do" class="ttt ">
                        <tr><td>Название тарифа: </td><td><input name="nametariff"  id="nametariff"/></td></tr>
                        <tr><td>Ставка %:</td><td><input name="perc"  id="perc"/></td></tr>
                        <tr><td>Мин. сумма:</td><td><input name="minsum"  id="minsum"/></td></tr>
                        <tr><td>Макс. сумма:</td><td><input name="maxsum"  id="maxsum"/> </td></tr>
                        <tr><td>Тип займа:</td><td><select name="typeloan" id="test" >
                                                                  <#list loans! as t>
                                                                      <option value="${t.id}" > ${t.loanName} </option>

                                                                  </#list></select></td></tr>
                        <tr><td><input type="submit" value="Добавить"  id="Add" /></td><td></td></tr>

                    </form>
                    <table class="clstbl table table-striped">
                    <form action="deltariff.do">
                        <tr>
                            <td><input type="submit" value="Удалить "  id="btn2"/> </td>
                            <td><select name="select" id="test" >
                              <#list tariffs! as l>
                                  <option value="${l.id}">${l.nameTariff}</option>
                              </#list>
                            </select> </td>
                        </tr>
                    </form>
                    </table>
                </table>
            </td>
        </tr>
    </table>
<h5>Список Тарифов</h5>
<table border="1" class="table table-striped">
    <tbody>
    <tr >
        <td class="rowColor">ID Тарифа</td>
        <td class="rowColor">Название тарифа</td>
        <td class="rowColor">Ставка, %</td>
        <td class="rowColor">Мин. сумма</td>
        <td class="rowColor">Макс. сумма</td>
        <td class="rowColor">Тип займа</td>
    </tr>
    <#list tariffs as tar>
        <tr>
            <td>${tar.id}</td>
            <td>${tar.nameTariff}</td>
            <td>${tar.interestRate}</td>
            <td>${tar.minSum}</td>
            <td>${tar.maxSum}</td>
            <td>${tar.typeLoan.loanName}</td>
        </tr>
    </#list>
    <tbody>
</table>
</div>
</body>

</html>