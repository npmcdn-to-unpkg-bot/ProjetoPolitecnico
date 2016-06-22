package br.ufsm.csi.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.MaterialConsumoDAO;
import br.ufsm.csi.dao.MaterialPermanenteDAO;
import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.model.MaterialConsumo;
import br.ufsm.csi.model.MaterialPermanente;

@Controller
public class MaterialPermanenteController {
	
	private ModelAndView modelAndView;
	private boolean retorno = false;
	
	@RequestMapping("materialPermanente")
	public String materialPermanente (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		return "materialPermanente/material-permanente";
	}
	
	@RequestMapping("cadastrarMaterialPermanente")
	public String cadastrarMaterialPermanente (long numeroProjeto, MaterialPermanente materialPermanente, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new MaterialPermanenteDAO().adicionar(materialPermanente, numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroMaterial");			
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroMaterial");
		}
		
		return "redirect:materialPermanente?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("redirecionaModificarMaterialPermanente")
	public String redirecionaModificar (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("materaisPermanente", new MaterialPermanenteDAO().lista(numeroProjeto));
		
		return "materialPermanente/modificar-material-permanente";
	}
	
	@RequestMapping("redirecionaAlterarMaterialPermanente")
	public String redirecionaAlterar (long numeroProjeto, int id, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("materialPermanente", new MaterialPermanenteDAO().getMaterialPermanente(id));
		
		return "materialPermanente/alterar-material-permanente";
	}
	
	@RequestMapping("removerMaterialPermanente")
	public String removerMaterialPermanente (long numeroProjeto, int id, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new MaterialPermanenteDAO().remover(id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeMaterialConsumo");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeMaterialConsumo");
		}
		return "redirect:redirecionaModificarMaterialPermanente?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("alterarMaterialPermanente")
	public String alterarMaterialPermanente (MaterialPermanente materialPermanente, long numeroProjeto, int id, 
			RedirectAttributes redirectAttributes) throws SQLException{
		
		this.retorno = new MaterialPermanenteDAO().alterar(materialPermanente, id);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "alterarMaterialConsumo");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarMaterialConsumo");
		}
		return "redirect:redirecionaModificarMaterialPermanente?numeroProjeto="+numeroProjeto;
	}
}
