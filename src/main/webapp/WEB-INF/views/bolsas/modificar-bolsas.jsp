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
			<li role="presentation"><a href="bolsas?numeroProjeto=${projeto.numeroProjeto}">Bolsas</a></li>
			<li role="presentation" class="active"><a href="#">Modificar Bolsas</a></li>
		</ul>

		<ol class="breadcrumb" style="margin-top: 3%;">
			<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li><a href="bolsas?numeroProjeto=${projeto.numeroProjeto}">Bolsas</a></li>
	  		<li class="active">Modificar Bolsas</li>
		</ol>
				
		<c:if test="${status == 'removeBolsas'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_removeBolsas'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'alterarBolsas'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_alterarBolsas'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<div class="row" style="margin-top:3%;">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<c:if test="${not empty bolsas}">
				<table class="table table-bordered">
	 				<thead>
	 					<tr>
	 						<th class="text-center">#</th>
	 						<th>Periodo</th>
	 						<th class="text-center">Valor Unit.</th>
	 						<th class="text-center">Quantid.</th>
	 						<th class="text-center">Valor Total</th>
	 						<th class="text-center"><i class="fa fa-cogs" aria-hidden="true"></th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<c:forEach var="bolsa" items="${bolsas}">
	 						<tr>
	 							<td class="text-center text-muted" width="5%">${bolsa.id}</td>
	 							<td>${bolsa.periodo}</td>
	 							<td class="text-center text-muted" width="10%"><strong>R$</strong> ${bolsa.valorUnitario}</td>
	 							<td class="text-center text-muted" width="7%">${bolsa.quantidade}</td>
	 							<td class="text-center text-muted" width="15%"><strong>R$</strong> ${bolsa.quantidade * bolsa.valorUnitario}</td>
	 							<td class="text-center" width="14%">
	 								<button class="btn btn-default btn-sm" type="button" title="Visualizar" data-toggle="modal" data-target="#modal_${bolsa.id}">
	 									<span class="glyphicon glyphicon-eye-open text-info"></span>
	 								</button>
	 								<a href="redirecionaAlterarBolsas?numeroProjeto=${projeto.numeroProjeto}&&id=${bolsa.id}" class="btn btn-default btn-sm" title="Editar"><span class="glyphicon glyphicon-wrench text-success"></span></a>
	 								<a href="removerBolsas?numeroProjeto=${projeto.numeroProjeto}&&id=${bolsa.id}" class="btn btn-default btn-sm" title="Remover" ><span class="glyphicon glyphicon-remove text-danger"></span></a>
	 							</td>
	 						</tr>
	 						<c:set var="soma" value="${soma + (bolsa.quantidade * bolsa.valorUnitario)}"/>
	 						
	 						<div class="modal fade" id="modal_${bolsa.id}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			            		<div class="modal-dialog modal-lg" role="document">
			                		<div class="modal-content">
			                			<c:forEach var="b" items="${bolsas}">
			                				<c:if test="${bolsa.id == b.id}">
			                    		<div class="modal-header">
			                       			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        		<h3 class="modal-title text-center text-muted" id="myModalLabel"> <span class="fa fa-user-times"></span> <strong>${b.id} - Bolsa</strong> </h3>
			                    		</div>
			                    		<div class="modal-body">
											<div class="row">
												<div class="col-md-3"></div>
												<div class="col-md-6">
													<h4><strong><i class="fa fa-calendar" aria-hidden="true"></i> Periodo:</strong> <small>${b.periodo}</small></h4>
												</div>
												<div class="col-md-3"></div>
											</div>
											<hr>
											<div class="row" style="margin-top:3%">
												<div class="col-md-1"></div>
												<div class="col-md-4">
													<h4><strong><i class="fa fa-money" aria-hidden="true"></i> Valor Unit�rio R$</strong> ${b.valorUnitario}</h4>
												</div>
												<div class="col-md-3">
													<h4><strong><i class="fa fa-asterisk" aria-hidden="true"></i> Quantidade:</strong> ${b.quantidade}</h4>
												</div>
												<div class="col-md-4">
													<h4><strong><i class="fa fa-calculator" aria-hidden="true"></i> Valor Total R$</strong> ${b.valorTotal}</h4>
												</div>
											</div>
											<hr>
											<h4><strong><i class="fa fa-info-circle" aria-hidden="true"></i> Justificativa:</strong></h4> 
											<textarea class="form-control" rows="2" readonly>${b.justificativa}</textarea> 
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
 							<td class="text-center"><strong>Total R$ ${soma}</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 							<td class="text-center"><strong>...</strong></td>
 						</tr>
 					</tfooter>
				</table>
				</c:if>
				<c:if test="${empty bolsas}">
					<h3 class="text-muted text-center">N�o h� Bolsas cadastrados.</h3>
				</c:if>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<footer style="margin-top: 10%; margin-bottom: 2%;" class="footer text-center">
			<hr>
        	<h4>
        		<small class="text-info"> � 2016 Colegio Politecnico/UFSM. </small>
        		<small> Todos os direitos reservados. </small>
        	</h4>
        </footer>
	</div>

	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
  </body>
</html>