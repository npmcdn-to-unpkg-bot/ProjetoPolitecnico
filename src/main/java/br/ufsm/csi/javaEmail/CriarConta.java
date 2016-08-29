package br.ufsm.csi.javaEmail;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.ufsm.csi.model.Usuario;

public class CriarConta {
	
	public void sendEmail(Usuario usuario, int codigo) throws EmailException {
		
		SimpleEmail email = new SimpleEmail();
		
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(465);
		
		// Destinatário
		email.addTo(usuario.getEmail(), usuario.getNome());
		// O email do qual enviará
		email.setFrom("solicitacaodedamandas@gmail.com", "Solicitação de Demandas em Projetos");
		// Assunto
		email.setSubject("Autenticar Cadastro");
		// Mensagem
		email.setMsg(
				"Olá " +usuario.getNome() +"\n\n"
			  + "Este é seu código de autenticação: " +codigo +"\n\n"
		);

		email.setSSL(true);
		// Autenticar Email
		email.setAuthentication("solicitacaodedamandas@gmail.com", "politecnicoufsm");
		
		email.send();
	}
}
