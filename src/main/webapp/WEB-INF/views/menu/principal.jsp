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
	  		<li class="active">Solicitar Demandas no Projeto</li>
	  		<li></li>	
		</ol>
				
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
				
				<div class="row">
					<div class="col-md-5">
						<div class="form-group">
							<label for="numero">Numero do Projeto</label>
							<input type="text" class="form-control" name="numeroProjeto" value="${projeto.numeroProjeto}" disabled>
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label for="modalidade">Modalidade</label>
							<input type="text" class="form-control" name="modalidade" value="${projeto.modalidade}" disabled>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label for="modalidade">Justificativa</label>
							<button class="btn btn-default"  data-toggle="modal" href="#justificativa" style="margin-left: 20%;"> 
								<span class="glyphicon glyphicon-eye-open text-info"></span>
							</button>
						</div>
					</div>
				</div>
					
				<a class="btn btn-default" data-toggle="modal" href="#modificar" style="margin-top: 2%; margin-right: 1%; margin-bottom: 1%;"> 
					<span class="glyphicon glyphicon-wrench text-success"></span> <span class="text-success">Modificar Projeto</span>
				</a>
				<a class="btn btn-default" title="Remover" data-toggle="modal" style="margin-top: 2%; margin-right: 1%; margin-bottom: 1%;" href="#remover">
	 				<span class="glyphicon glyphicon-remove text-danger"></span> <span class="text-danger">Remover Projeto</span>
	 			</a>
				
 				<div class="modal fade" id="remover" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
								<a href="removerProjeto" class="btn btn-primary" title="Remover">
									<span class="glyphicon glyphicon-ok"></span> Confirmar
								</a>
                    			<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Cancelar</button>
                   			</div>
			        	</div>
                	</div>
                </div>
                
                <div class="modal fade" id="justificativa" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			    	<div class="modal-dialog" role="document">
			        	<div class="modal-content">
			            	<div class="modal-header text-center">
			                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                     <h4 class="modal-title text-muted" id="myModalLabel">
			                     	<i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> Caracterização ou Justificativa
			                     </h4>
			                </div>
			                <div class="modal-body text-center">
								<h4 class="modal-title" id="myModalLabel">
									<textarea class="form-control" rows="18">${projeto.justificativa}</textarea disabled>
								</h4>
							</div>
							<div class="modal-footer">
                    			<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Fechar</button>
                   			</div>
			        	</div>
                	</div>
                </div>
                
                <div class="modal fade" id="modificar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			    	<div class="modal-dialog" role="document">
			        	<div class="modal-content">
			            	<div class="modal-header text-center">
			                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			                     <h4 class="modal-title text-muted" id="myModalLabel">
			                     	<i class="glyphicon glyphicon-wrench" aria-hidden="true"></i> Modificar Projeto
			                     </h4>
			                </div>
			                <div class="modal-body text-center">
			                	<form action="modificarProjeto" method="post">
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label for="numero">Numero do Projeto</label>
												<input type="text" class="form-control" value="${projeto.numeroProjeto}" disabled>
												<input type="hidden" class="form-control" name="numeroProjeto" value="${projeto.numeroProjeto}">		
											</div>
										</div>
										<div class="col-md-7">
											<div class="form-group">
												<label for="modalidade">Modalidade</label>								
												<select class="form-control" ng-model="projeto.modalidade" name="modalidade">
													<option value="${projeto.modalidade}"> ${projeto.modalidade} </option>
													<c:if test="${'Ensino' != projeto.modalidade}">
														<option value="Ensino"> Ensino </option>
													</c:if>
													<c:if test="${'Pesquisa' != projeto.modalidade}">
														<option value="Pesquisa"> Pesquisa </option>
													</c:if>
													<c:if test="${'Extensão' != projeto.modalidade}">
														<option value="Extensão"> Extensão </option>
													</c:if>
												</select>
											</div>
										</div>							
									</div>
									<hr>
									<div class="form-group">
										<label for="titulo">Título do Projeto</label>
										<input type="text" class="form-control" id="nomeProjeto" name="nome" value="${projeto.nomeProjeto}" required/>
									</div>
									<hr>
									<div class="form-group">
										<label for="justificativa">Caracterização ou Justificativa</label>
										<textarea class="form-control" rows="10" name="justificativa" required>${projeto.justificativa}</textarea>
									</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" title="Alterar">
									<span class="glyphicon glyphicon-ok"></span> Alterar
								</button>
                    			<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Fechar</button>
                   			</div>
			        	</div>
                	</div>
               </div>				
					  
			</div>
			<div class="col-md-5">
				<div class="alert alert-info" role="alert">
					Neste janela você terá os totais de cada ítem de custo do projeto proposto e poderá modificar o nome ou remover seu projeto. Não será possível 
					alterar o número do seu projeto, caso tenha informado errado, remova o projeto e cadastre novamente.
					 <br><br>
					
					Todo sistema esta programado para efetuar a totalização dos itens lançados. Para lançar um novo ítem você deve selecionar, nas abas abaixo,
					a modalidade de custo no qual ele se enquadra, preenchendo todos os campos solitados. Após todas as demandas do projeto cadastradas, clique em 
					<strong>finalizar</strong> para gerar o seu projeto em arquivo .xlsx (Microsoft Excel, LibreOffice Calc). Para baixar seu projeto finalizado em
					formato .xslx, basta acessar a opção <strong>Projeto existente</strong> e clicar no ícone de download. <br><br>
					
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
	 						<c:forEach var="bolsa" items="${bolsas}">
	 							<c:set var="somaBolsas" value="${somaBolsas + ((bolsa.valorUnitario * bolsa.meses) * bolsa.quantidade)}"/>
	 						</c:forEach>
	 						<tr>
	 							<td class="text-center" width="6%"><strong>6</strong></td>
	 							<c:if test="${bolsas.size() > 0}">
									<td class="text-info">
	 									Bolsas 
	 									<span class="badge">${bolsas.size()}</span> 
	 								</td>
	 							</c:if>
	 							<c:if test="${bolsas.size() <= 0}">
									<td> Bolsas </td>
	 							</c:if>
	 							<c:if test="${bolsas.size() > 0}"> 
	 								<td class="text-center text-muted" width="30%"><fmt:formatNumber value="${somaBolsas}" type="currency"/></td> 
	 							</c:if>
	 							<c:if test="${bolsas.size() <= 0}"> <td class="text-center text-muted" width="30%">R$ 0,00</td> </c:if>
	 						</tr>
	 					</tbody>
	 					<tfooter>
	 						<tr>
	 							<td class="text-center"><strong>...</strong></td>
	 							<td class="text-center"><strong>...</strong></td>
	 							<td class="text-center"><strong>Total <fmt:formatNumber value="${soma + somaBolsas}" type="currency"/></strong></td>
	 						</tr>
	 					</tfooter>
	 				</table>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		
		<hr style="margin-top: 3%">
		<c:if test="${soma <= 0}">
			<a class="btn btn-primary" title="Finalizar" data-toggle="modal" href="#finalizar" disabled>
	 			<span class="glyphicon glyphicon-ok"></span> Finalizar
	 		</a>
		</c:if>
		<c:if test="${soma > 0}">
			<a class="btn btn-primary" title="Finalizar" data-toggle="modal" href="#finalizar">
	 			<span class="glyphicon glyphicon-ok"></span> Finalizar
	 		</a>
		</c:if>		
		
		
		<div class="modal fade" id="finalizar" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
			    	<div class="modal-header text-center">
			        	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			            <h4 class="modal-title text-muted" id="myModalLabel">
			            	<span class="fa fa-calendar-check-o"></span> Finalizar Projeto: ${projeto.numeroProjeto}
			            </h4>
			        </div>
			        <div class="modal-body text-center">
						<h4 class="modal-title" id="myModalLabel">
							<strong> Tem certeza que deseja finalizar este Projeto? </strong>  </br></br>
							Lembre-se que ao finalizar, não será mais possível solicitar novas demandas.						
						</h4>
					</div>
					<div class="modal-footer">
						<a href="finalizar?numeroProjeto=${projeto.numeroProjeto}&&siape=${usuarioLogado.siape}" class="btn btn-primary" title="Remover">
							<span class="glyphicon glyphicon-ok"></span> Confirmar
						</a>
                    	<button type="button" class="btn btn-default" data-dismiss="modal"> <span class="fa fa-close"></span> Cancelar</button>
                   	</div>
			   </div>
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