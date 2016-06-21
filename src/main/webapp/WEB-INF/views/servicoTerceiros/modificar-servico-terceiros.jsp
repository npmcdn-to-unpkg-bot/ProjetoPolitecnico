<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br" ng-app="form">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Servi�o de Terceiros</title>

	<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	
	<script src="<c:url value='/resources/angular/angular.js'/>"></script>
	<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
	<script src="<c:url value='/resources/js/app.js'/>"></script>
	<script src="<c:url value='/resources/js/controllers/formCtrl.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
  </head>
  <body ng-controller="formCtrl">
	
	<div class="container" id="conteudo" style="margin-top: 1%;">
		<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-users"></span> Servi�o de Terceiros</h1>
    		</div>
    		<div class="col-md-2">
    			<h4 class="text-muted pull-right">
    				<ul class="nav nav-pillis">
    					<li role="presentation" class="dropdown">
    					 	<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" id="menu"  aria-haspopup="true" aria-expanded="false">
    							<span class="glyphicon glyphicon-user"></span> ${projeto.proponente} <span class="caret"></span>
    						</a> 
    					
    						<ul class="dropdown-menu">
    							<li> <a href="logout"> <span class="glyphicon glyphicon-log-out"></span> Sair</a> </li>
    						</ul>
    					</li>
    				</ul>
    			</h4>
    		</div>
    	</div>
		
		<ul class="nav nav-tabs" style="margin-top: 3%;" id="menu">
			<li role="presentation"><a href="servicoTerceiros?numeroProjeto=${projeto.numeroProjeto}">Servi�o de Terceiros</a></li>
			<li role="presentation" class="active"><a href="#">Modificar Servi�o de Terceiros</a></li>
		</ul>
		
		<c:if test="${status == 'removeServico'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_removeServico'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'alterarServico'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_alterarServico'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<ol class="breadcrumb" style="margin-top: 2%;">
			<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li><a href="servicoTerceiros?numeroProjeto=${projeto.numeroProjeto}">Servi�o de Terceiros</a></li>
	  		<li class="active">Modificar Servi�o de Terceiros</li>
		</ol>
		
		<div class="row" style="margin-top:2%;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<c:if test="${not empty servicoTerceiros}">
				<table class="table table-bordered">
	 				<thead>
	 					<tr>
	 						<th>Descri��o</th>
	 						<th class="text-center">Valor Unit.</th>
	 						<th class="text-center">Quantid.</th>
	 						<th class="text-center">Valor Total</th>
	 						<th class="text-center">A��o</th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<c:forEach var="servico" items="${servicoTerceiros}">
	 						<tr>
	 							<td>${servico.descricao}</td>
	 							<td class="text-center text-muted" width="10%"><strong>R$</strong> ${servico.valorUnitario}</td>
	 							<td class="text-center text-muted" width="7%">${servico.quantidade}</td>
	 							<td class="text-center text-muted" width="15%"><strong>R$</strong> ${servico.quantidade * servico.valorUnitario}</td>
	 							<td class="text-center" width="14%">
	 								<a href="#" class="btn btn-default btn-sm" title="Visualizar"><span class="glyphicon glyphicon-eye-open text-info"></span></a>
	 								<a href="redirecionaAlterarServicoTerceiros?numeroProjeto=${projeto.numeroProjeto}&&valorTotal=${servico.quantidade * servico.valorUnitario}" class="btn btn-default btn-sm" title="Editar"><span class="glyphicon glyphicon-wrench text-success"></span></a>
	 								<a href="removerServicoTerceiros?numeroProjeto=${projeto.numeroProjeto}&&valorTotal=${servico.quantidade * servico.valorUnitario}" class="btn btn-default btn-sm" title="Remover" ><span class="glyphicon glyphicon-remove text-danger"></span></a>
	 							</td>
	 						</tr>
	 						<c:set var="soma" value="${soma + (servico.quantidade * servico.valorUnitario)}"/>
	 					</c:forEach>
	 				</tbody>
	 				<tfooter>
 						<tr>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>Total R$ ${soma}</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 						</tr>
 					</tfooter>
				</table>
				</c:if>
				<c:if test="${empty servicoTerceiros}">
					<h3 class="text-muted text-center">N�o h� Servi�os cadastrados.</h3>
				</c:if>
			</div>
			<div class="col-md-1"></div>
		</div>
		<hr style="margin-top: 3%;">
	</div>

	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
  </body>
</html>