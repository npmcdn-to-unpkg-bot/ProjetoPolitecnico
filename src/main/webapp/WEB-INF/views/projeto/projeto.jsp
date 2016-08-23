<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br" ng-app="form" ng-cloak>
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
	<script src="<c:url value='/resources/js/directives/ng-currency.js'/>"></script>
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

		<ol class="breadcrumb" style="margin-top: 2%;">
	  		<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li class="active">Novo Projeto</li>
	  		<li></li>
	  		<div class="pull-right active">
			  	<input type="checkbox" ng-model="item.ajuda"> Ajuda ?
	  		</div>	
		</ol>
			
		<c:if test="${status == 'erro_cadastroProjeto'}">
			<c:import url="../mensagens/mensagem.jsp" />
		</c:if>
		
		<div class="alert alert-warning" ng-if="item.ajuda" role="alert">
			<span class="fa fa-info-circle"></span>
			Nesta versão de ajuda vôce terá o detalhamento das informações esperadas em cada campo e também um exemplo de preenchimento deste formulário.

			<a class="pull-right" data-toggle="modal" href="#exemplo"> 
				<span class="glyphicon glyphicon-eye-open text-info"></span> <span class="text-info">Exemplo</span>
			</a>			
		</div>
		
		<form action="cadastrarProjeto" method="post" autocomplete="off">
			<div class="row" style="margin-top: 3%;">	
				<div class="col-md-7">
					<div class="form-group">
						<label for="proponente">
							<span ng-if="item.ajuda" class="text-success fa fa-check-circle"></span> Proponente
						</label>
						<input type="hidden" name="proponente" value="${usuarioLogado.nome}">
						<input type="hidden" name="siape" value="${usuarioLogado.siape}">
						<input type="text" class="form-control" value="${usuarioLogado.nome}" disabled>
					</div>
				  	
				  	
					<div class="form-group">
						<label for="titulo">
							<span ng-if="item.ajuda && !projeto.nome" class="text-danger fa fa-close"></span>
							<span ng-if="item.ajuda && projeto.nome" class="text-success fa fa-check-circle"></span>
							Título do Projeto
						</label>
						<input type="text" class="form-control" minlength="5" name="nomeProjeto" placeholder="Titulo do Projeto" ng-model="projeto.nome" required/>
						<div ng-if="item.ajuda && !projeto.nome" style="margin-left: 2%;">
							<div class="text-danger">
								<small>*campo obrigatório, mínimo de 5 caracteres.</small>
							</div>
				  		</div>
					</div>
				  
				  	<div class="row">
				  		<div class="col-md-6">
							<div class="form-group">
								<label for="numero">
									<span ng-if="item.ajuda && !projeto.numero" class="text-danger fa fa-close"></span>
									<span ng-if="item.ajuda && projeto.numero.length < 6" class="text-danger fa fa-close"></span>
									<span ng-if="item.ajuda && projeto.numero.length == 6" class="text-success fa fa-check-circle"></span>
									Numero do Projeto
								</label>
								<input type="text" class="form-control" name="numeroProjeto" minlength="6" maxlength="6" placeholder="Numero do Projeto" ng-model="projeto.numero" required ui-number/>
								<div ng-if="item.ajuda" style="margin-left: 3%;">
									<div ng-if="!projeto.numero">
										<div class="text-danger">
											<small>*campo obrigatório, 6 caracteres</small>
										</div>
									</div>
									<div ng-if="projeto.numero.length < 6">
										<div class="text-danger">
											<small>*campo obrigatório, {{projeto.numero.length}} de 6 digitos.</small>
										</div>
									</div>
				  				</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="modalidade">
									<span ng-if="item.ajuda && !projeto.modalidade" class="text-danger fa fa-close"></span>
									<span ng-if="item.ajuda && projeto.modalidade" class="text-success fa fa-check-circle"></span>
									Modalidade
								</label>								
								<select class="form-control" ng-model="projeto.modalidade" name="modalidade" required>
									<option value=""> --- Selecione uma Modalidade --- </option>
									<option value="Ensino"> Ensino </option>
									<option value="Pesquisa"> Pesquisa </option>
									<option value="Extensao"> Extensão </option>
								</select>
								<div ng-if="item.ajuda && !projeto.modalidade" style="margin-left: 3%;">
									<div class="text-danger">
										<small>*campo obrigatório.</small>
									</div>
				  				</div>
							</div>
						</div>
					</div>
				</div>
			
				<div class="col-md-5">
					<div class="alert alert-info" role="alert">
						<strong>Caro ${usuarioLogado.nome} </strong><br><br>
						Para o cadastro de um novo projeto, informe nos campos abaixo o título e o número do seu projeto. <br><br>
						
						Lembramos que o sistema não permitirá o cadastro de um projeto com número já existente. 
						Caso tenha um projeto ainda não finalizado e queira solicitar novas demandas, volte a pagina inicial e escolha a opção <strong>projeto existente</strong>.  <br>
	
					</div>
				</div>
			</div>
		
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label for="justificativa">
							<span ng-if="item.ajuda && !projeto.justificativa" class="text-danger fa fa-close"></span>
							<span ng-if="item.ajuda && projeto.justificativa" class="text-success fa fa-check-circle"></span>
							Caracterização ou Justificativa
						</label>
						<textarea class="form-control" rows="4" minlength="5" name="justificativa" ng-model="projeto.justificativa" required></textarea>
						<div ng-if="item.ajuda && !projeto.justificativa" style="margin-left: 1%;">
							<div class="text-danger">
								<small>
									*A justificativa se faz necessária para suporte a tramitação do Projeto nas estâncias administrativas e financeiras. Mínimo de 5 caracteres.
								</small>
							</div>
				  		</div>
					</div>
					
					<hr style="margin-top: 2%;">
					<button class="btn btn-primary" type="submit" margin-bottom: 1%;">
						<span class="glyphicon glyphicon-ok"></span> Cadastrar 
					</button>	  
				</div>
			</div>
		</form>			
			
		<footer style="margin-top: 10%; margin-bottom: 2%;" class="footer text-center">
			<hr>
        	<h4>
        		<small class="text-info"> © 2016 Colégio Politécnico/UFSM. </small>
        		<small> Todos os direitos reservados. </small>
        	</h4>
        </footer>
	</div>
	
	<div class="modal fade" id="exemplo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        	<h4 class="modal-title text-muted" id="myModalLabel"> Exemplo de Projeto </h4>
				</div>
				<div class="modal-body text-center">
					<div class="form-group">
						<label for="proponente">Proponente</label>
						<input type="text" class="form-control text-center" value="Alencar Machado" disabled>		
					</div>
					<hr>
					<div class="form-group">
						<label for="titulo">Título do Projeto</label>
						<input type="text" class="form-control text-center" value="Sensibilidade ao Contexto em Sistemas para Ambientes Inteligentes" disabled/>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="número">Número do Projeto</label>
								<input type="text" class="form-control text-center" value="048364" disabled>		
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="modalidade">Modalidade</label>
								<input type="text" class="form-control text-center" value="Pesquisa" disabled>		
							</div>
						</div>
					</div>
					<hr>	
					<div class="form-group">
						<label for="justificativa">Caracterização ou Justificativa</label>
						<textarea class="form-control" rows="10" name="justificativa" disabled>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ultricies eros nunc, et semper ligula vulputate vitae. Donec sed scelerisque velit. Suspendisse eleifend lorem at mi ullamcorper aliquet. Nam lobortis vitae nibh quis efficitur. Pellentesque convallis enim nec consectetur porttitor. Donec ac purus et erat laoreet viverra sed a purus. Ut vitae nisi vitae sapien euismod faucibus quis ut magna. Proin condimentum, ex ut ultricies hendrerit, velit lectus molestie elit, vel varius quam augue vel ipsum. Duis eget commodo mauris. Phasellus nec dolor mollis, aliquam magna at, porta tellus. Mauris mi arcu, pretium dictum neque ut, viverra bibendum libero.

Phasellus tortor massa, feugiat a metus vitae, bibendum maximus enim. Aliquam erat volutpat. Quisque lacinia libero sapien, quis tristique nibh semper sed. Suspendisse feugiat condimentum nunc. Curabitur a libero tristique, blandit erat quis, condimentum nisi. Duis ut vehicula quam. Curabitur blandit tempor iaculis. Integer nec tincidunt ante. Donec aliquam velit purus, eu posuere nunc dapibus eu. Nam porta, enim eu scelerisque ornare, quam nunc accumsan elit, sed porttitor nulla dui vitae nisi. Etiam viverra, augue nec laoreet ultrices, nisi dui dignissim velit, nec viverra velit massa sed neque. Integer dapibus nunc ac interdum hendrerit. Praesent quis dui aliquet, venenatis mauris eu, eleifend massa. Cras accumsan ut nulla vel tempus. Suspendisse id fringilla ipsum, ut sagittis ipsum.
						</textarea>
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