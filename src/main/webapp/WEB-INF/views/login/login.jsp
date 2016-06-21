<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>           
<html ng-app="form">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>Login</title>
        
        <link rel="icon" href="imagens/img12.jpg">
        <link type="text/css" href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
        <link type="text/css" href="<c:url value='/resources/assets/css/mocca-pack-ufsm-min.css'/>" rel="stylesheet">
        <link type="text/css" href="<c:url value='/resources/assets/css/smoothness/jquery-ui-min.css'/>" rel="stylesheet"> 
          
        <script type="text/javascript" src="<c:url value='/resources/assets/js/browser-detector-min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/assets/js/jquery-min.js'/>"></script>
        <script type="text/javascript" src="<c:url value='/resources/assets/js/jquery-ui-min.js'/>"></script>
        
        <script src="<c:url value='/resources/angular/angular.js'/>"></script>
		<script src="<c:url value='/resources/angular/checklist-model.js'/>"></script>
		<script src="<c:url value='/resources/js/app.js'/>"></script>
		<script src="<c:url value='/resources/js/directives/uiDirectives.js'/>"></script>
        
        <style> 
            .themed-band { background-color: #12416B; background: url('<c:url value='/resources/img/UFSM-banner-bg.jpg'/>') top left repeat-x; }
            .form-spacing { height: 60px; } 
            .form { margin-top: 1em; margin-bottom: 1em; background-color: rgba(245, 245, 245, .94); } 
            .transparent-subband { /*min-height: 120px;*/ background-color: rgba(255, 255, 255, .85); }
            .form-subband { /*background-color: rgba(255, 255, 255, .1);*/ } 
            .container.semi-narrow { padding-top: .5em; padding-bottom: .5em; }
        </style>              
    </head>
    <body>
        <div class="table-layout-wrapper">
                <div class="band expansible">
                    <div class="band themed-band shadowed">
                        <div class="band transparent-subband">
                            <div class="container"> 
                                <img style"width: 30%;" src="<c:url value='/resources/img/logopoli4.png'/>">
                                <a class="no-link h1 pull-right  uppercase humanist-font" href="#">
                                    <b>UFSM</b> | Solicitação de Materiais em Projetos
                                </a> 
                            </div>
                        </div>
                        <div class="band form-subband">
                            <div class="container no-padding-v">
                                <div class="row">
                                    <div class="span6"> 
                                        <img class="responsive hidden-phone" src="<c:url value='/resources/img/UFSM-banner-logo.png'/>" alt="logo"/> 
                                    </div>
                                    <div class="span6">
                                        <div class="form-spacing hidden-phone-tablet"></div>
                                        <div class="box form bordered shadowed rounded pull-right-tablet-desktop">
                                            <form action="loginCtrl" method="post" >
                                                <div class="row"></div>
                                                <div class="row">
                                                    <div class="span12 padding-top"> 
                                                        <label for="siape" class="label" style="font-size: 15px;">Siape</label> 
                                                        <input id="text" name="siape" maxlength="10" type="text" class="textfield" ng-model="siape" required ui-number/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="span12 padding-top"> 
                                                        <label for="senha" class="label" style="font-size: 15px;">Senha</label> 
                                                        <input id="text" name="senha" type="password" class="textfield" required/> 
                                                    </div>
                                                </div>
                                                <div class="row">                                                    
                                                	<div class="span12 text-center"> 
                                                        <button type="submit" name="opcao" value="logar" class="btn primary "> Entrar <i class="glyphicon glyphicon-lock"></i></button>  
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="band transparent-subband mini-font-size">
                            <div class="container semi-narrow">
                                <div class="row">
                                    <div class="span6"> 
                                        <span class="dimmed">Solicitação de Materiais em Projetos - Vers&atilde;o 1.0.0</span> 
                                    </div>
                                    <div class="span6 align-right-tablet-desktop"> 
                                        <span class="dimmed">Joedeson Junior  © 2016 Colegio Politecnico/UFSM. Todos os direitos reservados.</span> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
        </div>
</body>
</html>