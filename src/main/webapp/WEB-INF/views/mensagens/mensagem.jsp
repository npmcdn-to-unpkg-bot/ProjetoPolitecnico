<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

	<c:if test="${status == 'erro_login'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa!</strong> Siape ou Senha incorreto(s). 
        </div>
    </c:if> 

    <c:if test="${status == 'cadastroProjeto'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Projeto Cadastrado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroProjeto'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! J� existe um Projeto com este n�mero.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'modificaProjeto'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Projeto Alterado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_modificaProjeto'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Projeto n�o Modificado.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removeProjeto'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Projeto Removido com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removeProjeto'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Projeto n�o Removido.</strong> 
        </div>
    </c:if>

	<c:if test="${status == 'cadastroMaterial'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Material Cadastrado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroMaterial'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Material n�o Cadastrado.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removeMaterialConsumo'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Material Removido com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removeMaterialConsumo'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Material n�o Removido.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'alterarMaterialConsumo'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Material Alterado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarMaterialConsumo'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Material n�o Alterado.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'cadastroServico'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Servi�o Cadastrado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroServico'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Servi�o n�o Cadastrado.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removeServico'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Servi�o Removido com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removeServico'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Servi�o n�o Removido.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'alterarServico'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Servi�o Alterado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarServico'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Servi�o n�o Alterado.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'cadastroBolsas'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Bolsa Cadastrada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroBolsas'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Bolsa n�o Cadastrada.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removeBolsas'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Bolsa Removida com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removeBolsas'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Bolsa n�o Removida.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'alterarBolsas'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Bolsa Alterada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarBolsas'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Bolsa n�o Alterada.</strong> 
        </div>
    </c:if> 

	<c:if test="${status == 'cadastroPassagens'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Passagem Cadastrada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroPassagens'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Passagem n�o Cadastrada.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removePassagens'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Passagem Removida com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removePassagens'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Passagem n�o Removida.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'alterarPassagens'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Passagem Alterada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarMaPassagens'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Passagem n�o Alterada.</strong> 
        </div>
    </c:if> 

	<c:if test="${status == 'cadastroDiarias'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Di�ria Cadastrada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroDiarias'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Di�ria n�o Cadastrada.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removeDiarias'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Di�ria Removida com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removeDiarias'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Di�ria n�o Removida.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'alterarDiarias'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Di�ria Alterada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarDiarias'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Di�ria n�o Alterada.</strong> 
        </div>
    </c:if> 

	 <c:if test="${status == 'finalizado'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Projeto Finalizado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_finalizado'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Projeto n�o Finalizado.</strong> 
        </div>
    </c:if> 
	
	<c:if test="${status == 'removerConta'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Conta removida com Sucesso.</strong> 
        </div>
    </c:if>
    <c:if test="${status == 'erro_removerConta'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Conta n�o removida.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'recuperarSenha'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! A senha da sua conta foi enviada para seu email .</strong> 
        </div>
    </c:if>
    <c:if test="${status == 'erro_recuperarSenha'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Email ou siape incorretos.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'emailReenviado'}"> 
        <div class="alert alert-success" role="alert"> 
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! O c�digo de confirma��o enviado novamente.</strong>
        	Para acessar sua conta voc� precisa validar seu email, um c�digo de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="C�digo">Insira seu c�digo</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="C�digo" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso n�o tenha recebido o c�digo por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>  
	    <c:if test="${status == 'erro_emailReenviado'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Tente novamente mais tarde.</strong> 
        </div>
    </c:if> 
	
	<c:if test="${status == 'cadastroUsuario'}"> 
        <div class="alert alert-success" role="alert"> 
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Conta criada com Sucesso.</strong>
        	Para acessar sua conta voc� precisa validar seu email, um c�digo de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="C�digo">Insira seu c�digo</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="C�digo" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso n�o tenha recebido o c�digo por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>  
    
    <c:if test="${status == 'erro_cadastroUsuario'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! J� possui usu�rio com este siape.</strong> 
        </div>
    </c:if> 

	<c:if test="${status == 'cadastroInvalidado'}"> 
        <div class="alert alert-warning" role="alert"> 
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Sua conta ainda n�o foi validada.</strong>
        	Para acessar sua conta voc� precisa validar seu email, um c�digo de 4 digitos foi enviado para <strong>${usuario.email}</strong> <br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="C�digo">Insira seu c�digo</label>
		    				<input type="text" class="form-control" minlength="4" maxlength="4" autocomplete="off" name="codigo" placeholder="C�digo" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso n�o tenha recebido o c�digo por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>
    
    <c:if test="${status == 'modificarConta'}"> 
        <div class="alert alert-success" role="alert"> 
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Conta alterada com Sucesso.</strong>
        	Para acessar sua conta voc� precisa validar seu email, um c�digo de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="C�digo">Insira seu c�digo</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="C�digo" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso n�o tenha recebido o c�digo por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if>  
    
    <c:if test="${status == 'autenticarUsuario'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Conta autenticada com Sucesso.</strong>
        </div>
    </c:if>
	
	<c:if test="${status == 'erro_autenticarUsuario'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! C�digo de autentica��o invalido.</strong> <br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="C�digo">Insira seu c�digo</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="C�digo" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso n�o tenha recebido o c�digo por email, 
        			<a data-toggle="modal" href="#reenviarEmail"> 
						<span class="fa fa-envelope"></span> Clique Aqui
					</a>
        		</div>
        		<div class="col-md-1"></div>
        	</div> <br>
        	<div class="text-center">
        		Para alterar seu cadastro ou cancelar sua conta,
        		<a data-toggle="modal" href="#alterarCadastro"> 
					<span class="glyphicon glyphicon-wrench"></span> Clique Aqui
				</a>
        	</div>
        </div>
    </c:if> 
	
<c:set var="status" value="vazio" scope="page" />
