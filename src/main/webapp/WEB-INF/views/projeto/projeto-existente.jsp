<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Projeto</title>
	
	<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
</head>
<body>
	<div class="container" style="margin-top: 1%;">
		<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-external-link"></span> Projeto Existente</h1>
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
	
		<ol class="breadcrumb" style="margin-top: 2%;">
	  		<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li class="active">Projeto Existente</li>
	  		<li></li>	
		</ol>
					
		<c:if test="${status == 'removeProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<c:if test="${status == 'erro_removeProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<div class="row" style="margin-top: 3%;">
			<div class="col-md-12">
				<c:if test="${not empty projetos}">
				<table class="table table-bordered">
 					<thead>
 						<tr>
 							<th class="text-center">Nº Projeto</th>
 							<th>Nome</th>
 							<th class="text-center">Criação</th>
 							<th class="text-center">Status</th>
 							<th class="text-center"><i class="fa fa-cogs" aria-hidden="true"></i></th>
 						</tr>
 					</thead>
 					<tbody>
 						<c:forEach var="projeto" items="${projetos}">
 						<tr>
 							<td class="text-center text-info" width="9%">${projeto.numeroProjeto}</td>
 							<td>${projeto.nomeProjeto}</td>
 							<td class="text-center text-muted" width="9%"> <fmt:formatDate type="date" dateStyle="medium" value="${projeto.dataCriacao}" /> </td>
 							<c:if test="${projeto.finalizado eq true}">
 								<td width="10%" class="text-center">
 									<h4><span class="label label-success">Finalizado</span></h4>
 								</td>
 							</c:if>
 							<c:if test="${projeto.finalizado eq false}">
 								<td width="10%" class="text-center">
 								<h4><span class="label label-danger">Não finalizado</span></h4>
 								</td>
 							</c:if>
 							<td class="text-center" width="10%">
 							<c:if test="${projeto.finalizado eq false}">
 								<a href="acessoProjetoExistente?numeroProjeto=${projeto.numeroProjeto}" class="btn btn-default btn-sm" title="Acessar"><span class="glyphicon glyphicon-check text-info"></span></a>
 								<button class="btn btn-default btn-sm" type="button" title="Remover" data-toggle="modal" data-target="#remover_${projeto.numeroProjeto}">
	 								<span class="glyphicon glyphicon-remove text-danger"></span>
	 							</button>								
 							</c:if>
 							</td>
 						</tr>
 						
 						<div class="modal fade" id="remover_${projeto.numeroProjeto}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			            	<div class="modal-dialog" role="document">
			                	<div class="modal-content">
			                    	<div class="modal-header text-center">
			                       		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                        	<h4 class="modal-title text-muted" id="myModalLabel">
			                        		<i class="fa fa-trash" aria-hidden="true"></i> Remover Projeto: ${projeto.numeroProjeto}
			                        	</h4>
			                    	</div>
			                    	<div class="modal-body text-center">
										<h4 class="modal-title" id="myModalLabel"><strong>Tem certeza que deseja remover este Projeto?</strong></h4>
									</div>
									<div class="modal-footer">
										<a href="removerProjetoExistente?numeroProjeto=${projeto.numeroProjeto}&&siape=${usuarioLogado.siape}" class="btn btn-primary" title="Remover">
											<span class="glyphicon glyphicon-ok"></span> Confirmar
										</a>
                    					<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Cancelar</button>
                   					</div>
			                    </div>
                        	</div>
                    	</div>	
 						
 						</c:forEach>
 					</tbody>
				</table>
				</c:if>
				<c:if test="${empty projetos}">
					<h3 class="text-muted text-center">Não há projetos cadastrados.</h3>
				</c:if>
			</div>
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
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>