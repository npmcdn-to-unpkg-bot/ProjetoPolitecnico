<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

	<c:if test="${status == 'erro_login'}"> 
        <div class="alert alert-danger" role="alert"> 
        	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        	<span class="glyphicon glyphicon-warning-sign"></span> <strong>Opa! Siape ou Senha incorreto(s).</strong> 
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

<c:set var="status" value="vazio" scope="page" />
