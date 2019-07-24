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
    <form action="rest.do" class="ttt ">
        <input type="submit" value="Показать Web сервис "  id="btn2"/>
    </form>
    <form action="filtrapplications.do" class="ttt ">
        <input type="submit" value="Показать заявки "  id="btn3"/>
        <select  name="filtr">
            <option value="all">Все</option>
            <option value="end">Закрытые</option>
            <option value="ci">На проверке у КИ</option>
            <option value="tariff">На выборе тарифа</option>
            <option value="issue">Одобрены КИ</option>
        </select>
    </form>
    <h5>Заемщики</h5>
<table border="1" class="table table-striped">
    <tbody>
    <tr >
        <td class="rowColor">ID заявки</td>
        <td class="rowColor">ФИО</td>
        <td class="rowColor">Название Тарифа</td>
        <td class="rowColor">Тип займа</td>
        <td class="rowColor">Сумма займа</td>
        <td class="rowColor">Сумма переплаты</td>
        <td class="rowColor">Дата займа</td>
        <td class="rowColor">Срок займа</td>
        <td class="rowColor">Ежемесячный платеж</td>
    </tr
    <#list allAppl as a>
        <tr>
            <td>${a.id}</td>
            <td>
                <#if a.subject??>
                    ${a.subject.getFIO()}
                <#else>
                    --
                </#if>
            </td>
            <td>
                <#if a.tariff??>
                    ${a.tariff.getNameTariff()}
                <#else>
                    --
                </#if>
            </td>
            <td>  <#if a.tariff??>
                ${a.tariff.getTypeLoan().loanName}
            <#else>
                    --
            </#if>
            </td>
            <td>${a.amountMoney!"--"}</td>
            <td>${a.overpaidAmount!"--"}</td>
            <td>${a.loanDate!"--"}</td>
            <td>${a.loanTerm!"--"}</td>
            <td>${a.monthlyPayment!"--"}</td>
        </tr>
    </#list>
    <tbody>
</table>
</div>
</body>

</html>