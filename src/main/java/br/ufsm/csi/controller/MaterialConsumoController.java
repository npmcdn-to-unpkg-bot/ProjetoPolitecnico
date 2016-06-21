package br.ufsm.csi.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.MaterialConsumoDAO;
import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.model.MaterialConsumo;

@Controller
public class MaterialConsumoController {

	private ModelAndView modelAndView;
	private boolean retorno = false;
	
	@RequestMapping("materialConsumo")
	public String materialConsumo (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		return "materialConsumo/material-consumo";
	}
	
	@RequestMapping("cadastrarMaterialConsumo")
	public String cadastrarMaterialConsumo (long numeroProjeto, MaterialConsumo materialConsumo, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new MaterialConsumoDAO().adicionar(materialConsumo, numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroMaterial");			
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_cadastroMaterial");
		}
		
		return "redirect:materialConsumo?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("redirecionaModificarMaterialConsumo")
	public String redirecionaModificar (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("materaisConsumo", new MaterialConsumoDAO().lista(numeroProjeto));
		
		return "materialConsumo/modificar-material-consumo";
	}
	
	@RequestMapping("redirecionaAlterarMaterialConsumo")
	public String redirecionaAlterar (long numeroProjeto, String codigoMaterial, float valorTotal, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("materialConsumo", new MaterialConsumoDAO().getMaterialConsumo(numeroProjeto, codigoMaterial, valorTotal));
		
		return "materialConsumo/alterar-material-consumo";
	}
	
	@RequestMapping("removerMaterialConsumo")
	public String removerMaterialConsumo (long numeroProjeto, String codigoMaterial, float valorTotal, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new MaterialConsumoDAO().remover(numeroProjeto, codigoMaterial, valorTotal);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeMaterialConsumo");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeMaterialConsumo");
		}
		return "redirect:redirecionaModificarMaterialConsumo?numeroProjeto="+numeroProjeto;
	}
	
	@RequestMapping("alterarMaterialConsumo")
	public String alterarMaterialConsumo (MaterialConsumo materialConsumo, long numeroProjeto, String codigoMaterial, float valorTotal, RedirectAttributes redirectAttributes) throws SQLException{
		this.retorno = new MaterialConsumoDAO().alterar(materialConsumo, numeroProjeto, codigoMaterial, valorTotal);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "alterarMaterialConsumo");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_alterarMaterialConsumo");
		}
		return "redirect:redirecionaModificarMaterialConsumo?numeroProjeto="+numeroProjeto;
	}
}
