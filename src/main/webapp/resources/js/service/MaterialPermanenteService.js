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
			},
			{
			  codigo: "4.4.90.52.12", nome: "Aparelhos e Utensílios Domesticos",
			  descricao: "Registra o valor das despesas com aquisição de eletrodomestico em geral e utensílio domesticos, com durabilidade superior a dois anos, utilizados em orgões público, tais como ",
			  exemplo: "Aparelhos de Copa e Cozinha - Aspirador de Pó - Batedeira - Botijão de Gás - Cafeteira Elétrica - Chuveiro ou Ducha Elétrica - Circulador de Ar - Conjunto de Chá/Café/Jantar - Escada Portátil - Encerradeira - Exaustor - " +
					"Faqueiro - Filtro de Água - Fogão - Forno de Microondas - Geladeira - Grill - Liquidificador - Máquina de Lavar Louça - Máquina de Lavar Roupa - Máquina de Moer Café - Máquina de Secar Pratos - Secador de Prato - " +
					"Tábua de Passar Roupa - Torneira Elétrica - Umidificador de Ar - Aparelhos de Ar Condicionados (tipo de embutir, portátil e split) e Outros ..."		
			},
			{
			  codigo: "4.4.90.52.14", nome: "Armamentos",
			  descricao: "Registra o valor das despesas com todas as armas de porte, portáteis e transportáveis, de tiro tenso. Todas as armas portáteis, transportáveis autopropulsionadas, de tipo curvo, centrais de tiro, rebocáveis ou " +
			  		"motorizadas, rampas lançadoras de foguetes motorizadas e outros apetrechos bélicos",
			  exemplo: "Fuzil - Metralhadora - Pistóla - Revólver e Outras ..."
			},
			{
			  codigo: "4.4.90.52.18", nome: "Coleções e Materiais Bibliográficos",
			  descricao: "Registra o valor das despesas com coleções bibliográficas de obras científicas, românticas, contos e documentários históricos e outros, mapotecas, dicionários, enciclopédias, periódicos encadernados, etc ",
			  exemplo: "Álbum de Caráter Educativo - Coleções e Materiais Bibliográficos Informatizados - Dicionários - Enciclopédia - Ficha Bibliográfica - Jornal e Revista (que constitua documentário) - Livro - Mapa - Material Folclórico " +
					"Partitura Musical - Publicações e Documentos Especializados - Repertório Legislativo e Outros ..."
			},
			{
			  codigo: "4.4.90.52.19", nome: "Discotecas e Filmotecas",
			  descricao: "Registra o valor das despesas com discos, CD e coleções de fitas gravadas com músicas e fitas cinematográficas de cárater educativo, científico e informativo. ", 
			  exemplo: "Disco Educativo - Fita de Áudio e Vídeo com Aula de Caráter Educativo, Microfilme e Outros ..."
			},
			{
			  codigo: "4.4.90.52.20", nome: "Embarcações",
			  descricao: "Registra o valor das despesas com todas as embarcações fluviais, lacustres ou marítimas exceto os navios graneleiros, petroleiros e transportadores de passageiros que são considerados como bens imóveis. ",
			  exemplo: "Canoa - Casa Flutuante - Chata - Lancha - Navio - Rebocador - Traineira e Outros ..."
			},
			{
			  codigo: "4.4.90.52.22", nome: "Equipamentos de Manobra e Patrulhamento",
			  descricao: "Registra o valor das despesas com todos os materiais permanentes utilizados em manobras militares e paramilitares, bem assim, aqueles utilizados em qualquer patrulhamento ostensivo. ", 
			  exemplo: "Barraca - Bloqueios - Cama de Campanha - Farol de Comunicação - Mesa de Campanha - Para-Quedas - Pistóla de Sinalização - Sirene de Campanha e Outros ..."
			},
			{
			  codigo: "4.4.90.52.24", nome: "Equipamento de Proteção, Segurança e Socorro",
			  descricao: "Registra o valor das despesas com todos os materiais permanentes utilizados na proteção e segurança de pessoas ou bens públicos, como também qualquer outro utilizado para socorro diverso, ou sobrevivência em qualquer ecossistema. ", 
			  exemplo: "Alarme - Algema - Arma para Vigilante - Barraca para uso não Militar - Bóia Salva-Vida - Cabine para Guarda (guarita) - Cofre - Extintor de Incêndio - Para-Raio - Sinalizador de Garagem - Porta Giratório - Circuito Interno de Televisão - " +
					"Catracas e Outros ..."
			},
			{
			  codigo: "4.4.90.52.26", nome: "Instrumentos Musicais e Artísticos",
			  descricao: "Registra o valor das despesas com todos os instrumentos de cordas, sopro ou percussão, como também outros instrumentos utilizados pelos artistas em geral ",
			  exemplo: "Clarinete - Guitarra - Pistão - Saxofone - Trombone - Xilofone e Outros ..."
			},
			{
			  codigo: "4.4.90.52.28", nome: "Máquinas e Equipamentos de Natureza Industrial",
			  descricao: "Registra o valor das despesas com qualquer máquina, aparelho ou equipamento empregado na fabricação de produto ou no recondicionamento de outros. ", 
			  exemplo: "Balcão Frigorífico - Betoneira - Exaustor Industrial - Forno e Torradeira Industrial - Geladeira Industrial - Máquina de Fabricação de Laticínios - Máquina de Fabricação de Tecidos e Outros ..."
			},
			{
			  codigo: "4.4.90.52.30", nome: "Máquinas e Equipamentos Energéticos",
			  descricao: "Registra o valor das despesas com máquinas, aparelhos e equipamentos não incorporáveis a instalações, destinados a geração de energia de qualquer espécie. ",
			  exemplo: "Alternador Energético - Carregador de Bateria - Chave Automática - Estabilizador - Gerador - Haste de Contato - Nó-Break - Poste de Iluminação - Retificador - Transformador de Voltagem - Trilho - Truck - Tunga - Turbina (hidrelétrica)" +
					"e Outros ..."
			},
			{
			  codigo: "4.4.90.52.32", nome: "Máquinas e Equipamentos Gráficos",
			  descricao: "Registra o valor das despesas com todas as máquina, aparelhos e equipamentos utilizados em reprografia ou artes gráficas. ", 
			  exemplo: "Aparelho para Encadernação - Copiadora - Cortadeira Elétrica - Costuradora de Papel - Duplicadora - Grampeadeira - Gravadora de Extenso - Guilhotina - Linotipo - Máquina de Off-Set - Operadora de Ilhoses - Picotadeira - Teleimpressora " +
					"e Receptadora de Páginas e Outros ..."
			},
			{
			  codigo: "4.4.90.52.33", nome: "Equipamentos para Áudio, Vídeo e Foto",
			  descricao: "Registra o valor das despesas com aquisição de equipamentos de filmagem, gravação e reprodução de sons e imagens, bem como os acessórios de durabilidade superior a dois anos. ",  
			  exemplo: "Amplificador de som - Caixa Acústica - Data Show - Eletróla - Equalizador de Som - Filmadora - Flash Eletrônico - Fone de Ouvido - Gravador de Som - Máquina Fotográfica - Microfilmadora - Microfone - Objetiva - Projetor - Rádio - Rebobinadora -" +
					"Retro-Projetor - Sintonizador de Som - Tanques para Revelação de Filmes - Tape-Deck - Televisor - Tela para Projeção - Toca-Discos - Vídeo-Cassete e Outros ..."
			},
			{
			  codigo: "4.4.90.52.34", nome: "Máquinas, Utensílios e Equipamentos Diversos",
			  descricao: "Registra o valor das despesas com todas as máquinas, aparelhos e equipamentos que não estejam enquadrados nos demais grupos específicos. ", 
			  exemplo: "Aparador de Grama - Bebedouro - Carrinho de Feira - Container - Furadeira - Maleta Executiva - Urna Eleitoral - Ventilador de Coluna e de Mesa e Outros ..."
			},
			{
			  codigo: "4.4.90.52.35", nome: "Equipamentos de Processamento de Dados",
			  descricao: "Registra o valor das despesas com todas as máquinas, aparelhos e equipamentos utilizados em processamento de dados de qualquer natureza, exceto quando for aquisição de peças destinadas a reposição diretamente ao equipamento ou mesmo para estoque. ",  
			  exemplo: "Caneca Óptica - Computador - Controladora de Linhas - Urna Eletrônica - Disco e Fita Magnética - Impressora - Kit Multimídia - Leitora - Micro e Minicomputadores - Mesa Digitalizadora - Modem - Monitor de Vídeo - Placas - Processador - Scanner " +
					"Teclado para Micro - Leitora/Toker - Leitora/Smartcard e Outros ..."
			},
			{
			  codigo: "4.4.90.52.36", nome: "Máquinas, Instalações e Utensílios de Escritório",
			  descricao: "Registra o valor das despesas com todas as máquinas, aparelho e utensílios utilizados em escritório e destinados ao auxílio do trabalho administrativo ", 
			  exemplo: "Aparelho Rotulador - Apontador Fixo (de mesa) - Caixa Registradora - Carimbo Digitador de Metal - Compasso - Estojo para Desenho - Globo Terrestre - Grampeador (exceto de mesa) - Máquina Autenticadora - Máquina de Calcular - Máquina de Contabilidade " +
					"Máquina de Escrever - Máquina Franqueadora - Normográfo - Pantográfo - Quebra-Luz (luminaria de mesa) - Régua de Precisão - Régua Protocolador - Régua T e Outros ..."
			},
			{
			  codigo: "4.4.90.52.38", nome: "Máquina, Ferramentas e Utensílios de Oficina",
			  descricao: "Registra o valor das despesas com todas as máquinas, ferramentas e utensílios utilizados em oficinas mecânicas, marcenaria, carpintaria e serralheria, não incluindo ferramentas que não façam parte de um conjunto, nem tão pouco materiais permanentes " +
			  		"utilizados em oficinas gráficas",
			  exemplo: "Analisador de Motores - Arcos de Serra - Bomba para Esgotamento de Tambores - Compressor de Ar - Conjunto de Oxigênio - Conjunto de Solda - Conjunto para Lubrificação - Desbastadeira - Desempenadeira - Elevador Hidráulico - Esmerilhadeira - " +
					"Extrator de Precisão - Forja - Fundidora para Confecção de Broca - Laminadora - Lavadora de Carro - Lixadeira - Macaco Mecânico e Hidráulico - Mandril - Marcador de Velocidade - Martelo Mecânico - Níveis de Aço ou Madeira - Pístola Metalizadora - " +
					"Polidora - Prensa - Rebitadora - Recipiente de Ferro para Combustíveis - Saca-Pino - Serra de Bancada - Serra Mecânica - Talhas - Tanques para Água - Tarracha - Testadora - Torno Mecânico - Vulcanizadora e Outros ..."
			},
			{
			  codigo: "4.4.90.52.39", nome: "Equipamentos e Utensílios Hidráulicos e Elétricos",
			  descricao: "Registra o valor das despesas com equipamentos destinados a instalações, conservações e manutenções de sistemas hidráulicos e elétricos. ",  
			  exemplo: "Bomba d'água - Bomba de Desentupimento - Bomba de Lubrificação - Bomba de Sucção e Elevação de Água e de Gasolina Carneiro Hidráulico - Desidratadora - Máquina de Tratamento de Água - Máquina de Tratamento de Esgoto - Máquina de Tratamento de Lixo " +
					"Moinho - Roda d'água e Outros ..."
			},
			{
			  codigo: "4.4.90.52.40", nome: "Máquinas e Equipamentos Agrícolas e Rodoviários",
			  descricao: "Registra o valor das despesas com todas as máquinas, tratores e equipamentos utilizados na agricultura, na construção e conservação de estradas. ",  
			  exemplo: "Arado - Carregadora - Ceifadeira - Compactador - Conjunto de Irrigação - Conjunto Moto-Bomba para Irrigação - Cultivador - Desintegrador - Escavadeira - Forno e Estufa de Secagem ou Amadurecimento - Máquina de Beneficiamento - Microtrator - Misturador de Ração" +
					"Moinho Agrícola - Motoniveladora - Moto-Serra - Pasteurizador - Picador de Forragens - Plaina Terraceadora - Plantadeira - Pulverizador de Tração Animal ou Mecânica - Rolo Compressor - Rocadeira - Semeadeira - Silo para Depósito de Cimento - Sulcador - " +
					"Trator de Roda e Esteira e Outros ..."
			},
			{
			  codigo: "4.4.90.52.42", nome: "Mobiliário em Geral",
			  descricao: "Registra o valor das despesas com móveis destinados ao uso ou decoração interior de ambientes. ",  
			  exemplo: "Abajur - Aparelho para Apoiar os Bracos - Ármario - Arquivo de Aço ou Madeira - Balcão (tipo atendimento) - Banco - Banqueta - Base para Mastro - Cadeira - Cama - Carrinho Fichario - Carteira e Banco Escolar - Charter Negro - Cinzeiro com Pedestal - Colchão - " +
					"Criado-Mudo - Cristaleira - Escrivaninha - Espelho Moldura - Estante de Madeira ou Aço - Estofado - Filipsharter - Guarda-Louça - Guarda-Roupa - Mapoteca - Mesa - Penteadeira - Poltrona - Porta-Chápeu - Prancheta para Desenho - Quadro de Chaves - Quadro Imantado - " +
					"Quadro para Editais e Avisos - Relógio de Mesa/Parede/Ponto - Roupeiro - Sofá - Suporte para TV e Vídeo - Suporte para Bandeira (mastro) - Vitrine e Outros ..."
			},
			{
			  codigo: "4.4.90.52.44", nome: "Obras de Arte e Peças para Exposição",
			  descricao: "Registra o valor das despesas com objetos de valor artístico e histórico destinados a decoração ou exposição em geral (em museus, galerias, hall, prédios público e outros). ",  
			  exemplo: "Alfaias de Louça - Documentos e Objetos Históricos - Esculturas - Fotos Históricas - Gravuras - Molduras - Peças em Marfin e Cerâmica - Pedestais Especiais e Similares - Pinacotecas Completas - Pinturas em Tela - Porcelana - Tapeçaria - " +
					"Trilhos para Exposição de Quadros e Outros ..."
			},
			{
			  codigo: "4.4.90.52.46", nome: "Semoventes e Equipamentos de Montaria",
			  descricao: "Registra o valor das despesas com animais para trabalho, produção, reprodução ou exposição e equipamentos de montaria. ",  
			  exemplo: "Animais não Destinados a Laboratórios ou Corte - Animais para Jardim Zoológico - Animais pra Produção, Reprodução e Guarda - Animais para Sela e Tração - Selas e Outros ..."
			},
			{
			  codigo: "4.4.90.52.48", nome: "Veículos Diversos",
			  descricao: "Registra o valor das despesas com veículos não contemplados em subitens específicos. ",  
			  exemplo: "Bicicletas - Carrinho de Mão - Carroça - Charrete - Empilhadeira e Outros ..."
			},
			{
			  codigo: "4.4.90.52.49", nome: "Equipamentos e Material Sigiloso e Reservado",
			  descricao: "Registra o valor das apropriações das despesas com equipaentos e material permantentes. ", 
			  exemplo: "Despesas de Caráter Sigiloso e Reservado."
			},
			{
			  codigo: "4.4.90.52.50", nome: "Veículos Ferroviários",
			  descricao: "Registra o valor das despesas com veículos empregados em estradas de ferro. ",  
			  exemplo: "Locomotiva - Prancha - Reboque - Tender - Vagão para Transporte de Carga ou Passageiros e Outros ..."
			},
			{
			  codigo: "4.4.90.52.51", nome: "Peças não Incorporáveis a Imóveis",
			  descricao: "Registra o valor das despesas com materiais empregados em imóveis e que possam ser removidos ou recuperados. ",  
			  exemplo: "Biombos - Carpetes (primeira instalação) - Cortinas - Divisorias Removivéis - Estrados - Persianas - Tapetes - Toldo - Grades - Mastro para Fixação de Antena de Rádio e Outros ..."
			},
			{
			  codigo: "4.4.90.52.52", nome: "Veículos de Tração Mecânica",
			  descricao: "Registra o valor das despesas com veículos de tração mecânica, tais como: ",  
			  exemplo: "Ambulância - Automóvel - Basculante - Cacamba - Caminhão - Carro-Forte - Consultório Volante - Furgão - Lambrete - Microônibus - Motocicleta - Ônibus - Rabeção - Vassoura Mecânica - Veículo Coletor de Lixo e Outros ... "
			},
			{
			  codigo: "4.4.90.52.54", nome: "Equipamentos, Peças e Acessórios Aeronáuticos",
			  descricao: "Registra o valor das despesas com equipamentos, peças e acessórios aeronáuticos, tais como: ",  
			  exemplo: "Hélice - Microcomputador de Bordo - Turbina e Outros ..."
			},
			{
			  codigo: "4.4.90.52.56", nome: "Equipamentos, Peças e Acessórios de Proteção ao Vôo",
			  descricao: "Registra o valor das despesas com equipamentos, peças e acessórios de proteção ao vôo, tais como: ",  
			  exemplo: "Radar - Rádio e Outros ..."
			},
			{
			  codigo: "4.4.90.52.57", nome: "Acessórios para Veículos",
			  descricao: "Registra o valor das despesas com acessórios para veículos que possam ser desincorporados, sem prejuízo dos mesmos, para aplicação em outros veículos, tais como: ",  
			  exemplo: "Ar Condicionado - Capota - Rádio/Toca-Fita e Outros ..."
			},
			{
			  codigo: "4.4.90.52.58", nome: "Equipamentos de Mergulho e Salvamento",
			  descricao: "Registra o valor das despesas com equipamentos destinados as atividades de mergulho e salvamento marítimo. ",  
			  exemplo: "Escafandro - Jet-Ski - Tanque de Oxigênio e Outros ..."
			},
			{
			  codigo: "4.4.90.52.60", nome: "Equipamentos, Peças e Acessórios Marítimos",
			  descricao: "Registra o valor das despesas com equipamentos, peças e acessórios marítimos, tais como: ",  
			  exemplo: "Instrumentos de Navegação - Instrumentos de Medição do Tempo - Instrumentos Óticos - Instrumentos Geográficos e Astronômicos - Instrumentos e Aparelhos Meteorológicos e Outros ..."
			},
			{
			  codigo: "4.4.90.52.83", nome: "Equipamentos e Sistema de Proteção e Vigilência Ambiental",
			  descricao: "Registra o valor das despesas com equipamentos e sistema de proteção e vigilância ambiental. ",  
			  exemplo: ""
			},
			{
			  codigo: "4.4.90.52.87", nome: "Material de Consumo de Uso Duradouro",
			  descricao: "Registra o valor das apropriações das despesas com materiais de consumo controlados como de uso duradouro. ",  
			  exemplo: ""
			}
		];
	};
});