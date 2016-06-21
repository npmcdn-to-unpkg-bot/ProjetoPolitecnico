angular.module("form").service("MaterialConsumoAPI", function () {
	this.getMaterialConsumo = function () {
		return [
			{ codigo: "3.3.90.30.01", nome: "Combustiveis e Lubrif. Automotivos", 
			  descricao: "Registra o valor das despesas com combustíveis para motores a combustão interna de veiculos rodoviários, " +
		      		"tratores em geral, embarcações diversas e grupos geradores estacionados ou transportáveis e todos os óleos " +
		      		"lubrificantes destinados aos sistemas hidráulicos, hidromáticos, de caixa de transmissão de força e graxas " +
		      		"grafitadas para altas e baixas temperatudas.",
		      exemplo: "Aditivos - Álcool Hidratado - Fluído para Amortecedor - Fluído para Transmissão Hidráulica - " +
		      		"Gasolina - Graxas - Óleo Diesel - Óleo para Carter - Óleo para Freio Hidráulico e Outros ..."
		    },
		    { codigo: "3.3.90.30.02", nome: "Combustiveis e Lubrif. de Aviação", 
		      descricao: "Registra o valor das despesas com combustíveis e lubrificantes destinados a qualquer tipo de aeronave.",
		      exemplo: "Aditivos - Gasolina - Graxas - Óleos e Fluídos em Geral - Querosene e Outros ..."
		    },
		    { codigo: "3.3.90.30.03", nome: "Combustiveis e Lubrif. p/ outras finalidades", 
		      descricao: "Registra o valor das despesas com combustíveis e lubrificantes para outras finalidades que não se enquadram " +
		      		"em itens anteriores.",
		      exemplo: "Carbureto - Carvão Mineral - Carvão Vegetal - Lenha - Querosene Comum - Combustíveis e Lubrificantes de uso Ferroviarios " +
		      		"e Outros ..."
		    },
		    { codigo: "3.3.90.30.04", nome: "Gás e outros Materiais Engarrafados", 
		      descricao: "Registra o valor das despesas com gás de uso industrial, de tratamento de água, de iluminação, de uso médico, bem como " +
		      		"gases nobres para uso em laboratórios científicos.",
		      exemplo: "Acetileno - Carbonico Freon - Hélio - Hidrogênio - Liquefeito de Petróleo - Nitrogênio - Oxigênio e Outros ..." +
		      		" Registra ainda o valor das despesas com gás, pó químico, água, pressurizada e outros materiais utilizados na recarga de extintores " +
		      		"de incendio."
		    },
		    { codigo: "3.3.90.30.05", nome: "Explosivos e Munições",
		      descricao: "Registra o valor das despesas com as cargas de projeção utilizadas em peças de artilharia, mísseis guiados e não guiados, " +
		      		"capsulas ou estojos para recarga e explosivos de uso militar e paramilitar.",
		      exemplo: "Balas e Similares - Estopim - Explosivos, Tais como: Artefatos Explosivos - Artigos Pirotécnicos - Capsulas de Detonação - Dinamite - " +
		      		"Espoleta - Fogos de Artificio - Granada - Pólvora e Outros ..."
		    },
	
		    { codigo: "3.3.90.30.06", nome: "Alimentos para Animais",
			  descricao: "Registra o valor das despesas com alimentos destinados a gado bovino, equino, muar e bufalino, caprinos, suínos, ovínos, aves de qualquer " +
				    "espécie, como também para animais silvestres em cativeiro (jardins zoológicos ou laboratórios) e outros.",
			  exemplo: "Alfafa - Alpiste - Capim Verde - Farelo - Farinhas em Geral - Fuba Grosso - Milho em Grão - Racão Balanceada - Sal Mineral - Suprimento Vitaminicos e Outros ..."
			},
		    { codigo: "3.3.90.30.07", nome: "Generos de Alimentação",
			  descricao: "Registra o valor da despesas com generos de alimentação natural, beneficiados ou conservados.",
			  exemplo: "Açucar - Adoçante - Água Mineral - Bebidas - Café - Carnes em Geral - Cereais - Chás - Condimentos - Frutas - Gelo - Legumes - Refrigerantes - " +
				    "Sucos - Temperos - Verduras e Outros ..."
			},
		    { codigo: "3.3.90.30.08", nome: "Animais para Pesquisa e Abate",
			  descricao: "Registra o valor das despesas com animais para pesquisa e abate. Incluem-se nesta classificação os peixes e mariscos, todas as espécies " +
				    "de mamíferos, abelhas para estudos, pesquisa e produção de mel, bem assim qualquer outro animal destinado a estudo genético ou alimentação.",
			  exemplo: "Boi - Cabrito - Cobaias em Geral - Macaco - Rato - Rã e Outros ..."
			},
		    { codigo: "3.3.90.30.09", nome: "Material Farmacológico",
			  descricao: "Registra o valor das despesas com medicamentos ou componentes destinados a manipulação de drogas medicamentosas.",
			  exemplo: "Medicamentos - Soro - Vacinas e Outros ..."
			},
		    { codigo: "3.3.90.30.10", nome: "Material Odontológico",
			  descricao: "Registra o valor das despesas com materiais utilizados com pacientes na área odontológica, bem como os utilizados indiretamente pelos protéticos na " +
				    "confecção de proteses diversas.",
			  exemplo: "Agulhas - Amalgama - Anestésicos - Broca - Cimento Odontológico - Espatula Odontológica - Filmes para Raio X - Platina - Seringas - Sugador e Outros ..."
			},
		    { codigo: "3.3.90.30.11", nome: "Material Químico",
			  descricao: "Registra o valor das despesas com todos os elementos ou compostos químicos destinados ao fabrico de produtos químicos, análises laboratóriais, bem como " +
				    "aqueles destinados ao combate de pragas ou epizootias.",
			  exemplo: "Ácidos - Inseticidas - Produtos Químicos para tratamento de Água - Reagentes Químicos - Sais - Solventes - Substancias utilizadas para combater Insetos - " +
				    "Fungos e Bactérias e Outros ..."
			},
		    { codigo: "3.3.90.30.12", nome: "Material de Condelaria ou de uso Zootécnico",
			  descricao: "Registra o valor das despesas com materiais utilizados no arreamento de animais destinados a montaria, com exceção da sela, como também aqueles destinados " +
				    "ao adestramento de cães de guarda, ou outro animal domestico.",
			  exemplo: "Argolas de Metal - Arreamento - Barrigueiras - Bridões - Cabrestos - Cinchas - Cravos - Escovas para Animais - Estribos - Ferraduras - Mantas de Pano - " +
				    "Material para Apicultura - Material de Ferragem e Contenção de Animal - Peitorais - Raspadeiras e Outros ..."
			},
		    { codigo: "3.3.90.30.13", nome: "Material de Caça e Pesca",
		      descricao: "Registra o valor das despesas com materiais utilizados na caça e pesca de animais.",
			  exemplo: "Anzóis - Cordoalhas para Redes Chumbadas - Iscas - Linhas de Nylon - Máscaras para Visão Submarina - Molinetes - Nadadeiras de Borracha - Redes - " +
				    "Roupas e acessórios para Mergulho - Varas e Outros ..."
			},
		    { codigo: "3.3.90.30.14", nome: "Material Educativo e Esportivo",
			  descricao: "Registra o valor das despesas com materiais utilizados ou consumido diretamente nas atividades educativas e esportivas de crianças e adultos.",
			  exemplo: "Apitos - Bolas - Bones - Botas Especiais - Brinquedos Educativos - Calções - Camisas de Malha - Chuteiras - Cordas - Esteiras - Joelheiras - Luvas - " +
				    "Material Pedagógicos - Meias - Óculos para Motociclistas - Patins - Quimónos - Raquetes - Redes para Práticas de Esportes - Tênis e Sapatilhas - Tornozeleiras - " +
				    "Touca para Natação - Cartilhas Informativas e Outros ..."
			},
		    { codigo: "3.3.90.30.15", nome: "Material p/ Festividades e Homenagens",
			  descricao: "Registra o valor das despesas com materiais de consumo utilizados em festividades e homenagens, incluindo artigos para decoração e buffet.",
			  exemplo: "Arranjos e Coroas de Flores - Bebidas - Doces - Salgados - Placas Comemorativas (Exceto as placas para distribuição gratuíta) e Outros ..."
			},
		    { codigo: "3.3.90.30.16", nome: "Material de Expediente",
			  descricao: "Registra o valor das despesas com os materiais utilizados diretamente nos trabalhos administrativos, nos escritórios públicos, centros de estudos e pesquisa, " +
				    "escolas, universidades, etc.",
			  exemplo: "Agenda - Alfinete de Aço - Almofada p/ Carimbos - Apagador - Apontador de Lápis - Arquivo p/ Disquete - Bandeja para Papeis - Bloco p/ Rascunho - " +
				    "Bobina Papel p/ Calculadoras - Borrachas - Caderno - Caneta - Capa e Processo - Carimbos em Geral - Cartolina - Classificador - Clipe - Cola - Colchete - Corretivo - " +
				    "Envelope - Espatula - Estencil - Estilete - Extrator de Grampos - Guia p/ Arquivo - Guia de Endereçamento Postal - Impressos Eformulário em Geral - Intercalador p/ Fichario - " +
				    "Lacre - Lápis - Lapiseira - Limpa Tipos - Livros de Ata, de Ponto e de Protocólo - Papeis - Pastas em Geral - Percevejo - Perfurador - Pinça - Placas de Acrílico - Plástivo - " +
				    "Porta Lápis - Registrador - Régua - Selos p/ Correspondencia - Tesoura - Tintas - Toner - Transparencias - Etiquetas e Outros ..."
			},
			{ codigo: "3.3.90.30.17", nome: "Material de Processamento de Dados",
		      descricao: "Registra o valor das despesas com suprimentos de TI, Inclusive peças para repisoção.",
			  exemplo: "Cartuchos de Tinta - Capas Plástivas Protetoras para Micro e Impressoras - CD-ROM Virgem - Pen Drives/SmartCard - Mouse e Teclado (Reposição) - " +
					"MousePad - Peças e Acessórios para Computadores e Periféricos - Recargas de Cartuchos e Tinta - Toner para Impressoras a Laser - Cartões Magnéticos e Outros ..."
			},
			{ codigo: "3.3.90.30.18", nome: "Materiais e Medicamentos p/ uso Veterinário",
		      descricao: "Registra o valor das despesas com materiais e medicamentos para uso veterinario.",
			  exemplo: "Vacinas - Medicamentos"
			},
			{ codigo: "3.3.90.30.19", nome: "Material de Acondicionamento e Embalagem",
		      descricao: "Registra o valor das despesas com materiais aplicados diretamente nas preservações, acomodações ou embalagens de qualquer produto.",
			  exemplo: "Arame - Barbante - Caixas Plásticas, de Madeiras, Papelão e Isopor - Cordas - Engradados - Fitas de Aço ou Metálicas - Fitas Gomadoras - Garrafas e Potes - " +
					 "Linha - Papel de Embrulho - Papelão - Sacolas - Sacos e Outros ..."
			},
			{ codigo: "3.3.90.30.20", nome: "Material de Cama, Mesa e Banho",
			  descricao: "Registra o valor das despesas com materiais utilizados em dormitórios coletivos, residenciais, hotéis, restaurantes, etc.",
			  exemplo: "Cobertores - Colchas - Colchonetes - Fronhas - Guardanapos - Lençóis - Toalhas - Travesseiros e Outros ..."
			},
			{ codigo: "3.3.90.30.21", nome: "Material de Copa e Cozinha",
		      descricao: "Registra o valor das despesas com materiais utilizados em refeitórios de qualquer tipo, cozinhas residencias, hotéis, hospitais, escolas, universidades, fabricas, etc.",
			  exemplo: "Abridor de Garrafa - Açucareiros - Artigos de Vidro e Plásticos - Bandejas - Coadores - Colheres - Copos - Ebulidores - Facas - Farinheiros - Fósforos - " +
					 "Frigideiras - Garfos - Garrafas Térmicas - Paliteiros - Panelas - Panos de Cozinha - Papel Alumínio - Pratos - Recipientes para Àgua - Suportes de Copos p/ Cafezinho - " +
					 "Tigelas - Velas - Xícaras e Outros ..."
			},
			{ codigo: "3.3.90.30.22", nome: "Material de Limpeza e Prod. de Higienização",
			  descricao: "Registra o valor das despesas com materiais destinados a higienação pessoal, ambientes de trabalho, hospitais, etc.",
			  exemplo: "Álcool Etílico - Anticorosivo - Aparelho de Barbear Descartavel - Balde Plástico - Bomba p/ Inseticida - Capacho - Cera - Cesto p/ Lixo - Creme Dental - Desinfetante - " +
					 "Desodorizante - Detergente - Escova de Dentes - Escova p/ Roupas e Sapatos - Espanador - Esponja - Estopa - Flanela - Inseticida - Lustra Móveis - Mangueira - Naftalina - " +
					 "Pá p/ Lixo - Palha de Aço - Panos p/ Limpeza - Papel Higiênico - Pasta p/ Limpeza de utensílios - Porta Sabão - Removedor - Rodo - Sabão - Sabonete - Saco p/ Lixo - Saponaceo - " +
					 "Soda Cáustica - Toalha de Papel - Vassoura e Outros ..."
			},
			{ codigo: "3.3.90.30.23", nome: "Uniformes, Tecidos e Aviamentos",
			  descricao: "Registra o valor das despesas com uniformes ou qualquer tecido, material sintético que se destine a confecção de roupas com linhas de qualquer espécie destinadas a costuras " +
					 "e outros materiais de consumo empregados direta ou indiretamente na confecção de roupas.",
			  exemplo: "Agasalhos - Artigos de Costura - Aventais - Blusas - Botões - Cadarços - Calçados - Calças - Camisas - Capas - Chápeus - Cintos - Elásticos - Gravatas - Guarda pós - Linhas - " +
					 "Macações - Meias - Tecidos em Geral - Uniformes Militares ou de uso Cívil - Ziperes e Outros ..."
			},
			{ codigo: "3.3.90.30.24", nome: "Material p/ Manut. de Bens Imóveis/Instalações",
			  descricao: "Registra o valor das despesas com materiais de consumo para aplicação, manutenção e reposição de qualquer bem público.",
			  exemplo: "Amianto - Aparelhos Sanitários - Arames Liso e Farpado - Areia - Basculante - Boca de Lobo - Bóia - Brita - Brocha - Cabo Metálico - Cal - Cano - Cerâmica - Cimento - Cola - " +
					 "Condutores de Fios - Conexões - Curvas - Esquadrias - Fechaduras - Ferro - Gaxetas - Grades - Impermeabilizantes - Isolantes Acústicos e Térmicos - Janelas - Joelhos - Ladrilhos - " +
					 "Lavatórios - Lixas - Madeira - Marcos de Concreto - Massa Corrida - Niple - Papel de Parede - Parafusos - Pias - Pigmentos - Portas e Portais - Pregos - Rolos Solventes - Sifão - Tacos - " +
					 "Tampa p/ Vaso - Tampão de Ferro - Tanque - Tela de Estuque - Telha - Tijolo - Tinta - Torneira - Trincha - Tubo de Concreto - Válvulas - Verniz - Vidro - Aquecedores a Gás e Outros ..."
			},
			{ codigo: "3.3.90.30.25", nome: "Material p/ Manutenção de Bens Móveis",
			  descricao: "Registra o valor das despesas com componentes, peças, acessórios e sobressalentes para aplicação, manutenção e reposição de bens móveis em geral.",
			  exemplo: "Cabos - Cilindros p/ Máquinas Copiadoras - Compressor p/ Ar Condicionado - Esferar p/ Máquinas Datilográfica - Mangueira p/ Fogão - Margaridas - Peças de Reposição de Aparelhos e Máquinas em Geral - " +
					 "Materiais de Reposição para Instrumentos Músicais e Outros ..."
			},
			{ codigo: "3.3.90.30.26", nome: "Material Elétrico e Eletrônico",
			  descricao: "Registra o valor das despesas com materiais de consumo para aplicação, manutenção e reposição dos sistemas, aparelhos e equipamentos elétricos e eletrônicos.",
			  exemplo: "Benjamins - Bocais - Calhas - Capacitores e Resistores - Chaves de Ligação - Circuitos Eletrônicos - Condutores - Componentes de Aparelho Eletrônico - Diodos - Disjuntores - Eletrodos - " +
					 "Eliminador de Pilhas - Espelhos para Interruptores - Fios e Cabos - Fita Isolante - Fusíveis - Interruptores - Lampadas e Luminárias - Pilhas e Baterias - Pinos e Plugs - Placas de Baquelite - Reatores - " +
					 "Receptores - Resistencias - Starts - Suportes - Tomada de Corrente e Outros ..."
			},
			{ codigo: "3.3.90.30.27", nome: "Material de Manobra e Patrulhamento",
		      descricao: "Registra o valor das despesas com material de consumo utilizados em campanha militar ou paramilitar, em manobras de tropas, treinamento ou em ação e patrulhamento ostensivo e rodoviário, " +
					 "campanha de saúde pública, etc.",
			  exemplo: "Binóculo - Carta Naútica - Cantil - Cordas - Flámulas e Bandeiras de Sinalizaçao - Lanternas - Medicamentos de Pronto-Socorro - Mochilas - Piquetes - Sacolas - Sacos de Dormir - Sinaleiros e Outros ..."
			},
			{ codigo: "3.3.90.30.28", nome: "Material de Proteção e Segurança",
		      descricao: "Registra o valor das despesas com materiais de consumo utilizados diretamente na proteção de pessoas ou bens públicos, para socorro de pessoas e animais ou para socorros de veículos, aeronaves e " +
					 "embarcaçoes, assim como qualquer outro item aplicado diretamente nas atividades de sobrevivencia de pessoas na selva, mar ou em sinistros diversos.",
			  exemplo: "Botas - Cadeados - Calçados Especiais - Capacetes - Chaves - Cintos - Coletes - Dedais - Guarda Chuvas - Lona - Luvas - Mangueira de Lona - Mascaras - Óculos - Cabina de Papelão e Outros ..."
			},
			{ codigo: "3.3.90.30.29", nome: "Material p/ Áudio, Vídeo e Foto",
			  descricao: "Registra o valor das despesas com materias de consumo de emprego direto em filmagem e revelação, ampliações e reproduções de sons e imagens.",
		      exemplo: "Aetze especial p/ Chapa de Papel - Albuns p/ Retratos - Alto Falantes - Antenas - Artigos para Gravação em Acetato - Filmes Virgens - Fitas Virgens de Áudio e Vídeo - Lampadas Especiais - " +
				    "Material p/ Radiografia, Microfilmagem e Cinematografia - Molduras - Papel p/ Revelação de Fotográfias - Pegadores - Reveladores e Outros ..."
			},
			{ codigo: "3.3.90.30.30", nome: "Material para Comunicações",
			  descricao: "Registra valor das despesas para materiais utilizados em comunicações assim como os componentens, circuitos impressos ou integrados, peças ou acessórios de reposição, chips e partes " +
					"de equipamentos de comunicação e materiais para instalações.",
			  exemplo: "Radiofonicas - Radiotelegráficas - Telegráfias e Outros ..."
		    },
			{ codigo: "3.3.90.30.31", nome: "Sementes, Mudas de Plantas e Insumos",
		      descricao: "Registra o valor das despesas com qualquer tipo de semente destinada ao plantio e mudas de plantas frutiferas ou ornamentais, assim como todos os insumos utilizados para fertilização.",
			  exemplo: "Adubos - Argila - Plantas Ornamentais - Borbulhas - Bulbos - Enxertos - Fertilizantes - Mudas Envasadas ou com Raízes Nuas - Semestes - Terra - Tubérculos - Xaxim e Outros ..."
			},
			{ codigo: "3.3.90.30.32", nome: "Suprimento de Aviação",
		      descricao: "Registra o valor das despesas com aquisição de materia empregados na manutenção e reparo de aeronaves.",
			  exemplo: "Acessórios - Peças de Reposição de Aeronaves - Sobressalentes e Outros ..."
			},
			{ codigo: "3.3.90.30.33", nome: "Material de Produção Industrial",
			  descricao: "Registra o valor das despesas com materias primas utilizadas na transformação, beneficiamento e industrialização de um produto final.",
			  exemplo: "Borracha - Couro - Materia Prima em Geral - Minérios e Outros ..."
			},
			{ codigo: "3.3.90.30.34", nome: "Sobressal. Maq. e Motores, Návios e Embarcações",
			  descricao: "Registra o valor das despesas com a aquisição de material utilizado na manutenção e reparo de máquinas e motores de návios , inclusive de esquadra e de embarcaçõs em geral.",
			  exemplo: "Máquinas - Motores - Návios e Embarcações em Geral e Outros ..."
			},
			{ codigo: "3.3.90.30.35", nome: "Material Laboratorial",
			  descricao: "Registra o valor das despesas com todos os utensílios usados em análises laboratoriais.",
			  exemplo: "Almofarizes - Bastões - Bico de Gás - Cálices - Corantes - Filtros de Papel - Fixadoras - Frascos - Funis - Garra Metalica - Lâminas de Vidro p/ Microscópio - Lâmpadas Especiais - " +
				    "Luvas de Borracha - Metais e Matalóides p/ Termômetro - Tubo de Ensaio - Material de Laboratório Didático e Outros ..."
			},
			{ codigo: "3.3.90.30.36", nome: "Material Hospitalar",
			  descricao: "Registra o valor das despesas com todos os materiais de consumo utilizados na área hospitalar ou ambulatorial.",
			  exemplo: "Agulhas Hipodermicas - Algodão - Canulas - Cateteres - Compressa de Gaze - Drenos - Esparadrapo - Fios Cirurgicos - Lâminas p/ Bisturi - Luvas - Seringas - Termômetro Clínico e Outros ..."
			},
			{ codigo: "3.3.90.30.37", nome: "Sobressalentes de Armamento",
			  descricao: "Registra o valor das despesas com aquisição de material utilizado na manutenção e reparo de armamento.",
			  exemplo: "Material de Manutenção e Armamento - Peças de Reposição e Outros ..."
			},
			{ codigo: "3.3.90.30.38", nome: "Suprimento de Proteção ao Voô",
			  descricao: "Registrar valor das despesas com peças de reposição de radares e sistemas de comunicação.",
			  exemplo: "Suprimentos - Peças de Reposição e Manutenção e Outros ..."
			},
			{ codigo: "3.3.90.30.39", nome: "Material p/ Manutençãode Veículos",
			  descricao: "Registra o valor das despesas com materiais para aplicação e manutenção de veículos rodoviarios, viaturas blindadas e tratores em geral.",
		      exemplo: "Água Destilada - Amortecedores - Baterias - Borrachas - Buzina - Cabos de Acelerador - Cabos de Embreagem - Camara de Ar - Carburador Completo - Cifa - Colar de Embreagem - " +
				    "Condensador e Platinado - Correias - Disco de Embreagem - Ignição - Junta Homocinética - Lampadas e Lantenas p/ Veículos - Lonas e Pastilhas de Freio - Mangueiras - Material utilizado em Lanternagem e Pintura - " +
				    "Motor de Reposição - Para Brisa - Para Choque - Plato - Pneus - Reparos - Retentores - Retrovisores - Rolamentos - Tapetes - Válvulas da Marcha Lenta e Termostática - Velas e Outros ..."
			},
			{ codigo: "3.3.90.30.40", nome: "Material Biológico",
			  descricao: "Registra o valor das despesas com amostras e outros itens de materiais biológicos utilizados em estudos e pesquisas científicas em seres vivos e inseminação artifícial.",
			  exemplo: "Meios de Cultura - Semen e Outros ..."
			},
			{ codigo: "3.3.90.30.41", nome: "Material p/ Utilização em Gráfica",
			  descricao: "Registra o valor das despesas com todos os materiais de consumo de uso gráfico.",
			  exemplo: "Chapas de Off-set - Cliches - Cola - Espirais - Fotólitos - Logotipos - Papel - Solventes - Tinta - Tipos e Outros ..."
			},
			{ codigo: "3.3.90.30.42", nome: "Ferramentas",
			  descricao: "Registra o valor das despesas com todos os tipo de ferramentas utilizadas em oficínas, carpintarias, jardins, etc.",
			  exemplo: "Alicate - Broca - Caixa p/ Ferramentas - Canivete - Chaves em Geral - Enxadas - Espatulas - Ferro de Solda - Foice - Lâmina de Serra - Lima - Machado - Martelo - Pá - Picareta - " +
					"Ponteira - Prumo - Serrote - Tesoura de Podar - Trena e Outros ..."
			},
			{ codigo: "3.3.90.30.43", nome: "Material p/ Reabilitação Profissional",
			  descricao: "Registra o valor das despesas com materiais utilizados em programas de reabilitação profissional.",
			  exemplo: "Bastões - Bengalas - Joelheiras - Meias Elásticas e Assemelhados - Óculos - Orteses - Pesos - Proteses - Instrumentos de Trabalho e Implmentos Profissionais e Outros ..."
			},
			{ codigo: "3.3.90.30.44", nome: "Material de Sinalização Visual e Outros",
			  descricao: "Registra o valor das despesas com materiais utilizados para identificação, sinalização visual, endereçamento e outros.",
			  exemplo: "Placas de Sinalização em Geral - Placas Indicativas para o Setor e Seções - Placas para Veículos - Plaquetas para Tombamento de Material - Placas Sinalizadoras de Transito - " +
		 			"Cones Sinalizadores de Transito - Crachas - Botons Identificadores para Servidores e Outros ..."
			},  
			{ codigo: "3.3.90.30.45", nome: "Material Técnico p/ Seleção e Treinamento",
			  descricao: "Registra o valor das apropriações das despesas com materiais técnicos utilizados em processos de seleção e treinamento pela própia unidade gestora ou para distribuição não gratuíta.",
			  exemplo: "Apostilas e Similares - Folhetos de Orientação - Livros - Manuais Explicativos para Candidatos e Outros ..."
			},
			{ codigo: "3.3.90.30.46", nome: "Material Bibliográfico",
			  descricao: "Registra o valor das despesas com material bibliográfico. ",
			  exemplo: "Jornais - Revistras - Periódicos em Geral - Anuários Médicos - Anuário Estático - Livros em Geral e Outros, podendo estar na forma de CD-ROM e os materiais bibliográficos para públicas, " +
					"conforme manual SIAFI CODIGO 02.11.35."
			},
			{ codigo: "3.3.90.30.48", nome: "Bens Móveis e não Ativáveis",
			  descricao: "Registra o valor das despesas com aquisição de bens móveis de natureza permanente não ativáveis, ou seja, aqueles considerados como despesa operacional para fins de " +
					"dedução de imposto de renda, desde que atenda as especificações contidas no artigo 301 do RIR (Regulamento de Imposto de Renda). Esta conta é utilizada exclusivamente " +
					"pelas unidades regidas pela Lei 6404/76.",
			  exemplo: "Bens móveis de natureza permanente não ativáveis."
			},
			{ codigo: "3.3.90.30.49", nome: "Bilhetes de Passagens",
			  descricao: "Registra o valor das despesas com aquisição de bilhetes de passagens para guardar em estoque.",
			  exemplo: "Bilhetes de Passagens em Geral."
			},
			{ codigo: "3.3.90.30.50", nome: "Bandeiras, Flamulas e Insignas",
			  descricao: "Registra valor das despesas com aquisição de bandeiras, flamulas e insignas.",
			  exemplo: "Brasões, Escudos, Armas da República, Selo Nacional e Outros ..."
			},
			{ codigo: "3.3.90.30.51", nome: "Discotecas e Filmotecas não Imobilizável",
			  descricao: "Registrao valor das despesas com discos, CD e coleções de fitas gravadas com músicas e fitas cinematográficas de caráter educativo, científico e informativo, cuja " +
				    "defasagem contabil ocorre em um prazo máximo de dois anos e que atenda os parametros excludentes de materia permanente, conforme NE N. 04 de 31 de Outubro de 1997.",
			  exemplo: "Disco Educativo - Fita de Áudio e Vídeo com Aula de caráter Educativo - Microfilmes e Outros ..."
			},
			{ codigo: "3.3.90.30.52", nome: "Material de Caráter Secreto ou Reservado",
			  descricao: "Registra o valor das despesas com materiais de caráter sigiloso constante em regulamento do orgão.",
			  exemplo: "Material Secreto ou Reservado."
			},
			{ codigo: "3.3.90.30.53", nome: "Material Metereológico",
			  descricao: "Registra o valor das despesas com material metereológico.",
			  exemplo: "Radiossondas - Balão de Latex e Outros ..."
			},
			{ codigo: "3.3.90.30.54", nome: "Material p/ Manut. Conserv. de Estradas e Vias",
			  descricao: "Registra o valor das despesas com materiais para reparos, recuperações e adaptações de estradas, ferrovias e rodovias.",
			  exemplo: "Material em Geral para Manutenção, Conservação de Estradas e Vias."
			},
			{ codigo: "3.3.90.30.55", nome: "Selos para Controle Fiscal",
			  descricao: "Registra o valor de despesas com aquisição de selos/chancelas para controle fiscal.",
			  exemplo: "Selo de Controle de Cigarros, Bebidas, etc."
			},
			{ codigo: "3.3.90.30.57", nome: "Material de Marcação da Fauna Silvestre",
			  descricao: "Registra o valor das despesas com materiais utilizados na identificação individual (marcação) dis espécimes de espécies " +
			  		"silvrestres em criadores, mantedores e jardins zoológicos.",
			  exemplo: "MAMIFEROS: Tatuagens - Brincos - Microchip; AVES: Anilhas - Braçadeiras - Brinco de Aves - Microchip; REPTEIS: Lacres - Microchips, etc."
			},
			{ codigo: "3.3.90.30.58", nome: "Sobressalente para Maq. e Equip. para Prod. Industrial",
			  descricao: "Registra o valor das despesas com a aquisição de material utilizado na manutenção e reparo de máquinas e equipamentos industriais.",
			  exemplo: "Material para Manutenção, Reparo e Recuperação de Equipamentos Industriais."
			},
			{ codigo: "3.3.90.30.59", nome: "Material para Divulgação",
			  descricao: "Registra o valor das despesas com aquisição de material para divulgação institucional ou promocional do governo e de interesse público.",
		      exemplo: "Banner - Painéis Ilustrativos para divulgação de Eventos - Faixas Promocionais - Placas e Outros ..."
			},
			{ codigo: "3.3.90.30.84", nome: "Integração Dados Estados e Municípios - SAFEM",
			  descricao: "Registra o valor das despesas decorrentes da integração dos balancetes dos Estados e Municípios.",
			  exemplo: ""
			},
			{ codigo: "3.3.90.30.89", nome: "Material de Consumo - Repartições no Exterior",
			  descricao: "Registra o valor das despesas com aquisição de material de consumo utilizados na manutenção de embaixadas, consulados, vice-consulados, " +
			  		"missões diplomaticas e outras repartições sediadas no exterior.",
			  exemplo: ""
			},
			{ codigo: "3.3.90.30.91", nome: "Variação Cambial Negativa",
			  descricao: "Registra o valor das despesas com variação cambial, incidente sobre obrigações, decorrentes de cláusula contratual ou de equivalencia " +
			  		"de moeda na rotina de suprimento de fundos.",
			  exemplo: ""
			},
			{ codigo: "3.3.90.30.96", nome: "Material de Consumo - Pagto Antecipado",
			  descricao: "Registra o valor das apropriações das despesas referentes ao pagamento antecipado, com material de consumo para posterior prestação de contas.",
			  exemplo: ""
			}
		];
	};
});