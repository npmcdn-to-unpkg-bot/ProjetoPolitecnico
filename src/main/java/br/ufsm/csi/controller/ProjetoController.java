package br.ufsm.csi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufsm.csi.apachePOI.CriaExcel;
import br.ufsm.csi.dao.BolsasDAO;
import br.ufsm.csi.dao.ProjetoDAO;
import br.ufsm.csi.model.Demanda;
import br.ufsm.csi.model.Projeto;

@Controller
@SessionAttributes("projeto")
public class ProjetoController {
	
	private boolean retorno = false;
	
	@RequestMapping("projetoExistente")
	public String projetoExistente (Model model, long siape){
		model.addAttribute("projetos", new ProjetoDAO().getProjetos(siape));
		return "projeto/projeto-existente";
	}
	
	@RequestMapping("acessoProjetoExistente")
	public String acessoProjetoExistente (Model model, String numeroProjeto){
		model.addAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
		model.addAttribute("demandas", new ProjetoDAO().getDemandas(numeroProjeto));
		model.addAttribute("bolsas", new BolsasDAO().lista(numeroProjeto));
		
		return "menu/principal";
	}
	
	@RequestMapping("removerProjetoExistente")
	public String removerProjetoExistente (String numeroProjeto, long siape, RedirectAttributes redirectAttributes) throws Exception{
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
		model.addAttribute("bolsas", new BolsasDAO().lista(projeto.getNumeroProjeto()));
		
		return "menu/principal";
	}
	
	@RequestMapping(value="/erro", method = RequestMethod.GET)
	public String CadastroErro(@ModelAttribute("projeto") Projeto projeto, Model model) {  
		model.addAttribute("proponente", projeto.getProponente());
		
		return "projeto/projeto";
	}
	
	@RequestMapping("redirecionaModificar")
	public String redirecionaModificar (String numeroProjeto, Model model){
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
	
	@RequestMapping("finalizar")
	public String finalizar (String numeroProjeto, long siape, RedirectAttributes redirectAttributes) throws Exception{
		
		Projeto projeto = new ProjetoDAO().projetoFinalizado(numeroProjeto);
		ArrayList<Demanda> itens = new ProjetoDAO().Itens(numeroProjeto);
		
		new CriaExcel().criar(projeto, itens);
		this.retorno = new ProjetoDAO().finalizar(numeroProjeto);
		
		if(retorno){
			redirectAttributes.addFlashAttribute("projetos", new ProjetoDAO().getProjetos(siape));
			redirectAttributes.addFlashAttribute("status", "finalizado");
			
			return "redirect:projetoExistente?siape="+siape;
		}else{
			redirectAttributes.addFlashAttribute("projeto", new ProjetoDAO().listaProjeto(numeroProjeto));
			redirectAttributes.addFlashAttribute("demandas", new ProjetoDAO().getDemandas(numeroProjeto));
			redirectAttributes.addFlashAttribute("status", "erro_removeProjeto");
			
			return "redirect:acessoProjetoExistente="+numeroProjeto;
		}
	}

	@RequestMapping("download")
	public void download (String numeroProjeto, String proponente, HttpServletResponse response) throws IOException, Exception{

		File arquivo = new File("/C:\\Users\\Jr\\workspace\\ProjetoPolitecnico\\src\\main\\resources\\projetos\\"
			 +numeroProjeto +" - " +proponente +".xlsx");
			
		if(!arquivo.exists() || arquivo.length() == 0){  // se o arquivo não existe ou vazio, cria
			Projeto projeto = new ProjetoDAO().projetoFinalizado(numeroProjeto);
			ArrayList<Demanda> itens = new ProjetoDAO().Itens(numeroProjeto);
			
			new CriaExcel().criar(projeto, itens);
		}

		String nome = numeroProjeto +" - " +proponente +".xlsx";
		int tamanho = (int) arquivo.length();

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"); // tipo do conteúdo
		response.setContentLength(tamanho); 
		response.setHeader("Content-Disposition", "attachment; filename=\"" + nome + "\"");

		OutputStream output = response.getOutputStream();
		Files.copy(arquivo.toPath(), output);
	}
	/*
	@RequestMapping(value="/download", method = RequestMethod.GET)
    public HttpEntity<byte[]> download(String numeroProjeto, String proponente) throws IOException {
    	
    	File arquivo = new File("/C:\\Users\\Jr\\workspace\\ProjetoPolitecnico\\src\\main\\resources\\projetos\\"
   			 +numeroProjeto +" - " +proponente +".xlsx");
    	
        int len = (int)arquivo.length();  
        byte[] fileByte = new byte[len];
        FileInputStream inFile  = null;
        
        try {
           inFile = new FileInputStream(arquivo);         
           inFile.read(fileByte, 0, len);  
        } catch (FileNotFoundException fnfex) {} 
    	
        String nome = numeroProjeto +" - " +proponente +".xlsx";
		int tamanho = (int) arquivo.length();

		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Content-Disposition", "attachment; filename=\""+nome+"\"");
		HttpEntity<byte[]> entity = new HttpEntity<byte[]>(fileByte, httpHeaders);
		
		return entity;
    }
    */
}
