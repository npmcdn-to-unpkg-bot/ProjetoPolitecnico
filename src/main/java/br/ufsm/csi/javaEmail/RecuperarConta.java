package br.ufsm.csi.javaEmail;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import br.ufsm.csi.model.Usuario;

public class RecuperarConta {

	public void sendEmail(Usuario usuario) throws EmailException {
		
		SimpleEmail email = new SimpleEmail();
		
		email.setHostName("smtp.gmail.com");
		email.setSmtpPort(465);
		
		// Destinatário
		email.addTo(usuario.getEmail(), usuario.getNome());
		// O email do qual enviará
		email.setFrom("solicitacaodedamandas@gmail.com", "Solicitação de Demandas em Projetos");
		// Assunto
		email.setSubject("Recuperar Senha");
		// Mensagem
		email.setMsg(
				"Olá " +usuario.getNome() +"\n\n"
			  + "Sua senha é: " +usuario.getSenha() +"\n\n"
		);

		email.setSSL(true);
		// Autenticar Email
		email.setAuthentication("solicitacaodedamandas@gmail.com", "politecnicoufsm");
		
		email.send();
		
	}

}
