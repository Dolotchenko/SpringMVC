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

    <center><h1>Заявка № ${objAppl.id}</h1></center>
    <h3><a href="main.do"/><< На главную</a>   </h3>
    <form action="settariff.do" class="ttt ">


    <table>
        <tr>
            <td>
                <h5>Выбор тарифа</h5>
                <table class="clstbl table table-striped">
                        <tr><td>ФИО: </td><td>${objAppl.subject.FIO} </td></tr>
                        <tr><td>Дата рождения:</td><td> ${objAppl.subject.birthDay}</td></tr>
                        <tr><td>Серия паспорта:</td><td>${objAppl.subject.pasportSeria} </td></tr>
                        <tr><td>Номер паспорта:</td><td> ${objAppl.subject.pasportNumber} </td></tr>
                        <tr><td>Регион проживания:</td><td>${objAppl.subject.region.regionName}</td></tr>
                        <tr><td>Сумма кредита</td><td> <input name="amountmoney" id="amountmoney" onmousemove="validation()"/> руб. </td></tr>
                        <tr><td>Выберите тариф:</td><td><select name="idtariff" id="test" >
                                                  <#list tariffs! as t>
                                                      <option value="${t.id}" > ${t.id} </option>
                                                      <#assign myid = t.getInterestRate()>
                                                  </#list></select></td></tr>



                        <tr><td>%:</td><td><select name="perc" id="perc" >
                                                  <#list tariffs! as t>
                                                      <option value="${t.id}" > ${t.getInterestRate()} </option>
                                                  </#list></select></td></tr>
                        <tr><td>Срок кредита(мес)</td><td><input name="loanterm" id="loanterm" onmouseout="validation()" /></td></tr>
                        <tr><td>Переплата за весь срок:</td><td><input name="overpaid" readonly id="overpaid"/></td></tr>
                        <tr><td>Ежемесячный платеж:</td><td><input name="payment" readonly id="payment"/> руб.</td></tr>
                        <tr><td>Общая сумма кредита:</td><td><input name="s" readonly id="s"/> руб.</td></tr>
                        <tr><td>Нажмите чтобы рассчитать:</td><td> <input type="button" value="Рассчитать"  id="btnCalc"  onclick="calculate()" /></td></tr>
                </table>
            </td>

        </tr>
    </table>


        <input type="button" value="Продолжить"  id="btnContinue" class="btncont" onclick="setTariff()" />
        <input name="numAppl" value="${objAppl.id}" type="hidden" >
        <input name="idtariff"  type="hidden" id="idtariff" >
    </form>

    <h5>Список тарифов</h5>
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
<script>
    //устанавливаем тариф в заявку
function setTariff() {
    var a= document.getElementById("test").value;
    var b= document.getElementById("idtariff").value=a;
    var isAdmin = confirm("Заявка будет направлена на проверку Кредитному инспектору. Продолжить?");
    if(isAdmin){
       document.forms[0].submit();
    }
}

function calculate() {
    var amountmoney=document.getElementById("amountmoney").value;
    var perc=document.getElementById("perc");
    percval=perc.options[perc.selectedIndex].text;
    var loanterm=document.getElementById("loanterm").value=Math.ceil(document.getElementById("loanterm").value/12)*12;

    var sumoverpaid=amountmoney*(Number(percval)/100)*loanterm/12;
    document.getElementById("overpaid").value=sumoverpaid;
    document.getElementById("payment").value=(Number(amountmoney)+Number(sumoverpaid))/Number(loanterm);
    var s=document.getElementById("s").value=Number(amountmoney)+Number(sumoverpaid);
    //console.log(tar.options[tar.selectedIndex].get);
    //alert(perc.options[perc.selectedIndex].text);
        document.getElementById('btnContinue').disabled=false;


}
    document.getElementById('btnContinue').disabled=true;
    document.getElementById('btnCalc').disabled=true;

function validation() {

    if ((document.getElementById('loanterm').value=='' || document.getElementById('loanterm').value=='0') &&
            (document.getElementById('amountmoney').value=='' ||document.getElementById('amountmoney').value=='0')){
        document.getElementById('btnCalc').disabled=true;
    }else {
        document.getElementById('btnCalc').disabled=false;
    }
}




</script>
</body>

</html>