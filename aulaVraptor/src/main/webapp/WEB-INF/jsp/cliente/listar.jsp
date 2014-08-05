<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout"%>
<layout:template>
	<jsp:attribute name="scriptsEspecificos">
<script type="text/javascript">
	$("#nome-auto").autocomplete({
		source : '<c:url value="/clientes/busca.json"/>',
		minLength : 2,
		dataType : "json",
		select : function(event, ui) {
			$("#nome-auto").val(ui.item.nome);
			$("#codigo").val(ui.item.codigo);
			return false;
		}
	}).data("ui-autocomplete")._renderItem = function(ul, item) {
		return $("<li></li>").data("item.autocomplete", item).append(
				"<a>" + item.codigo + " - " + item.nome + "</a>").appendTo(ul);
	}
</script>
</jsp:attribute>
	<jsp:body>
	<div class="well">
		<form class="form-inline"
				action="<c:url value="/clientes/pesquisar"/>">
			<div class="form-group">
				<label for="codigo">Código</label>
				<input name="codigo" id="codigo" value="${codigo}" />
			</div>
  			<div class="form-group">
				<label for="nome">Nome</label>
				<input name="nome" id="nome" value="${nome}" autocomplete="off" />
			</div>
  			<div class="form-group">
				<button type="submit" class="btn btn-primary">
				<span class="glyphicon glyphicon-search"></span> Pesquisar</button>
			</div>
		</form>
	</div>

	<div class="row">
		<div class="col-xs-12">
			<p>Exemplo auto complete</p>
			<label for="nome">Nome</label>
			<input name="nome-auto" id="nome-auto" autocomplete="off" />
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<a href="${linkTo[ClienteController].form}" class="btn btn-success">
			<span class="glyphicon glyphicon-plus"></span> Novo</a>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Código</th>
						<th>Nome</th>
						<th>Opções</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${clienteList}" var="cliente">
						<tr>
							<td>${cliente.codigo}</td>
							<td>${cliente.nome}</td>
							<td width="20%">
								<form action="${linkTo[ClienteController].remover(cliente)}"
										method="post">
									<a href="${linkTo[ClienteController].visualizar(cliente)}" class="btn btn-link">
										<span class="glyphicon glyphicon-pencil"></span>
									</a>
									<button type="submit" name="_method" value="DELETE" class="btn btn-link">
										<span class="glyphicon glyphicon-trash"></span>
									</button>
									
								</form>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</jsp:body>
</layout:template>