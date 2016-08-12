<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br" ng-app="form">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Material Permanente</title>

	<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>">
	
	<script src="<c:url value='/resources/angular/angular.js'/>"></script>
	<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
	<script src="<c:url value='/resources/js/app.js'/>"></script>
	<script src="<c:url value='/resources/js/controllers/formPermanenteCtrl.js'/>"></script>
	<script src="<c:url value='/resources/js/service/MaterialPermanenteService.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
	<script src="<c:url value='/resources/js/directives/ng-currency.js'/>"></script>
	<script src="<c:url value='/resources/js/angular-locale_pt-br.js'/>"></script>
  </head>
  <body ng-controller="formPermanenteCtrl" ng-cloak>
	
	<div class="container" id="conteudo" style="margin-top: 1%;">
	
		<!-- CABE�ALHO -->
		<div class="row">
    		<div class="col-md-10">
    			<h1 class="text-muted"> <span class="fa fa-shopping-basket"></span> Material Permanente</h1>
    		</div>
    		<div class="col-md-2">
				<jsp:include page="../formularios/sair.jsp"></jsp:include>
    		</div>
    	</div>
		
		<!-- MENU -->
		<ul class="nav nav-tabs" style="margin-top: 2%;" id="menu">
			<li role="presentation" class="active"><a href="#">Material Permanente</a></li>
			<li role="presentation"><a href="redirecionaModificarMaterialPermanente?numeroProjeto=${projeto.numeroProjeto}">Modificar Material Permanente</a></li>
		</ul>
		
		<!-- CAMINHOS -->
		<ol class="breadcrumb" style="margin-top: 3%;">
			<li><a href="redirecionaInicio">Pagina Inicial</a></li>
	  		<li><a href="cadastro">Solicitar Demandas no Projeto</a></li>
	  		<li class="active">Material Permanente</li>
	  		<div class="pull-right active">
			  	<input type="checkbox" ng-model="item.ajuda"> Ajuda ?
	  		</div>
		</ol>
		
		<!-- MENSAGENS -->	
		<c:if test="${status == 'cadastroMaterial'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>	
		<c:if test="${status == 'erro_cadastroMaterial'}">
			<div style="margin-top: 2%">
				<c:import url="../mensagens/mensagem.jsp" />
			</div>
		</c:if>
		
		<jsp:include page="../formularios/ajuda.jsp"></jsp:include>
		
		<!-- FORMUL�RIO -->
		<div class="row" style="margin-top:3%;">
			<form action="cadastrarMaterialPermanente?numeroProjeto=${projeto.numeroProjeto}" autocomplete="off" method="post">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<div class="row">
						<!-- DESCRI��O -->
						<div class="col-md-8">
							<jsp:include page="../formularios/descricao-trecho-destino.jsp"></jsp:include>
						</div>
						<!-- UNIDADE DE MEDIDA -->
						<div class="col-md-4">
							<jsp:include page="../formularios/unidadeMedida.jsp"></jsp:include>
						</div>
					</div>
					
					<!-- SUB-ITEM -->
					<hr>
					<span ng-if="item.ajuda && !item.materialPermanente" class="text-danger fa fa-close"></span>
					<span ng-if="item.ajuda && item.materialPermanente" class="text-success fa fa-check-circle"></span>
					<label for="subItem">Sub-Item</label>
					<select class="form-control" ng-model="item.materialPermanente" ng-options="materialPermanente.codigo +' - ' +materialPermanente.nome for materialPermanente in materiaisPermanente" required>
						<option value=""> --- Selecione um Sub-Item --- </option>
					</select>
					<small class="text-danger" ng-if="item.ajuda && !item.materialPermanente" style="margin-left: 1%;">
						*campo obrigat�rio.
					</small>
					<div ng-if="item.materialPermanente">
						<hr>
						<div class="alert alert-info" role="alert">
							<input type="hidden" name="subItem" value="{{item.materialPermanente.codigo}}" />
							{{item.materialPermanente.descricao}}
							<br><br> <strong>Exemplos: </strong> <br><br>
							{{item.materialPermanente.exemplo}}
						</div>
					</div>
					
					<!-- VALOR UNI�RIO - QUANTIDADE - VALOR TOTAL -->
					<hr>	
					<div class="row">
						<div class="col-md-4">
							<jsp:include page="../formularios/valorUnitario.jsp"></jsp:include>
						</div>
						<div class="col-md-4">
							<jsp:include page="../formularios/quantidade.jsp"></jsp:include>
						</div>
						<div class="col-md-4">
							<jsp:include page="../formularios/valorTotal.jsp"></jsp:include>
						</div>
					</div>
					
					<!-- PERIODO -->
					<hr>
					<jsp:include page="../formularios/periodo.jsp"></jsp:include>
					<hr>
			
					<jsp:include page="../formularios/justificativa.jsp"></jsp:include>

					<hr>
					<button class="btn btn-primary" type="submit" 
						ng-disabled="user.meses.length <= 0 || item.valorUnit > 999999999 || item.quantidade == 0 || item.valorUnit <= 0">
						<span class="glyphicon glyphicon-ok"></span> Cadastrar
					</button>		
				</div>
				<div class="col-md-1"></div>
			</form>
		</div>
		
		<!-- RODAPE -->
		<jsp:include page="../menu/rodape.jsp"></jsp:include>
	</div>

	<!-- EXEMPLO MODAL -->
	<div class="modal fade" id="exemplo" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
			    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        	<h4 class="modal-title text-muted" id="myModalLabel"> 
			        		<span class="fa fa-shopping-basket"></span> Exemplo de Material Permanente
			        	</h4>
				</div>
				<div class="modal-body text-center">
					<div class="row">
						<div class="col-md-8">
							<div class="form-group">
								<label for="proponente">Descri��o</label>
								<input type="text" class="form-control text-center" value="Monitor 19' Polegadas" disabled>		
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="proponente">Unidade de Medida</label>
								<input type="text" class="form-control text-center" value="Unidade/unid" disabled>		
							</div>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<label for="proponente">SubItem</label>
						<input type="text" class="form-control text-center" value="4.4.90.52.35 - Equipamentos de Processamento de Dados" disabled>		
					</div>
					<hr>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
								<label for="proponente">Valor Unit�rio R$</label>
								<input type="text" class="form-control text-center" value="R$ 800,00" disabled>		
							</div>
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label for="proponente">Quantidade</label>
								<input type="text" class="form-control text-center" value="2" disabled>		
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="proponente">Valor Total R$</label>
								<input type="text" class="form-control text-center" value="R$ 1600,00" disabled>		
							</div>
						</div>
					</div>
					<hr>					
					<div class="form-group">
						<label for="proponente">Periodo: </label> Jan, Fev, Mar, Abr, Mai, Jun, Jul, Ago, Set, Out, Nov, Dez 	
					</div>
					<hr>
					<div class="form-group">
						<label for="proponente">Justificativa</label>
						<input type="text" class="form-control text-center" value="Monitor extra para aux�lio a atividades di�rias." disabled>		
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