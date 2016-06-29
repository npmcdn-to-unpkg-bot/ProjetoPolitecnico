<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Bem-Vindo</title>
	
	    <link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
	    <link type="text/css" href="<c:url value='/resources/assets/css/mocca-pack-ufsm-min.css'/>" rel="stylesheet">
	    <link type="text/css" href="<c:url value='/resources/assets/css/smoothness/jquery-ui-min.css'/>" rel="stylesheet"> 
	    <script type="text/javascript" src="<c:url value='/resources/assets/js/browser-detector-min.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/resources/assets/js/jquery-min.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/resources/assets/js/jquery-ui-min.js'/>"></script>	
	</head>
	<body>	
		<div class="container" style="margin-top: 1%;">
			<div class="row">
    			<div class="col-md-10">
    				<div class="row">
    					<div class="col-md-2">
    						<img src="<c:url value='/resources/img/logopoli1.png'/>">	
    					</div>
   						<div class="col-md-10">
   							<h1 class="text-muted" style="margin-top: 4%; margin-left: 3%; font-size:45px;">Bem Vindo, ${usuarioLogado.nome}</h1>
   						</div>
    				</div>
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
		
	    	<ol class="breadcrumb">
	  			<li class="active">Pagina Inicial</li>
	  			<li></li>
			</ol>
    		
			<div class="alert alert-info" role="alert">
				Nesta janela voc� poder� escolher dentre 3 op��es: cadastrar um novo projeto, seguir em um projeto j� existente ou consultar a situa��o do seu projeto. <br><br>
					
				Na op��o de <strong>cadastrar um novo projeto</strong>, voc� informar� o nome e n�mero do seu projeto. Caso j� tenha iniciado um novo projeto e ainda n�o tenha finalizado, 
				voc� poder� escolher a op��o <strong>projeto existente</strong>, podendo assim, solicitar novas demandas. 
				Lembramos que essa op��o s� estar� dispon�vel para projetos ainda n�o finalizado.<br><br>
					
				Ap�s a finaliza��o, o projeto ser� enviado para avalia��o em seus devidos departamentos e n�o ser� mais poss�vel solicitar novas demandas no projeto. 
				Caso queira acompanhar em que fase est� o seu projeto, escolha a op��o <strong>consultar situa��o</strong>.<br><br>

			</div>
			
			<ul class="nav menu fixed-width fixed-heigth">
				<li>
					<a class="menu-item btn" href="projeto">
						<span class="menu-icon"><i class="fa fa-pencil-square-o text-success"></i></span>
						<span class="menu-label">Novo Projeto</span>
					</a>
				</li>
				<li>
					<a class="menu-item btn" href="projetoExistente?siape=${usuarioLogado.siape}">
						<span class="menu-icon"><i class="icon-external-link text-warning"></i></span>
						<span class="menu-label">Projeto Existente</span>
					</a>
				</li>
				<li>
					<a class="menu-item btn" href="#">
						<span class="menu-icon"><i class="icon-search text-primary"></i></span>
						<span class="menu-label">Consultar Situa��o </span>
					</a>
				</li>
			</ul>
			
			<footer style="margin-top: 10%; margin-bottom: 2%;" class="footer text-center">
				<hr>
        		<h4>
        			<small class="text-info"> � 2016 Col�gio Polit�cnico/UFSM. </small>
        			<small> Todos os direitos reservados. </small>
        		</h4>
        	</footer>
		</div>
		<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
		<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	</body>
</html>