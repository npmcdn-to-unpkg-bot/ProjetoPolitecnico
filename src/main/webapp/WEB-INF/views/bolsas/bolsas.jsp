<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br" ng-app="form">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Bolsas</title>

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
    			<h1 class="text-muted"> <span class="fa fa-user-times"></span> Bolsas</h1>
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
		
		<ul class="nav nav-tabs" style="margin-top: 2%;" id="menu">
			<li role="presentation" class="active"><a href="#">Bolsas</a></li>
			<li role="presentation"><a href="redirecionaModificarBolsas?numeroProjeto=${projeto.numeroProjeto}">Modificar Bolsas</a></li>
		</ul>
		
		<ol class="breadcrumb" style="margin-top: 3%;">
			<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li class="active">Bolsas</li>
		</ol>
			
		<c:if test="${status == 'cadastroBolsas'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_cadastroBolsas'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>

		<div class="row" style="margin-top:3%;">
			<form action="cadastrarBolsas?numeroProjeto=${projeto.numeroProjeto}" method="post">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="precoUnit">Valor Unitário <strong>R$</strong></label>
								<input type="text" class="form-control" name="valorUnitario" placeholder="Valor Unitário" value="0" ng-model="item.valorUnit" ui-number>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="quantidade">Quantidade</label>
								<input type="text" class="form-control" maxlength="10" name="quantidade" placeholder="Quantidade" ng-model="item.quantidade" ui-number>
							</div>
						</div>
						<div class="col-md-4">
							<div ng-if="item.quantidade && item.valorUnit">
								<div class="form-group">
									<label for="total">Valor Total <strong>R$</strong></label>
									<input type="text" class="form-control" name="total" placeholder="Valor Total" value="{{item.quantidade * item.valorUnit}}" disabled>
								</div>
							</div>
						</div>
					</div>
					<hr>
					
					<div class="row">
						<div class="col-md-9">
							<label for="periodo">Periodo</label><br>
							<label class="checkbox-inline" ng-repeat="mes in meses">
			  					<input type="checkbox" name="periodo" checklist-model="user.meses" checklist-value="mes" value="{{mes}}"> {{mes}}
							</label>
						</div>
						<div class="col-md-1">
							<br><button class="btn btn-default" type="button" ng-click="todos()">Todos</button>
						</div>
						<div class="col-md-2">
							<br><button class="btn btn-default" type="button" ng-click="limpar()">Limpar</button>
						</div>
					</div>
					<hr>
			
					<div class="form-group">
						<label for="total">Justificativa</label>
						<textarea class="form-control" name="justificativa" rows="3" ng-model="item.justificativa"></textarea>
					</div>
			
					<button class="btn btn-primary" type="submit" 
						ng-disabled="!item.valorUnit || !item.quantidade || !item.justificativa">
						<span class="glyphicon glyphicon-ok"></span> Cadastrar
					</button>		
				</div>
				<div class="col-md-1"></div>
			</form>
		</div>
		<footer style="margin-top: 10%; margin-bottom: 2%;" class="footer text-center">
			<hr>
        	<h4>
        		<small class="text-info"> © 2016 Colegio Politecnico/UFSM. </small>
        		<small> Todos os direitos reservados. </small>
        	</h4>
        </footer>
	</div>

	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
  </body>
</html>