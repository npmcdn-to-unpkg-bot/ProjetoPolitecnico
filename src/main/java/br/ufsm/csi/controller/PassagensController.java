package br.ufsm.csi.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.PassagensDAO;
import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.model.Passagens;

@Controller
public class PassagensController {

	private boolean retorno = false;
	
	@RequestMapping("passagens")
	public String passagens (String numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		return "passagens/passagens";
	}
	
	@RequestMapping("cadastrarPassagens")
	public String cadastrarPassagens (String numeroProjeto, Passagens passagens, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new PassagensDAO().adicionar(passagens, numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroPassagens");			
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroPassagens");
		}
		
		return "redirect:passagens?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("redirecionaModificarPassagens")
	public String redirecionaModificar (String numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("passagens", new PassagensDAO().lista(numeroProjeto));
		
		return "passagens/modificar-passagens";
	}
	
	@RequestMapping("redirecionaAlterarPassagens")
	public String redirecionaAlterar (String numeroProjeto, int id, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("passagens", new PassagensDAO().getPassagens(id));
		
		return "passagens/alterar-passagens";
	}
	
	@RequestMapping("removerPassagens")
	public String removerPassagens (String numeroProjeto, int id, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new PassagensDAO().remover(id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removePassagens");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removePassagens");
		}
		return "redirect:redirecionaModificarPassagens?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("alterarPassagens")
	public String alterarPassagens (Passagens passagens, String numeroProjeto, int id, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new PassagensDAO().alterar(passagens, id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "alterarPassagens");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarPassagens");
		}
		return "redirect:redirecionaModificarPassagens?numeroProjeto="+numeroProjeto;
	}
}
