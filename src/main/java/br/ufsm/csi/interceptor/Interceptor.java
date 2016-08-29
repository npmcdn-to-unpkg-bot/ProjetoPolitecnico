package br.ufsm.csi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			  HttpServletResponse response, Object controller) throws Exception {
		
		String uri = request.getRequestURI();
	    if(uri.endsWith("login") || uri.endsWith("loginCtrl") || uri.endsWith("criarConta")  || uri.endsWith("recuperarSenha") 
	    		|| uri.endsWith("modificarConta")  || uri.endsWith("removerConta") || uri.endsWith("reenviarEmail") 
	    		|| uri.endsWith("autenticarConta") || uri.endsWith("removerConta") || uri.contains("resources")){
	        return true;
	    }

	    if(request.getSession().getAttribute("usuarioLogado") != null) {
	        return true;
	    }
	      
	    response.sendRedirect("login");
	    return false;
	}

}
