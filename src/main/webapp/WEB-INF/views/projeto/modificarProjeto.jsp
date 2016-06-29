<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Principal</title>

    <link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	
	<script src="<c:url value='/resources/angular/angular.js'/>"></script>
	<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
	<script src="<c:url value='/resources/js/app.js'/>"></script>
	<script src="<c:url value='/resources/js/controllers/formCtrl.js'/>"></script>
  </head>
  <body>
    <div class="container" style="margin-top: 1%;">
    	<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-calendar-check-o"></span> Solicitar Demandas no Projeto</h1>
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
    	<hr>

		<ol class="breadcrumb">
	  		<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li class="active">Alterar Projeto</li>
	  		<li></li>	
		</ol>
				
		<c:if test="${status == 'cadastroProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<div class="row" style="margin-top: 2%;">	
			<div class="col-md-7">
				<form action="modificarProjeto" method="post">
					<div class="form-group">
						<label for="proponente">Proponente</label>
						<input type="text" class="form-control" value="${projeto.proponente}" disabled>
						<input type="hidden" class="form-control" name="proponente" value="${projeto.proponente}">
					</div>
					  
					<div class="form-group">
						<label for="titulo">Título do Projeto</label>
						<input type="text" class="form-control" id="nomeProjeto" name="nome" value="${projeto.nomeProjeto}" required/>
					</div>
					  
					<div class="form-group">
						<label for="numero">Numero do Projeto</label>
						<input type="text" class="form-control" value="${projeto.numeroProjeto}" disabled>
						<input type="hidden" class="form-control" name="numeroProjeto" value="${projeto.numeroProjeto}">
						
					</div>
					
					<button class="btn btn-default" type="submit" style="margin-top: 2%; margin-right: 1%; margin-bottom: 1%;"> 
						<span class="glyphicon glyphicon-ok text-success"></span> <span class="text-success">Confirmar</span></strong>
					</button>				
					<a class="btn btn-default" href="cadastro" style="margin-top: 2%; margin-bottom: 1%;"> 
						<span class="glyphicon glyphicon-remove text-danger"></span> <span class="text-danger">Cancelar</span>
					</a>	
				</form>

			</div>
			<div class="col-md-5">
				<div class="alert alert-info" role="alert">
					Neste janela você terá os totais de cada ítem de custo do projeto proposto e poderá modificar o nome ou remover seu projeto. Não será possível 
					alterar o número do seu projeto, caso tenha informado errado, remova o projeto e cadastre novamente.
					 <br><br>
					
					Todo sistema esta programado para efetuar a totalização dos itens lançados. Para lançar um novo ítem você deve selecionar, nas abas abaixo,
					a modalidade de custo no qual ele se enquadra, preenchendo todos os campos solitados. Após todas as demandas do projeto cadastradas, clique em 
					<strong>finalizar</strong> para eviar seu projeto á avaliação.<br><br>
					
					Lembramos que a descrição dos itens e valores são de inteira responsabilidade do proponente do projeto.
				</div>
			</div>
		</div>
		
		<ul class="nav nav-tabs" style="margin-top: 2%;" id="menu">
			<li role="presentation" class="active"><a href="#">Orçamentos</a></li>
			<li role="presentation"><a href="materialConsumo?numeroProjeto=${projeto.numeroProjeto}">Material de Consumo</a></li>
			<li role="presentation"><a href="servicoTerceiros?numeroProjeto=${projeto.numeroProjeto}">Serviços de Terceiros</a></li>
			<li role="presentation"><a href="passagens?numeroProjeto=${projeto.numeroProjeto}">Passagens</a></li>
			<li role="presentation"><a href="diarias?numeroProjeto=${projeto.numeroProjeto}">Diárias</a></li>
			<li role="presentation"><a href="materialPermanente?numeroProjeto=${projeto.numeroProjeto}">Material Permanente</a></li>
			<li role="presentation"><a href="bolsas?numeroProjeto=${projeto.numeroProjeto}">Bolsas</a></li>
		</ul>
		
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div id="conteudo" style="margin-top: 3%">
					<h1 class="text-muted"> <span class="fa fa-calculator"></span> Orçamento Total</h1>
					<hr>
					
<table class="table table-bordered">
	 					<thead>
	 						<tr>
	 							<th class="text-center">#</th>
	 							<th>Ítem</th>
	 							<th class="text-center">Valor do Ítem</th>
	 						</tr>
	 					</thead>
	 					<tbody>
	 						<c:forEach var="demanda" items="${demandas}">
	 						<tr>
	 							<td class="text-center" width="6%"><strong>${demanda.codigoDemanda}</strong></td>
	 							<c:if test="${demanda.quantidade > 0}">
									<td class="text-info">
	 									${demanda.demanda} 
	 									<span class="badge">${demanda.quantidade}</span> 
	 								</td>
	 							</c:if>
	 							<c:if test="${demanda.quantidade <= 0}">
									<td> ${demanda.demanda} </td>
	 							</c:if>
	 							<td class="text-center text-muted" width="30%"><fmt:formatNumber value="${demanda.valorTotal}" type="currency"/></td>
	 						</tr>
	 						<c:set var="soma" value="${soma + demanda.valorTotal}"/>						
	 						</c:forEach>
	 					</tbody>
	 					<tfooter>
	 						<tr>
	 							<td class="text-center"><strong>...</strong></td>
	 							<td class="text-center"><strong>...</strong></td>
	 							<td class="text-center"><strong>Total <fmt:formatNumber value="${soma}" type="currency"/></strong></td>
	 						</tr>
	 					</tfooter>
	 				</table>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<hr style="margin-top: 3%">		
		<button class="btn btn-primary" type="submit" disabled> <span class="glyphicon glyphicon-ok"></span> Finalizar</button>
		
		<footer style="margin-top: 10%; margin-bottom: 2%;" class="footer text-center">
			<hr>
        	<h4>
        		<small class="text-info"> © 2016 Colégio Politécnico/UFSM. </small>
        		<small> Todos os direitos reservados. </small>
        	</h4>
        </footer>
	</div>
	
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
  </body>
</html>