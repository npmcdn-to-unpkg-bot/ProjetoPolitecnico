package br.ufsm.csi.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.BolsasDAO;
import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.model.Bolsas;

@Controller
public class BolsasController {
	
	private boolean retorno = false;
	
	@RequestMapping("bolsas")
	public String bolsas (String numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		return "bolsas/bolsas";
	}
	
	@RequestMapping("cadastrarBolsas")
	public String cadastrarBolsas (String numeroProjeto, Bolsas bolsas, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new BolsasDAO().adicionar(bolsas, numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroBolsas");			
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroBolsas");
		}

		return "redirect:bolsas?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("redirecionaModificarBolsas")
	public String redirecionaModificar (String numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("bolsas", new BolsasDAO().lista(numeroProjeto));
		
		return "bolsas/modificar-bolsas";
	}
	
	@RequestMapping("redirecionaAlterarBolsas")
	public String redirecionaAlterar (String numeroProjeto, int id, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("bolsas", new BolsasDAO().getBolsas(id));
		
		return "bolsas/alterar-bolsas";
	}
	
	@RequestMapping("removerBolsas")
	public String removerBolsas (String numeroProjeto, int id, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new BolsasDAO().remover(id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeBolsas");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeBolsas");
		}
		return "redirect:redirecionaModificarBolsas?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("alterarBolsas")
	public String alterarBolsas (Bolsas bolsas, String numeroProjeto, int id, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new BolsasDAO().alterar(bolsas, id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "alterarBolsas");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarBolsas");
		}
		return "redirect:redirecionaModificarBolsas?numeroProjeto="+numeroProjeto;
	}
}
