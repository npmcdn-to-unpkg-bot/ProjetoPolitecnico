package br.ufsm.csi.controller;

import java.sql.SQLException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.UsuarioDAO;
import br.ufsm.csi.javaEmail.CriarConta;
import br.ufsm.csi.javaEmail.RecuperarConta;
import br.ufsm.csi.model.Usuario;

@Controller
public class UsuarioController {

	private boolean retorno = false;
	
	@RequestMapping("criarConta")
	public String criarConta (Usuario usuario, RedirectAttributes redirectAttributes) throws EmailException, SQLException{
		
		Random random = new Random();
		int codigo = random.nextInt(8999) + 1000;  // gera um codigo aleatorio de 4 digitos
		
		this.retorno = new UsuarioDAO().adicionarUsuario(usuario, codigo);

		if(retorno){
			new CriarConta().sendEmail(usuario, codigo);  // enviar o email de confirmação
			
			redirectAttributes.addFlashAttribute("status", "cadastroUsuario");
			redirectAttributes.addFlashAttribute("usuario", usuario);	
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroUsuario");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("autenticarConta")
	public String autenticarConta (long siape, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception{

		this.retorno = new UsuarioDAO().autenticarConta(siape, Integer.parseInt(request.getParameter("codigo")));

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "autenticarUsuario");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_autenticarUsuario");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("modificarConta")
	public String modificarConta (Usuario usuario, long siape, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception{
		
		this.retorno = new UsuarioDAO().modificarConta(usuario, siape);

		if(retorno){
			this.retorno = new UsuarioDAO().reenviarEmail(siape);
			redirectAttributes.addFlashAttribute("status", "modificarConta");
			session.setAttribute("usuario", usuario);
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroUsuario");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("removerConta")
	public String removerConta (long siape, RedirectAttributes redirectAttributes) throws Exception{

		this.retorno = new UsuarioDAO().removerConta(siape);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removerConta");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removerConta");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("recuperarSenha")
	public String recuperarSenha (Usuario usuario, RedirectAttributes redirectAttributes) throws Exception{
		
		Usuario usuarioAutenticado = new UsuarioDAO().recuperarSenha(usuario);

		if(usuarioAutenticado != null){
			new RecuperarConta().sendEmail(usuarioAutenticado);
			
			redirectAttributes.addFlashAttribute("status", "recuperarSenha");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_recuperarSenha");
		}
		
		return "redirect:login";
	}
	
	@RequestMapping("reenviarEmail")
	public String reenviarEmail (long siape, RedirectAttributes redirectAttributes) throws Exception{

		this.retorno = new UsuarioDAO().reenviarEmail(siape);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "emailReenviado");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_emailReenviado");
		}
		
		return "redirect:login";
	}
}
