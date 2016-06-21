package br.ufsm.csi.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.DiariasDAO;
import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.dao.ServicoTerceirosDAO;
import br.ufsm.csi.model.Diarias;
import br.ufsm.csi.model.ServicoTerceiros;

@Controller
public class DiariasController {
	
	private boolean retorno = false;
	
	@RequestMapping("diarias")
	public String diarias (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		return "diarias/diarias";
	}
	
	@RequestMapping("cadastrarDiarias")
	public String cadastrarDiarias (long numeroProjeto, Diarias diarias, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new DiariasDAO().adicionar(diarias, numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroDiarias");			
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroDiarias");
		}

		return "redirect:diarias?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("redirecionaModificarDiarias")
	public String redirecionaModificar (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("diarias", new DiariasDAO().lista(numeroProjeto));
		
		return "diarias/modificar-diarias";
	}
	
	@RequestMapping("redirecionaAlterarDiarias")
	public String redirecionaAlterar (long numeroProjeto, float valorTotal, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("diarias", new DiariasDAO().getDiarias(numeroProjeto, valorTotal));
		
		return "diarias/alterar-diarias";
	}
	
	@RequestMapping("removerDiarias")
	public String removerDiarias (long numeroProjeto, float valorTotal, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new DiariasDAO().remover(numeroProjeto, valorTotal);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeDiarias");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeDiarias");
		}
		return "redirect:redirecionaModificarDiarias?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("alterarDiarias")
	public String alterarDiarias (Diarias diarias, long numeroProjeto, float valorTotal, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new DiariasDAO().alterar(diarias, numeroProjeto, valorTotal);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "alterarDiarias");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarDiarias");
		}
		return "redirect:redirecionaModificarDiarias?numeroProjeto="+numeroProjeto;
	}
}
