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
    
    <title>Diárias</title>

	<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
  </head>
  <body ng-controller="formCtrl">
	
	<div class="container" id="conteudo" style="margin-top: 1%;">
		<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-suitcase"></span> Diárias</h1>
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
			<li role="presentation"><a href="diarias?numeroProjeto=${projeto.numeroProjeto}">Diárias</a></li>
			<li role="presentation" class="active"><a href="#">Modificar Diárias</a></li>
		</ul>

		<ol class="breadcrumb" style="margin-top: 3%;">
			<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li><a href="diarias?numeroProjeto=${projeto.numeroProjeto}">Diárias</a></li>
	  		<li class="active">Modificar Diárias</li>
		</ol>
				
		<c:if test="${status == 'removeDiarias'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_removeDiarias'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'alterarDiarias'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_alterarDiarias'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<div class="row" style="margin-top:3%;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<c:if test="${not empty diarias}">
				<table class="table table-bordered">
	 				<thead>
	 					<tr>
	 						<th class="text-center">#</th>
	 						<th>Trecho</th>
	 						<th class="text-center">Valor Diária</th>
	 						<th class="text-center">Nº Dias</th>
	 						<th class="text-center">Valor Total</th>
	 						<th class="text-center"><i class="fa fa-cogs" aria-hidden="true"></th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<c:forEach var="diaria" items="${diarias}">
	 						<tr>
	 							<td class="text-center text-info" width="6%">${diaria.id}</td>
	 							<td>${diaria.descricao}</td>
	 							<td class="text-center text-muted" width="13%"><fmt:formatNumber value="${diaria.valorUnitario}" type="currency"/></td>
	 							<td class="text-center text-muted" width="7%">${diaria.quantidade}</td>
	 							<td class="text-center text-muted" width="15%"><fmt:formatNumber value="${diaria.valorUnitario * diaria.quantidade}" type="currency"/></td>
	 							<td class="text-center" width="14%">
	 								<button class="btn btn-default btn-sm" type="button" title="Visualizar" data-toggle="modal" data-target="#modal_${diaria.id}">
	 									<span class="glyphicon glyphicon-eye-open text-info"></span>
	 								</button>
	 								<a href="redirecionaAlterarDiarias?numeroProjeto=${projeto.numeroProjeto}&&id=${diaria.id}" class="btn btn-default btn-sm" title="Editar"><span class="glyphicon glyphicon-wrench text-success"></span></a>
	 								<a href="removerDiarias?numeroProjeto=${projeto.numeroProjeto}&&id=${diaria.id}" class="btn btn-default btn-sm" title="Remover" ><span class="glyphicon glyphicon-remove text-danger"></span></a>
	 							</td>
	 						</tr>
	 						<c:set var="soma" value="${soma + (diaria.quantidade * diaria.valorUnitario)}"/>
	 						
	 						<div class="modal fade" id="modal_${diaria.id}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			            		<div class="modal-dialog modal-lg" role="document">
			                		<div class="modal-content">
			                			<c:forEach var="d" items="${diarias}">
			                				<c:if test="${material.id == materialConsumo.id}">
			                    		<div class="modal-header">
			                       			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        		<h3 class="modal-title text-center text-muted" id="myModalLabel"> <span class="fa fa-suitcase"></span></span> <strong>${d.id} - Diária</strong> </h3>
			                    		</div>
			                    		<div class="modal-body">
											<h4><strong><i class="fa fa-pencil" aria-hidden="true"></i> Destino:</strong> </h4>
											<textarea class="form-control" rows="2" readonly>${d.descricao}</textarea>
											<hr>
											<div class="row">
												<div class="col-md-3"></div>
												<div class="col-md-6">
													<h4><strong><i class="fa fa-calendar" aria-hidden="true"></i> Periodo:</strong> <small>${d.periodo}</small></h4>
												</div>
												<div class="col-md-3"></div>
											</div>
											<hr>
											<div class="row" style="margin-top:3%">
												<div class="col-md-1"></div>
												<div class="col-md-4">
													<h4><strong><i class="fa fa-money" aria-hidden="true"></i> Valor da Diária <fmt:formatNumber value="${d.valorUnitario}" type="currency"/></h4>
												</div>
												<div class="col-md-3">
													<h4><strong><i class="fa fa-asterisk" aria-hidden="true"></i> Nº de Dias:</strong> ${d.quantidade}</h4>
												</div>
												<div class="col-md-4">
													<h4><strong><i class="fa fa-calculator" aria-hidden="true"></i> Valor Total <fmt:formatNumber value="${d.valorUnitario * d.quantidade}" type="currency"/></h4>
												</div>
											</div>
			                    		</div>
                    					<div class="modal-footer">
                    						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                   						</div>
                        					</c:if>
                        				</c:forEach>
                        			</div>
                    			</div>
                			</div>	 						
	 					</c:forEach>
	 				</tbody>
	 				<tfooter>
 						<tr>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>Total <fmt:formatNumber value="${soma}" type="currency"/></strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 						</tr>
 					</tfooter>
				</table>
				</c:if>
				<c:if test="${empty diarias}">
					<h3 class="text-muted text-center">Não há Diárias cadastradas.</h3>
				</c:if>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<footer style="margin-top: 10%; margin-bottom: 2%;" class="footer text-center">
			<hr>
        	<h4>
        		<small class="text-info"> © 2016 Colégio Politécnico/UFSM. </small>
        		<small> Todos os direitos reservados. </small>
        	</h4>
        </footer>
	</div>

	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
  </body>
</html>