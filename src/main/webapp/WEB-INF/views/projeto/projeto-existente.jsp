<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt-BR" />

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
    							<span class="glyphicon glyphicon-user"></span> ${usuarioLogado.nomeCompleto} <span class="caret"></span>
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
		
		<c:if test="${status == 'finalizado'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<c:if test="${status == 'erro_finalizado'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>

		<div class="alert alert-info" role="alert">
			Para projetos com status de  <span class="text-danger"><strong>N�o finalizado</strong></span>, voc� ter� duas op��es: <strong>acessar</strong> <span class="glyphicon glyphicon-check text-info"></span> 
			para solicitar novas demandas em um projeto criado anteriormente; ou <strong>remover</strong> o projeto <span class="glyphicon glyphicon-remove text-danger"></span>
			<br><br>
			J� projetos com status de <span class="text-success"><strong>Finalizado</strong></span>, voc� poder� fazer o <strong>download</strong> <span class="glyphicon glyphicon-download-alt text-success"></span>
			do arquivo do seu projeto para anexar nas est�ncias administrativas; lembramos que ap�s finalizado n�o poder� mais ser alterado. <br><br> Caso queira <strong>relatar algum problema</strong>, mudan�a ou cancelamento
			do projeto, voc� poder� solicitar enviando uma mensagem clicando em <span class="fa fa-commenting text-info"></span>.
		</div>
		
		<div class="row" style="margin-top: 3%;">
			<div class="col-md-12">
				<c:if test="${not empty projetos}">
				<table class="table table-bordered">
 					<thead>
 						<tr>
 							<th class="text-center">N� Projeto</th>
 							<th>Nome</th>
 							<th class="text-center">Cria��o</th>
 							<th class="text-center">Status</th>
 							<th class="text-center"><i class="fa fa-cogs" aria-hidden="true"></i></th>
 						</tr>
 					</thead>
 					<tbody>
 						<c:forEach var="projeto" items="${projetos}">
 						<tr>
 							<td class="text-center text-info" width="8%">${projeto.numeroProjeto}</td>
 							<td>${projeto.nomeProjeto}</td>
 							<td class="text-center text-muted" width="9%"> <fmt:formatDate type="date" dateStyle="medium" value="${projeto.dataCriacao}" /> </td>
 							<c:if test="${projeto.finalizado eq true}">
 								<td width="10%" class="text-center">
 									<h4><span class="label label-success">Finalizado</span></h4>
 								</td>
 							</c:if>
 							<c:if test="${projeto.finalizado eq false}">
 								<td width="10%" class="text-center">
 								<h4><span class="label label-danger">N�o finalizado</span></h4>
 								</td>
 							</c:if>
 							<td class="text-center" width="10%">
 							<c:if test="${projeto.finalizado eq false}">
 								<a href="acessoProjetoExistente?numeroProjeto=${projeto.numeroProjeto}" class="btn btn-default btn-md" title="Acessar"><span class="glyphicon glyphicon-check text-info"></span></a>
 								<button class="btn btn-default btn-md" type="button" title="Remover" data-toggle="modal" data-target="#remover_${projeto.numeroProjeto}">
	 								<span class="glyphicon glyphicon-remove text-danger"></span>
	 							</button>								
 							</c:if>
 							
 							<c:if test="${projeto.finalizado eq true}">
 								<a href="download?numeroProjeto=${projeto.numeroProjeto}&&modalidade=${projeto.modalidade}" class="btn btn-default btn-md" title="Download">
 									<span class="glyphicon glyphicon-download-alt text-success"></span>
 								</a>
 								
 								<a href="" class="btn btn-default btn-md" title="Relatar um problema">
 									<span class="fa fa-commenting text-info"></span>
 								</a>													
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
					<h3 class="text-muted text-center">N�o h� projetos cadastrados.</h3>
				</c:if>
			</div>
		</div>

		<footer style="margin-top: 10%; margin-bottom: 2%;" class="footer text-center">
			<hr>
        	<h4>
        		<small class="text-info"> � 2016 Col�gio Polit�cnico/UFSM. </small>
        		<small> Todos os direitos reservados. </small>
        	</h4>
        </footer>
	</div>
	
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.js'/>"></script>
</body>
</html>