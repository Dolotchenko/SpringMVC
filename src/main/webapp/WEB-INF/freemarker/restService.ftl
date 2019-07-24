<!DOCTYPE html>
<html>
<head>
    <title>Start Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!-- Настройка viewport -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Подключаем Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css"  href="css/style.css"/>
</head>
<body>

<ul>
    <li><a href="main.do"/>На главную</a></li>
</ul>


<button onclick="allApplications()">Все заявки</button>



<ul id="lst"></ul>
<table border="1" class="table table-striped" id="allappl">
    <tr >
        <td class="rowColor">ID заявки</td>
        <td class="rowColor">Название Тарифа</td>
        <td class="rowColor">Сумма займа</td>
        <td class="rowColor">Сумма переплаты</td>
        <td class="rowColor">Дата займа</td>
        <td class="rowColor">Срок займа</td>
        <td class="rowColor">Ежемесячный платеж</td>
        <td class="rowColor">Резуьтат проверки КИ</td>
    </tr>
</table>
<script>

    function allApplications() {
        var tbl=document.getElementById('allappl');
        tbl.setAttribute('border','2');
        var tbody=document.createElement('tbody');
        // tbl=document.createAttribute('id','cattable');
        // var tr = document.createElement('tr');
        // var td=document.createElement('td');
        fetch('http://localhost:8080/api/allapplications')
                .then(function(response) {
                    return response.json();
                })
                .then(function(myJson) {

                    for (var i=0; i<myJson.length; i++ ){
                        var tr = document.createElement('tr');
                        var td=document.createElement('td');
                        var td1=document.createElement('td');
                        var td2=document.createElement('td');
                        var td3=document.createElement('td');
                        var td4=document.createElement('td');
                        var td5=document.createElement('td');
                        var td6=document.createElement('td');
                        var td7=document.createElement('td');
                        var td8=document.createElement('td');

                        td.innerHTML = myJson[i].id;
                        td1.innerHTML = myJson[i].amountMoney;
                        td2.innerHTML = myJson[i].overpaidAmount;
                        td3.innerHTML= myJson[i].loanDate;
                        td4.innerHTML= myJson[i].loanTerm;
                        td5.innerHTML= myJson[i].monthlyPayment;
                        td6.innerHTML= myJson[i].status;
                        td7.innerHTML= myJson[i].checkCI;
                        td8.innerHTML=`<button onclick=${r"deleteAppl(${myJson[i].id})"}>X</button>`;

                        tr.appendChild( td );
                        tr.appendChild( td1 );
                        tr.appendChild( td2 );
                        tr.appendChild(td3);
                        tr.appendChild( td4 );
                        tr.appendChild( td5 );
                        tr.appendChild( td6 );
                        tr.appendChild(td7);
                        tr.appendChild(td8);
                        tbl.appendChild(tr);
                    }
                });

    }

    function deleteAppl(id) {

        fetch('http://localhost:8080/api/appldel/'+id, {method: 'DELETE'}
        ).catch(function(err) {
            alert(err);

        });

    }



</script>

</body>
</html>
