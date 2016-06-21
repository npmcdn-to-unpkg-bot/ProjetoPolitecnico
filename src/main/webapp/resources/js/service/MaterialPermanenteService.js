angular.module("form").service("MaterialPermanenteAPI", function () {
	this.getMaterialPermanente = function () {
		return [
			{
		      codigo: "4.4.90.52.02", nome: "Aeronaves",
		      descricao: "Registra o valor das despesas com qualquer tipo de aeronave de asa fixa ou asa rotativa.",
		      exemplo: "Avião - Balão - Helicoptero - Planador - Utra-Leve e Outros ..."
		    },
		    {
			  codigo: "4.4.90.52.04", nome: "Aparelhos de Medição e Orientação",
			  descricao: "Registra o valor das despesas com todos os aparelhos de medição ou contagem. Quando estes aparelhos forem incorporados a um equipamento maior " +
			  		"serão os mesmos considerados componentes.",
			  exemplo: "Amperimetro - Aparelho de Medição Meteorologica - Balanças em Geral - Bussola - Calibrador de Pneus - Condutivimetro - Cronometro - Espectrofotometro - " +
			  		"Hidrometro - Magnetometro - Nanometro - Medidor de Gás - Mira Falante - Níveis Topográficos - Osciloscopio - Paquimetro - Pirometro - Planimetro - Psicrometro - " +
			  		"Relógio Medidor de Luz - Sonar - Sonda - Taquimetro - Telemetro - Teodolito Turbimetro - Navegador GPS e Outros ..."
			},
			{
			  codigo: "4.4.90.52.06", nome: "Aparelhos e Equipamentos de Comunicação",
			  descricao: "Registra o valor das despesas com todo material considerado permanente, portatil ou transportavel, de uso em comunicações que não se incorporem em instalações, " +
			  		"veículo de qualquer espécie, aeronaves ou embarcações. ",
			  exemplo: "Antena Parabólica - Aparelho de Telefonia - Bloqueador Telefonico - Central Telefonica - Detector de Chamadas Telefonicas - Fax Simile - Fonográfo - Interfone - PABX - " +
			  		"Rádio Receptor - Rádio Telegrafia - Rádio Telex - Rádio Transmissor - Secretaria Eletrônica - Tele Speaker e Outros ..."
			},
		    {
			  codigo: "4.4.90.52.08", nome: "Aparelhos e Equipametos de Utensílios Medicos, Odontológicos, Laboratoriais e Hospitalares",
			  descricao: "Registra o valor das despesas com qualquer aparelho, utensílio ou equipamento de uso médico, odontológico, laboratorial e hospitalar que não se integrem a instalações " +
			  		"ou a outros conjuntos monitores no caso de fazerem parte de instalações ou outros conjuntos deverão ser considerados componentes.",
			  exemplo: "Afastador - Alargador - Aparelho de Esterilização - Aparelho de Raio X - Aparelho de Transfusão de Sangue - Aparelho Infravermelho - Aparelho para Inalação - Aparelho de Ultravioleta - " +
			  		"Balança Pediatrica - Berço Aquecido - Biombo - Botição - Cadeira de Dentista - Cadeira de Rodas - Camara de Infravermelho - Camara de Oxigênio - Camara de Radioterapia - Carro Maca - Centrifugador - " +
			  		"Destilador - Eletro Analisador - Eletro Cardiografico - Estetoscopio - Estufa - Maca - Medidor de Pressão Arterial (Esfignomanometro) - Megatoscópio - Mesa para Exames Clínicos - Microscópio - " +
			  		"Tenda de Oxigênio - Termocauterio e Outros ..."
	        },
		    {
			  codigo: "4.4.90.52.10", nome: "Aparelhos e Equipamentos p/ Esportes Diversões",
			  descricao: "Registra o valor das despesas com instrumentos, aparelhos e utensílios destinados a qualquer modalidade de esportes e diversões de qualquer natureza, desde que não integrados a instalações de ginásios " +
			  		"de esportes, centros esportivos, teatro, cinema, etc.",
			  exemplo: "Arco - Baliza - Barco de Regata - Barra - Bastão - Bicicleta Ergometrica - Carneiro de Madeira - Carrosel - Cavalo - Dardo - Deslizador - Disco - Halteres - Martelo - Peso - Placar - Remo - Vara de Salto e Outros ..."
			}
		];
	};
});