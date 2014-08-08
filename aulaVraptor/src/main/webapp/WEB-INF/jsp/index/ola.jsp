<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página de teste</title>

<link href="<c:url value="/static/css/flexigrid.css"/>" rel="stylesheet" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script src="<c:url value="/static/js/flexigrid.js"/>"></script>

<script type="text/javascript">
$( document ).ready(function() {
	 $("#flex1").flexigrid({
		url: '/produtos',
		dataType: 'json',
		colModel : [
			{display: 'ISO', name : 'iso', width : 40, sortable : true, align: 'center'},
			{display: 'Name', name : 'name', width : 180, sortable : true, align: 'left'},
			{display: 'Printable Name', name : 'printable_name', width : 120, sortable : true, align: 'left'},
			{display: 'ISO3', name : 'iso3', width : 130, sortable : true, align: 'left', hide: true},
			{display: 'Number Code', name : 'numcode', width : 80, sortable : true, align: 'right'}
			],
		searchitems : [
			{display: 'ISO', name : 'iso'},
			{display: 'Name', name : 'name', isdefault: true}
			],
		sortname: "iso",
		sortorder: "asc",
		usepager: true,
		title: 'Countries',
		useRp: true,
		rp: 15,
		showTableToggleBtn: true,
		width: 700,
		onSubmit: addFormData,
		height: 200
	});
	
	//This function adds paramaters to the post of flexigrid. You can add a verification as well by return to false if you don't want flexigrid to submit			
	function addFormData(){
		//passing a form object to serializeArray will get the valid data from all the objects, but, if the you pass a non-form object, you have to specify the input elements that the data will come from
		var dt = $('#sform').serializeArray();
		$("#flex1").flexOptions({params: dt});
		return true;
	}
		
	$('#sform').submit(function (){
		$('#flex1').flexOptions({newp: 1}).flexReload();
		return false;
	});
});
</script>
</head>
<body>
	Olá Pós em Java UTFPR - Roberto Rosin
	<br/>
	${teste}
	
	<form action="valorView">
		<input name="cliente.codigo" id="codigo" type="text"/>
		<input name="cliente.nome" id="nome" type="text"/>
		
		<input type="submit" value="Enviar Servidor"/>
	</form>
<table id="flex1" style="display:none"></table>
<script type="text/javascript">

</script>
</body>

</html>