<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-grid.min.css" rel="stylesheet" >
    <link href="${pageContext.request.contextPath}resources/css/bootstrap-reboot.css" rel="stylesheet">

</head>
<body>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow" style="border-bottom: 1px solid #eee;">
    <h5 class="my-0 mr-md-auto font-weight-normal">МОИФОТО</h5>
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="#catalog">Каталог</a>
        <a class="p-2 text-dark" href="#catalog">Контакты</a>
    </nav>
    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/">Выход</a>
</div>

<form method="POST" action="<c:url value="/equipment/add"/>">
    <table class="table information_json">
        <tr>
            <th>Возможности</th>
            <th></th>
        </tr>
        <tr class="new_ability">
            <td></td>
            <td><span class="btn btn-success plus pull-right">+</span></td>
        </tr>
        <tr><td><input name="type" type="hidden" value="${type}"></td></tr>
        <tr><td><input name="name" type="hidden" value="${name}"></td></tr>
        <tr><th><input type="submit" class="form-control" value="<spring:message text="Создать"/>"></th></tr>
    </table>
</form>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script>
    // формируем новые поля
    jQuery('.plus').click(function(){
        jQuery('.new_ability').before(
            '<tr>' +
            '<td></td>'+
            '<td><select  class="form-control" name="ablt" placeholder="Оборудование"> <c:forEach items="${offer}" var="obj2"> <option value="${obj2.name}">${obj2.name}</option></c:forEach> </select></td>'+
            '<td><span class="btn btn-danger minus pull-right">&ndash;</span></td>' +
            '</tr>'
        );
    });
    // on - так как элемент динамически создан и обычный обработчик с ним не работает
    jQuery(document).on('click', '.minus', function(){
        jQuery( this ).closest( 'tr' ).remove(); // удаление строки с полями
    });// JavaScript Document
</script>
</body>
</html>
