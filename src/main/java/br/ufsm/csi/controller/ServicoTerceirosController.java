package br.ufsm.csi.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.dao.ServicoTerceirosDAO;
import br.ufsm.csi.model.ServicoTerceiros;

@Controller
public class ServicoTerceirosController {

	private boolean retorno = false;
	
	@RequestMapping("servicoTerceiros")
	public String servicoTerceiros (String numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		return "servicoTerceiros/servico-terceiros";
	}
	
	@RequestMapping("cadastrarServicoTerceiros")
	public String cadastrarServicoTerceiros (String numeroProjeto, ServicoTerceiros servicoTerceiros, 
			RedirectAttributes redirectAttributes) throws SQLException{
		
		this.retorno = new ServicoTerceirosDAO().adicionar(servicoTerceiros, numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroServico");			
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroServico");
		}

		return "redirect:servicoTerceiros?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("redirecionaModificarServicoTerceiros")
	public String redirecionaModificar (String numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("servicoTerceiros", new ServicoTerceirosDAO().lista(numeroProjeto));
		
		return "servicoTerceiros/modificar-servico-terceiros";
	}
	
	@RequestMapping("redirecionaAlterarServicoTerceiros")
	public String redirecionaAlterar (String numeroProjeto, int id, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("servicoTerceiros", new ServicoTerceirosDAO().getServicoTerceiros(id));
		
		return "servicoTerceiros/alterar-servico-terceiros";
	}
	
	@RequestMapping("removerServicoTerceiros")
	public String removerServicoTerceiros (String numeroProjeto, int id, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new ServicoTerceirosDAO().remover(id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeServico");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeServico");
		}
		return "redirect:redirecionaModificarServicoTerceiros?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("alterarServicoTerceiros")
	public String alterarServicoTerceiros (ServicoTerceiros servicoTerceiros, String numeroProjeto, int id, 
			RedirectAttributes redirectAttributes) throws SQLException{
		
		this.retorno = new ServicoTerceirosDAO().alterar(servicoTerceiros, id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "alterarServico");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarServico");
		}
		return "redirect:redirecionaModificarServicoTerceiros?numeroProjeto="+numeroProjeto;
	}
}
