<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br" ng-app="form">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Diárias</title>

	<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	
	<script src="<c:url value='/resources/angular/angular.js'/>"></script>
	<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
	<script src="<c:url value='/resources/js/app.js'/>"></script>
	<script src="<c:url value='/resources/js/controllers/formCtrl.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/ng-currency.js'/>"></script>
	<script src="<c:url value='/resources/js/angular-locale_pt-br.js'/>"></script>
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
			<li role="presentation" class="active"><a href="#">Diárias</a></li>
			<li role="presentation"><a href="redirecionaModificarDiarias?numeroProjeto=${projeto.numeroProjeto}">Modificar Diárias</a></li>
		</ul>

		<ol class="breadcrumb" style="margin-top: 3%;">
			<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li class="active">Diárias</li>
	  		<li></li>
	  		<div class="pull-right active">
			  	<input type="checkbox" ng-model="diarias.ajuda"> Ajuda ?
	  		</div>	
		</ol>
					
		<c:if test="${status == 'cadastroDiarias'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<c:if test="${status == 'erro_cadastroDiarias'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<div class="alert alert-warning" ng-if="diarias.ajuda" role="alert">
			<span class="fa fa-info-circle"></span>
			Nesta versão de ajuda vôce terá o detalhamento das informações esperadas em cada campo e também um exemplo de preenchimento deste formulário.

			<a class="pull-right" data-toggle="modal" href="#exemplo"> 
				<span class="glyphicon glyphicon-eye-open text-info"></span> <span class="text-info">Exemplo</span>
			</a>			
		</div>
		
		<div class="row" style="margin-top:3%;">
			<form action="cadastrarDiarias?numeroProjeto=${projeto.numeroProjeto}" autocomplete="off" method="post">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<span ng-if="diarias.ajuda && !item.descricao" class="text-danger fa fa-close"></span>
								<span ng-if="diarias.ajuda && item.descricao" class="text-success fa fa-check-circle"></span>
								<label for="descricao">Destino</label>
								<textarea class="form-control" rows="2" minlength="5" name="descricao" ng-model="item.descricao" required></textarea>
								<small class="text-danger" ng-if="diarias.ajuda && !item.descricao" style="margin-left: 1%;">
									*campo obrigatorio, mínimo de 5 caracteres.
								</small>
							</div>
						</div>
					</div>		
					<hr>
				
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<span ng-if="diarias.ajuda && !item.valorUnit || item.valorUnit > 999999999 || item.valorUnit <= 0" class="text-danger fa fa-close"></span>
								<span ng-if="diarias.ajuda && item.valorUnit > 0 && item.valorUnit <= 999999999" class="text-success fa fa-check-circle"></span>
								<label for="precoUnit">Valor da Diária <strong>R$</strong></label>
								<input type="text" class="form-control" name="valorUnit" ng-model="item.valorUnit" ng-currency placeholder="Valor Unitário"/ required>
								<input type="hidden" name="valorUnitario" value="{{item.valorUnit}}" ng-model="item.valorUnitario" ui-number/>
								<small class="text-danger" ng-if="diarias.ajuda && !item.valorUnit" style="margin-left: 3%;">
									*campo obrigatório, apenas caracteres numéricos.
								</small>
								<small class="text-danger" ng-if="item.valorUnit > 999999999" style="margin-left: 3%">
									*valor muito alto (máximo R$ 999.999.999,00).
								</small>
								<small class="text-danger" ng-if="item.valorUnit <= 0" style="margin-left: 3%">
									*valor inválido.
								</small>																			
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<span ng-if="diarias.ajuda && !item.quantidade || item.quantidade == 0" class="text-danger fa fa-close"></span>
								<span ng-if="diarias.ajuda && item.quantidade > 0" class="text-success fa fa-check-circle"></span>
								<label for="quantidade">Nº de Dias</label>
								<input type="text" class="form-control" maxlength="7" name="quantidade" placeholder="Nº de Dias" ng-model="item.quantidade" ui-number required>
								<small class="text-danger" ng-if="diarias.ajuda && !item.quantidade" style="margin-left: 3%;">
									*campo obrigatório, apenas caracteres numéricos.
								</small>
								<small class="text-danger" ng-if="diarias.ajuda && item.quantidade == 0" style="margin-left: 3%;">
									*campo obrigatório, quantidade inválida.
								</small>
							</div>
						</div>
						<div class="col-md-4">
							<div ng-if="item.quantidade > 0 && item.valorUnit">
								<div class="form-group">
									<span ng-if="diarias.ajuda" class="text-success fa fa-check-circle"></span>
									<label for="total">Valor Total <strong>R$</strong></label>
									<input type="text" class="form-control" name="total" placeholder="Valor Total" value="{{item.quantidade * item.valorUnit | currency}}" disabled>
								</div>
							</div>
						</div>
					</div>
					<hr>
					
					<div class="row">
						<div class="col-md-9">
							<span ng-if="diarias.ajuda && user.meses.length <= 0" class="text-danger fa fa-close"></span>
							<span ng-if="diarias.ajuda && user.meses.length > 0" class="text-success fa fa-check-circle"></span>
							<label for="periodo">Periodo</label><br>
							<label class="checkbox-inline" ng-repeat="mes in meses">
			  					<input type="checkbox" name="periodo" checklist-model="user.meses" checklist-value="mes" value="{{mes}}"> {{mes}}
							</label>
							
							<div ng-if="user.meses.length <= 0">
								<small class="text-danger" style="margin-left: 1%;">
									*campo obrigatório.
								</small>
							</div>
						</div>
						<div class="col-md-1">
							<br><button class="btn btn-default" type="button" ng-click="todos()">Todos</button>
						</div>
						<div class="col-md-2">
							<br><button class="btn btn-default" type="button" ng-click="limpar()">Limpar</button>
						</div>
					</div>
					<hr>
					<button class="btn btn-primary" type="submit" 
						ng-disabled="user.meses.length <= 0 || item.valorUnit > 999999999 || item.quantidade == 0 || item.valorUnit <= 0">
						<span class="glyphicon glyphicon-ok"></span> Cadastrar
					</button>		
				</div>
				<div class="col-md-1"></div>
			</form>
		</div>
		
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
			        	<h4 class="modal-title text-muted" id="myModalLabel"> 
			        		<span class="fa fa-suitcase"></span> Exemplo de Diárias
			        	</h4>
				</div>
				<div class="modal-body text-center">
					<div class="form-group">
						<label for="proponente">Destino</label>
						<input type="text" class="form-control text-center" value="Participação Congresso Brasileiro de Computação (Porto Alegre)" disabled>		
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="proponente">Valor da Diária R$</label>
								<input type="text" class="form-control text-center" value="R$ 180,00" disabled>		
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="proponente">Nº de Dias</label>
								<input type="text" class="form-control text-center" value="5" disabled>		
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="proponente">Valor Total R$</label>
								<input type="text" class="form-control text-center" value="R$ 800,00" disabled>		
							</div>
						</div>
					</div>
					<hr>					
					<div class="form-group">
						<label for="proponente">Periodo: </label> Ago 	
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