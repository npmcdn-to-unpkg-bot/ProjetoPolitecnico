<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		
		<c:if test="${status == 'cadastroProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<c:if test="${status == 'modificaProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<c:if test="${status == 'erro_modificaProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<c:if test="${status == 'erro_removeProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<ol class="breadcrumb">
	  		<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li class="active">Solicitar Demandas no Projeto</li>
	  		<li></li>	
		</ol>
		
		<div class="row" style="margin-top: 2%;">	
			<div class="col-md-7">
				<div class="form-group">
					<label for="proponente">Proponente</label>
					<input type="text" class="form-control" name="proponente" value="${projeto.proponente}" disabled>
				</div>
				  
				<div class="form-group">
					<label for="titulo">Título do Projeto</label>
					<input type="text" class="form-control" name="nomeProjeto" value="${projeto.nomeProjeto}" disabled>
				</div>
				  
				<div class="form-group">
					<label for="numero">Numero do Projeto</label>
					<input type="text" class="form-control" name="numeroProjeto" value="${projeto.numeroProjeto}" disabled>
				</div>
					
				<a class="btn btn-default" href="redirecionaModificar?numeroProjeto=${projeto.numeroProjeto}" style="margin-top: 2%; margin-right: 1%; margin-bottom: 1%;"> 
					<span class="glyphicon glyphicon-wrench text-success"></span> <span class="text-success">Alterar Projeto</span></strong>
				</a>			
				<a class="btn btn-default" href="removerProjeto" style="margin-top: 2%; margin-bottom: 1%;"> 
					<span class="glyphicon glyphicon-remove text-danger"></span> <span class="text-danger">Remover Projeto</span>
				</a>	  
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
			<li role="presentation"><a href="materialConsumo?numeroProjeto=${projeto.numeroProjeto}">Materia de Consumo</a></li>
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
	 							<th class="text-center"><i class="fa fa-cogs" aria-hidden="true"></i></th>
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
	 							<td class="text-center" width="25%"><strong>R$</strong> ${demanda.valorTotal}</td>
	 							<th class="text-center" width="13%"></th>
	 						</tr>
	 						<c:set var="soma" value="${soma + demanda.valorTotal}"/>
	 						</c:forEach>
	 					</tbody>
	 					<tfooter>
	 						<tr>
	 							<td class="text-center"><strong>...</strong></td>
	 							<td class="text-center"><strong>...</strong></td>
	 							<td class="text-center"><strong>Total R$</strong> ${soma}</td>
	 							<td class="text-center"><strong>...</strong></td>
	
	 						</tr>
	 					</tfooter>
	 				</table>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<hr style="margin-top: 3%">		
		<button class="btn btn-primary" type="submit"> <span class="glyphicon glyphicon-ok"></span> Finalizar</button>
		<hr style="margin-top: 2%">
	</div>
	
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
  </body>
</html>