<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />

<!DOCTYPE html>
<html lang="pt-br" ng-app="form">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Serviço de Terceiros</title>

	<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	
	<script src="<c:url value='/resources/angular/angular.js'/>"></script>
	<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
	<script src="<c:url value='/resources/js/app.js'/>"></script>
	<script src="<c:url value='/resources/js/angular-locale_pt-br.js'/>"></script>
	<script src="<c:url value='/resources/js/controllers/formCtrl.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/ng-currency.js'/>"></script>
  </head>
  <body ng-controller="formCtrl" ng-cloak>
	
	<div class="container" id="conteudo" style="margin-top: 1%;">
	
		<!-- CABEÇALHO -->
		<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-users"></span> Serviço de Terceiros</h1>
    		</div>
    		<div class="col-md-2">
				<jsp:include page="../formularios/sair.jsp"></jsp:include>
    		</div>
    	</div>
		
		<!-- MENU -->
		<ul class="nav nav-tabs" style="margin-top: 2%;" id="menu">
			<li role="presentation"><a href="servicoTerceiros?numeroProjeto=${projeto.numeroProjeto}">Serviço de Terceiros</a></li>
			<li role="presentation"><a href="redirecionaModificarServicoTerceiros?numeroProjeto=${projeto.numeroProjeto}">Modificar Serviço de Terceiros</a></li>
			<li role="presentation" class="active"><a href="#">Alterar Serviço de Terceiros</a></li>			
		</ul>
		
		<!-- CAMINHOS -->
		<ol class="breadcrumb" style="margin-top: 3%;">
			<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li><a href="servicoTerceiros?numeroProjeto=${projeto.numeroProjeto}">Serviço de Terceiros</a></li>
	  		<li class="active">Alterar Serviço de Terceiros</li>
	  		<div class="pull-right active">
			  	<input type="checkbox" ng-model="item.ajuda"> Ajuda ?
	  		</div>
		</ol>
		
		<jsp:include page="../formularios/ajuda.jsp"></jsp:include>
		
		<!-- FORMULÁRIO -->
		<div class="row" style="margin-top:3%;">
			<c:forEach var="servico" items="${servicoTerceiros}">
			<form action="alterarServicoTerceiros?numeroProjeto=${projeto.numeroProjeto}&&id=${servico.id}" method="post">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<!-- DESCRIÇÃO -->
						<div class="col-md-8" ng-init="item.descricao='${servico.descricao}'">
							<jsp:include page="../formularios/descricao-trecho-destino.jsp"></jsp:include>
						</div>
						<!-- UNIDADE DE MEDIDA -->
						<div class="col-md-4" ng-init="unidadeMedida=unidadesMedida[procuraUnidade('${servico.unidadeMedida}')]">
							<jsp:include page="../formularios/unidadeMedida.jsp"></jsp:include>
						</div>
					</div>
					
					<!-- VALOR UNIÁRIO - QUANTIDADE - VALOR TOTAL -->	
					<hr>
					<div class="row">
						<div class="col-md-4" ng-init="item.valorUnit='${servico.valorUnitario}'">
							<jsp:include page="../formularios/valorUnitario.jsp"></jsp:include>
						</div>
						<div class="col-md-4" ng-init="item.quantidade='${servico.quantidade}'">
							<jsp:include page="../formularios/quantidade.jsp"></jsp:include>
						</div>
						<div class="col-md-4">
							<jsp:include page="../formularios/valorTotal.jsp"></jsp:include>
						</div>
					</div>
					
					<!-- PERIODO -->
					<hr ng-init="user.meses=[${servico.periodo}]">
					<jsp:include page="../formularios/periodo.jsp"></jsp:include>
					<hr>
			
					<button class="btn btn-primary" type="submit" 
						ng-disabled="user.meses.length <= 0 || item.valorUnit > 999999999 || item.quantidade == 0 || item.valorUnit <= 0">
						<span class="glyphicon glyphicon-ok"></span> Alterar
					</button>		
				</div>
				<div class="col-md-1"></div>
			</form>
			</c:forEach>
		</div>

		<!-- RODAPE -->
		<jsp:include page="../menu/rodape.jsp"></jsp:include>
	</div>

	<!-- EXEMPLO MODAL -->
	<div class="modal fade" id="exemplo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        	<h4 class="modal-title text-muted" id="myModalLabel"> 
			        		<span class="fa fa-users"></span> Exemplo de Serviço de Terceiros
			        	</h4>
				</div>
				<div class="modal-body text-center">
					<div class="row">
						<div class="col-md-8">
							<div class="form-group">
								<label for="proponente">Descrição</label>
								<input type="text" class="form-control text-center" value="Santa Maria - Porto Alegre" disabled>		
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="proponente">Unidade de Medida</label>
								<input type="text" class="form-control text-center" value="Terrestre" disabled>		
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="proponente">Valor Unitário R$</label>
								<input type="text" class="form-control text-center" value="R$ 150,00" disabled>		
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="proponente">Quantidade</label>
								<input type="text" class="form-control text-center" value="2" disabled>		
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="proponente">Valor Total R$</label>
								<input type="text" class="form-control text-center" value="R$ 300,00" disabled>		
							</div>
						</div>
					</div>
					<hr>					
					<div class="form-group">
						<label for="proponente">Periodo: </label> Jan, Fev, Mar 	
					</div>						
				</div>
				<div class="modal-footer">
                	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Fechar</button>
                </div>
			</div>
         </div>
    </div>	

	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
  </body>
</html>