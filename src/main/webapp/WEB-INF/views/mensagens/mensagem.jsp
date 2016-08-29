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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Já existe um Projeto com este número.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Projeto não Modificado.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Projeto não Removido.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Material não Cadastrado.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Material não Removido.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Material não Alterado.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'cadastroServico'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Serviço Cadastrado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroServico'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Serviço não Cadastrado.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removeServico'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Serviço Removido com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removeServico'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Serviço não Removido.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'alterarServico'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Serviço Alterado com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarServico'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Serviço não Alterado.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Bolsa não Cadastrada.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Bolsa não Removida.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Bolsa não Alterada.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Passagem não Cadastrada.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Passagem não Removida.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Passagem não Alterada.</strong> 
        </div>
    </c:if> 

	<c:if test="${status == 'cadastroDiarias'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Diária Cadastrada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_cadastroDiarias'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Diária não Cadastrada.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'removeDiarias'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Diária Removida com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_removeDiarias'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Diária não Removida.</strong> 
        </div>
    </c:if> 
    
    <c:if test="${status == 'alterarDiarias'}"> 
        <div class="alert alert-success" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! Diária Alterada com Sucesso.</strong> 
        </div>
    </c:if>
    
    <c:if test="${status == 'erro_alterarDiarias'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Diária não Alterada.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Projeto não Finalizado.</strong> 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Conta não removida.</strong> 
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
        	<span class="glyphicon glyphicon-ok"></span> <strong>Ok! O código de confirmação enviado novamente.</strong>
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
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
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Já possui usuário com este siape.</strong> 
        </div>
    </c:if> 

	<c:if test="${status == 'cadastroInvalidado'}"> 
        <div class="alert alert-warning" role="alert"> 
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Sua conta ainda não foi validada.</strong>
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong> <br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" maxlength="4" autocomplete="off" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
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
        	Para acessar sua conta você precisa validar seu email, um código de 4 digitos foi enviado para <strong>${usuario.email}</strong><br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
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
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Código de autenticação invalido.</strong> <br><br>
        	
        	<div class="row">
        		<div class="col-md-1"></div>
        		<div class="col-md-5">
        			<form action="autenticarConta?siape=${usuario.siape}" method="post" class="form-inline">
		  				<div class="form-group">
		    				<label for="Código">Insira seu código</label>
		    				<input type="text" class="form-control" minlength="4" autocomplete="off" maxlength="4" name="codigo" placeholder="Código" ng-model="codigo" required ui-number>
		  				</div>
		  				
		  				<button type="submit" class="btn btn-default">
		  					<span class="glyphicon glyphicon-ok text-primary"></span> <span class="text-primary">Confirmar</span>
		  				</button>
					</form>
        		</div>
        		<div class="col-md-5">
        			Caso não tenha recebido o código por email, 
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
