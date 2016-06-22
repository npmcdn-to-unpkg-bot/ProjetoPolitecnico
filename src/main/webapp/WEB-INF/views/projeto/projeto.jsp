<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br" ng-app="form">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Projeto</title>
	
	<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	
	<script src="<c:url value='/resources/angular/angular.js'/>"></script>
	<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
	<script src="<c:url value='/resources/js/app.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
</head>
<body>
	<div class="container" style="margin-top: 1%;">
		<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-pencil-square-o"></span> Novo Projeto</h1>
    		</div>
    		<div class="col-md-2">
    			<h4 class="text-muted pull-right">
    				<ul class="nav nav-pillis">
    					<li role="presentation" class="dropdown">
    					 	<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" id="menu" aria-haspopup="true" aria-expanded="false">
    							<span class="glyphicon glyphicon-user"></span> ${usuarioLogado.nome} <span class="caret"></span>
    						</a> 
    					
    						<ul class="dropdown-menu">
    							<li> <a href="logout"> <span class="glyphicon glyphicon-log-out"></span> Sair</a> </li>
    						</ul>
    					</li>
    				</ul>
    			</h4>
    		</div>
    	</div>
    	<hr>

		<ol class="breadcrumb">
	  		<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li class="active">Cadastrar Projeto</li>
	  		<li></li>	
		</ol>
			
		<c:if test="${status == 'erro_cadastroProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<div class="row" style="margin-top: 2%;">	
			<div class="col-md-7">
				<form action="cadastrarProjeto" method="post">
					<div class="form-group">
						<label for="proponente">Proponente</label>
						<input type="hidden" name="proponente" value="${usuarioLogado.nome}">
						<input type="hidden" name="siape" value="${usuarioLogado.siape}">
						<input type="text" class="form-control" value="${usuarioLogado.nome}" disabled>
					</div>
				  
					<div class="form-group">
						<label for="titulo">Título do Projeto</label>
						<input type="text" class="form-control" name="nomeProjeto" placeholder="Titulo do Projeto" ng-model="projeto.nome" required/>
					</div>
				  
					<div class="form-group">
						<label for="numero">Numero do Projeto</label>
						<input type="text" class="form-control" name="numeroProjeto" maxlength="12" placeholder="Numero do Projeto" ng-model="projeto.numero" required ui-number/>
					</div>	
					
					<button class="btn btn-primary" type="submit" ng-disabled="!projeto.nome || !projeto.numero" style="margin-top: 3%; margin-bottom: 1%;">
						<span class="glyphicon glyphicon-ok"></span> Confirmar 
					</button>	  
				</form>
			</div>
			
			<div class="col-md-5">
				<div class="alert alert-info" role="alert">
					<strong>Caro ${usuarioLogado.nome} </strong><br><br>
					Para o cadastro de um novo projeto, informe nos campos abaixo o título e o número do seu projeto. <br><br>
					
					Lembramos que o sistema não permitirá o cadastro de um projeto com número já existente. 
					Caso tenha um projeto ainda não finalizado e queira solicitar novas demandas, volte a pagina inicial e escolha a opção <strong>projeto existente</strong>.  <br><br>

				</div>
			</div>
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