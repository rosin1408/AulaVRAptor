<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<layout:template>
	<c:forEach var="error" items="${errors}">
	    ${error.category} - ${error.message}<br />
	</c:forEach>
	<form class="form-horizontal" action="${linkTo[CategoriaController].adicionar}" method="post">
		<fieldset>
			<!-- Form Name -->
			<legend>Cadastro de Categoria</legend>
			<!-- Text input-->
			<div class="form-group">
				<label class="col-xs-3 control-label" for="nome">Nome:</label>
				<div class="col-xs-6">
					<input id="nome" name="categoria.nome" placeholder=""
						class="form-control input-md" type="text">
				</div>
			</div>
			<!-- Button -->
			<div class="form-group">
				<label class="col-xs-3 control-label" for="save"></label>
				<div class="col-xs-8">
					<button id="save" name="save" class="btn btn-primary">Salvar</button>
				</div>
			</div>
		</fieldset>
	</form>
</layout:template>