package br.ufsm.csi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.model.Usuario;

@Controller
public class LoginController {
	
	@RequestMapping("login")
	public String logar (){
		return "login/login";
	}
	
	@RequestMapping("redirecionaInicio")
	public String redirecionaInicio (){
		return "menu/menu-projeto";
	}
	
	@RequestMapping("loginCtrl")
	public String autenticarUsuario (Usuario usuario, HttpSession session, RedirectAttributes redirectAttributes) throws Exception{
		Usuario usuarioAutenticado = new ProjetoDAO().altenticarUsuario(usuario);

		if(usuarioAutenticado != null){
			if(usuarioAutenticado.getCadastro()){  // cadastro validade
				session.setAttribute("usuarioLogado", usuarioAutenticado);
				return "menu/menu-projeto";
			}
			else{  // cadastro n�o validado
				redirectAttributes.addFlashAttribute("status", "cadastroInvalidado");
				session.setAttribute("usuario", usuarioAutenticado);
				return "redirect:login";
			}
		}
		else{
			redirectAttributes.addFlashAttribute("status", "erro_login");
			return "redirect:login";
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
	  session.invalidate();
	  return "redirect:login";
	}
}
