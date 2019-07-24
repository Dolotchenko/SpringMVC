<#assign security=JspTaglibs["http://www.springframework.org/security/tags"] />
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

   <@security.authorize  access="hasAnyAuthority('ROLE_USER')">
       <center><h1>Заявка № ${newAppl}</h1></center>
   </@security.authorize>
   <h3><a href="main.do"/><< На главную</a>   </h3>



<table>
    <tr>
        <td>
            <h5>Новый субъект</h5>

                <table class="clstbl table table-striped">
                    <form action="addsubject.do">
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

                           <@security.authorize  access="hasAnyAuthority('ROLE_USER')">
                                <input name="newAppl" value="${newAppl}" type="hidden" >
                           </@security.authorize>

                    </form>

                        <@security.authorize  access="hasAnyAuthority('ROLE_ADMIN')">
                            <form action="delsubject.do">
                                <table class="clstbl table table-striped">
                                    <tr>
                                        <td><input type="submit" value="Удалить субъект"  id="btn2"/> </td>
                                        <td> <input name="id"/> </td>
                                    </tr>
                                </table>
                            </form>
                        </@security.authorize>

                </table>

        </td>
        <td> <@security.authorize  access="hasAnyAuthority('ROLE_USER')">
            <h5>Поиск в базе</h5>

                <table class="clstbl table table-striped " >
                    <form  action="findsubject.do" class="ttt">
                        <tr>
                            <td> Паспорт серия: </td>
                            <td> <input name="ser"/> </td>
                        </tr>
                        <tr>
                            <td> Паспорт номер: </td>
                            <td> <input name="num"/> </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Найти субъект"  id="btn2"/> </td><td></td>
                            <input name="newAppl" value="${newAppl}" type="hidden" >
                        </tr>
                     </form>
                </table>
        </@security.authorize></td>
    </tr>
</table>
     <@security.authorize  access="hasAnyAuthority('ROLE_USER')">
<form action="setsubject.do" class="ttt ">
    <input name="ids" type="hidden" id="toAppl"/>
    <input type="submit" value="Продолжить"  id="btnContinue" class="btncont" />
    <input name="newAppl" value="${newAppl}" type="hidden" >
</form>
     </@security.authorize></td>

<h5>Просмотр субъектов</h5>
<table border="1" class="table table-striped" id="listsubject">
    <tbody>
    <tr >
        <td class="rowColor">ID Субъекта</td>
        <td class="rowColor">ФИО</td>
        <td class="rowColor">Дата рождения</td>
        <td class="rowColor">Паспорт серия</td>
        <td class="rowColor">Паспорт номер</td>
        <td class="rowColor">Регион проживания</td>
        <@security.authorize  access="hasAnyAuthority('ROLE_USER')">
            <td class="rowColor">Выбрать заемщика</td>
        </@security.authorize>
    </tr>
    <#list allSubj as tsubj>
        <tr>
            <td>${tsubj.id}</td>
            <td>${tsubj.FIO}</td>
            <td>${tsubj.birthDay}</td>
            <td>${tsubj.pasportSeria}</td>
            <td>${tsubj.pasportNumber}</td>
            <td>${tsubj.region.regionName}</td>
        <@security.authorize  access="hasAnyAuthority('ROLE_USER')">
            <td> <input type="radio" name="selectedsubj" value="${tsubj.id}" id="id_radio" onchange="setSubjintoApplication('id_radio', 'toAppl')" ></td>
        </@security.authorize>
        </tr>
    </#list>
    <tbody>
</table>
</div>
<script>
   // alert(document.getElementsByTagName("tr")[0].innerHTML);
   //  var table = document.getElementById("listsubject");
   //  var cells = table.getElementsByTagName("td");
   //
   //  for (var i = 0; i < cells.length; i++) {
   //      var status = cells[i+6].firstChild.nodeValue;
   //      //alert(status);
   //  }

   //передаем subject, который выбрали по radio чтобы добавить в Application
   function setSubjintoApplication (id_radio, toAppl){

    var radio=document.querySelector('input[name="selectedsubj"]:checked').value;
    document.getElementById(toAppl).value=radio;
    checkSelect();
   }

   checkSelect();


   function checkSelect(){
       if (document.getElementById('toAppl').value==''){
           document.getElementById('btnContinue').disabled=true;
       }else {
           document.getElementById('btnContinue').disabled=false;
       }
   }


</script>
</body>

</html>