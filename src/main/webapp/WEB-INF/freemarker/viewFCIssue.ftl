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

    <center><h1>Заявка № ${contAppl.id}</h1></center>
    <h3><a href="mainFC.do"/><< На главную</a>   </h3>
    <form action="closeappl.do" class="ttt ">


    <table>
        <tr>
            <td>
                <h5>Выбор тарифа</h5>
                <table class="clstbl table table-striped">
                        <tr><td>ФИО: </td><td>${contAppl.subject.FIO} </td></tr>
                        <tr><td>Дата рождения:</td><td> ${contAppl.subject.birthDay}</td></tr>
                        <tr><td>Серия паспорта:</td><td>${contAppl.subject.pasportSeria} </td></tr>
                        <tr><td>Номер паспорта:</td><td> ${contAppl.subject.pasportNumber} </td></tr>
                        <tr><td>Регион проживания:</td><td>${contAppl.subject.region.regionName}</td></tr>
                        <tr><td>Сумма кредита (с учетом %)</td><td> ${contAppl.amountMoney+contAppl.overpaidAmount} </td></tr>
                        <tr><td>Тариф:</td><td> ${contAppl.tariff.getNameTariff()} </td></tr>
                        <tr><td>%:</td><td>${contAppl.tariff.getInterestRate()}</td></tr>
                        <tr><td>Срок кредита(мес)</td><td>${contAppl.getLoanTerm()}</td></tr>
                        <tr><td>Переплата за весь срок:</td><td>${contAppl.getOverpaidAmount()}</td></tr>
                        <tr><td>Ежемесячный платеж:</td><td>${contAppl.getMonthlyPayment()}</td></tr>
                        <tr><td>Сумма кредита:</td><td> ${contAppl.amountMoney} руб.</td></tr>
                        <tr><td>Укажите дату назначения сделки:</td><td> <input id="issuedate" name="loanDate" onmousemove="validation()"/></td></tr>
                </table>
            </td>

        </tr>
    </table>


        <input type="button" value="Завершить"  id="btnContinue" class="btncont" onclick=" closeAppl()"  />
        <input name="appl" value="${contAppl.id}" type="hidden" >

    </form>


</div>
<script>
    //устанавливаем тариф в заявку
function closeAppl() {
    var isAdmin = confirm("Заявка будет исполнена в указанное время. Продолжить?");
    if(isAdmin){
       document.forms[0].submit();
    }
}

    document.getElementById('btnContinue').disabled=true;


function validation() {

    if (document.getElementById('issuedate').value=='' ){
        document.getElementById('btnContinue').disabled=true;
    }else {
        document.getElementById('btnContinue').disabled=false;
    }
}




</script>
</body>

</html>