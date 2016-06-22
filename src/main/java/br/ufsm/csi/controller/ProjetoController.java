package br.ufsm.csi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.model.Projeto;
import br.ufsm.csi.model.Usuario;

@Controller
@SessionAttributes("projeto")
public class ProjetoController {
	
	private ModelAndView modelAndView;
	private boolean retorno = false;
	
	@RequestMapping("projetoExistente")
	public String projetoExistente (Model model, long siape){
		model.addAttribute("projetos", new ProjetoDAO().getProjetos(siape));
		return "projeto/projeto-existente";
	}
	
	@RequestMapping("acessoProjetoExistente")
	public String acessoProjetoExistente (Model model, long numeroProjeto){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("demandas", new ProjetoDAO().getDemandas(numeroProjeto));
		
		return "menu/principal";
	}
	
	@RequestMapping("removerProjetoExistente")
	public String removerProjetoExistente (long numeroProjeto, long siape, RedirectAttributes redirectAttributes) throws Exception{
		this.retorno = new ProjetoDAO().remover(numeroProjeto);

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeProjeto");
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeProjeto");
		}
		return "redirect:projetoExistente?siape="+siape;
	}
	
	@RequestMapping("projeto")
	public String projeto (){
		return "projeto/projeto";
	}
	
	@RequestMapping(value="/cadastrarProjeto", method = RequestMethod.POST)
	public String cadastrarProjeto (Projeto projeto, RedirectAttributes redirectAttributes) throws Exception{  
		this.retorno = new ProjetoDAO().adicionar(projeto);
		
		redirectAttributes.addFlashAttribute("projeto", projeto);
		
		if(retorno){
			redirectAttributes.addFlashAttribute("status", "cadastroProjeto");
			
			return "redirect:cadastro";			
		}else{
			redirectAttributes.addFlashAttribute("proponente", projeto.getProponente());
			redirectAttributes.addFlashAttribute("status", "erro_cadastroProjeto");
			
			return "redirect:erro";
		}
	}
	
	@RequestMapping(value="/cadastro", method = RequestMethod.GET)
	public String cadastroSucesso(Projeto projeto, Model model) {  
		model.addAttribute("projeto", projeto);
		model.addAttribute("demandas", new ProjetoDAO().getDemandas(projeto.getNumeroProjeto()));
		
		return "menu/principal";
	}
	
	@RequestMapping(value="/erro", method = RequestMethod.GET)
	public String CadastroErro(@ModelAttribute("projeto") Projeto projeto, Model model) {  
		model.addAttribute("proponente", projeto.getProponente());
		
		return "projeto/projeto";
	}
	
	@RequestMapping("redirecionaModificar")
	public String redirecionaModificar (long numeroProjeto, Model model){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("demandas", new ProjetoDAO().getDemandas(numeroProjeto));
		
		return "projeto/modificarProjeto";
	}
	
	@RequestMapping("modificarProjeto")
	public String modificar (Projeto projeto, Model model, HttpServletRequest request) throws Exception {
		projeto.setNomeProjeto(request.getParameter("nome"));
		this.retorno = new ProjetoDAO().modificar(projeto);
		
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(projeto.getNumeroProjeto()));
		model.addAttribute("demandas", new ProjetoDAO().getDemandas(projeto.getNumeroProjeto()));

		if(retorno){
			model.addAttribute("status", "modificaProjeto");
			return "menu/principal";
		}else{
			model.addAttribute("status", "erro_modificaProjeto");
			return "menu/principal";
		}
	}
	
	@RequestMapping("removerProjeto")
	public String remover (Projeto projeto, Model model, RedirectAttributes redirectAttributes) throws Exception {
		this.retorno = new ProjetoDAO().remover(projeto.getNumeroProjeto());

		if(retorno){
			redirectAttributes.addFlashAttribute("status", "removeProjeto"); 
			return "redirect:projetoExistente?siape="+projeto.getSiape();
		}else{
			redirectAttributes.addFlashAttribute("status", "erro_removeProjeto");
			redirectAttributes.addFlashAttribute("projeto", new ProjetoDAO().listaProjeto(projeto.getNumeroProjeto()));
			return "menu/principal";
		}
	}
}
