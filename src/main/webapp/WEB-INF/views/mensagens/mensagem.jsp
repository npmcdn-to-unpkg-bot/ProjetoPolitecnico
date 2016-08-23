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

<c:set var="status" value="vazio" scope="page" />
