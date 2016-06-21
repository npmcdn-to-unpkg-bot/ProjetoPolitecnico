package br.ufsm.csi.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.MaterialConsumoDAO;
import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.dao.ServicoTerceirosDAO;
import br.ufsm.csi.model.MaterialConsumo;
import br.ufsm.csi.model.ServicoTerceiros;

@Controller
public class ServicoTerceirosController {

	private ModelAndView modelAndView;
	private boolean retorno = false;
	
	@RequestMapping("servicoTerceiros")
	public String servicoTerceiros (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		return "servicoTerceiros/servico-terceiros";
	}
	
	@RequestMapping("cadastrarServicoTerceiros")
	public String cadastrarServicoTerceiros (long numeroProjeto, ServicoTerceiros servicoTerceiros, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new ServicoTerceirosDAO().adicionar(servicoTerceiros, numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroServico");			
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroServico");
		}

		return "redirect:servicoTerceiros?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("redirecionaModificarServicoTerceiros")
	public String redirecionaModificar (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("servicoTerceiros", new ServicoTerceirosDAO().lista(numeroProjeto));
		
		return "servicoTerceiros/modificar-servico-terceiros";
	}
	
	@RequestMapping("redirecionaAlterarServicoTerceiros")
	public String redirecionaAlterar (long numeroProjeto, float valorTotal, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("servicoTerceiros", new ServicoTerceirosDAO().getServicoTerceiros(numeroProjeto, valorTotal));
		
		return "servicoTerceiros/alterar-servico-terceiros";
	}
	
	@RequestMapping("removerServicoTerceiros")
	public String removerServicoTerceiros (long numeroProjeto, float valorTotal, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new ServicoTerceirosDAO().remover(numeroProjeto, valorTotal);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeServicoTerceiros");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeServicoTerceiros");
		}
		return "redirect:redirecionaModificarServicoTerceiros?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("alterarServicoTerceiros")
	public String alterarServicoTerceiros (ServicoTerceiros servicoTerceiros, long numeroProjeto, float valorTotal, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new ServicoTerceirosDAO().alterar(servicoTerceiros, numeroProjeto, valorTotal);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "alterarServicoTerceiros");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarServicoTerceiros");
		}
		return "redirect:redirecionaModificarServicoTerceiros?numeroProjeto="+numeroProjeto;
	}
}
