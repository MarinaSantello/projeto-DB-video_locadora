
select * from tbl_;

use db_video_locadora;

show tables;

select * from tbl_ator_diretor;

# Insert:
-- tabela de sexo
	insert into tbl_sexo ( sigla, descricao )
				  values ( 'F', 'Feminino' );
				  
	insert into tbl_sexo ( sigla, descricao )
				  values ( 'M', 'Masculino' );

-- tabela de classificacao
	-- insert com multiplos valores
	insert into tbl_classificacao ( nome, classificacao, caracteristica )
						   values ( 'L', 'Livre', 'Não expõe crianças a conteúdos potencialmente prejudiciais.' ),
								  ( '10', 'Não recomendado para menores de 10 anos', 'Conteúdo violento ou linquagem inapropriada para criancas, ainda que em menor intensidade.' ),
                                  ( '12', 'Não recomendado para menores de 12 anos', 'As cenas podem conter agressão física, consumo de drogas e insinuação sexual.' ),
                                  ( '14', 'Não recomendado para menores de 14 anos', 'Conteúdos mais acentuados com violência e ou linguagem sexual.' ),
                                  ( '16', 'Não recomendado para menores de 16 anos', 'Conteúdos de sexo ou violência mais intensos, com cenas de tortura, suicídio, estupro ou nudez total.' ),
                                  ( '18', 'Não recomendado para menores de 18 anos', 'Conteúdos violentos e sexuais extremos. Cenas de sexo, incesto ou atos repetidos de tortura, multilação ou abuso sexual.' );
	
    -- alteracao necessaria para preencher a tabela com valores de quantidade de caracteres maior do que o estipulado originalmente
	alter table tbl_classificacao
		modify column classificacao varchar(50) not null,
		modify column caracteristica varchar(150) not null;
        
	-- tabela de genero
    insert into tbl_genero ( nome )
					values ( 'Drama' ),
						   ( 'Policial' ),
						   ( 'Musical' ),
						   ( 'Aventura' ),
						   ( 'Animação' ),
						   ( 'Comédia' ),
						   ( 'Romance' ),
						   ( 'Fantasia' ),
						   ( 'Ação' ),
						   ( 'Suspense' );
                           
	-- tabela de nascionalidade
    insert into tbl_nacionalidade ( nome )
							values (  'Americano(a)' ),
 								   ( 'Brasileiro(a)' ),
                                   ( 'Frances(a)' ),
                                   ( 'Britânico(a)' ),
                                   ( 'Australiano(a)' );
                                   
	-- tabela de filmes
    insert into tbl_filme ( nome,
						    duracao,
                            sinopse,
                            data_lancamento,
                            data_relancamento,
                            foto_capa,
                            nome_original,
                            id_classificacao )
					values ( 'O poderoso chefão',
							 '02:55:00',
                             'Don Vito Corleone (Marlon Brando) é o chefe de uma "família" de Nova York que está feliz, pois Connie (Talia Shire), sua filha, se casou com Carlo (Gianni Russo). Porém, durante a festa, Bonasera (Salvatore Corsitto) é visto no escritório de Don Corleone pedindo "justiça", vingança na verdade contra membros de uma quadrilha, que espancaram barbaramente sua filha por ela ter se recusado a fazer sexo para preservar a honra. Vito discute, mas os argumentos de Bonasera o sensibilizam e ele promete que os homens, que maltrataram a filha de Bonasera não serão mortos, pois ela também não foi, mas serão severamente castigados. Vito porém deixa claro que ele pode chamar Bonasera algum dia para devolver o "favor". Do lado de fora, no meio da festa, está o terceiro filho de Vito, Michael (Al Pacino), um capitão da marinha muito decorado que há pouco voltou da 2ª Guerra Mundial. Universitário educado, sensível e perceptivo, ele quase não é notado pela maioria dos presentes, com exceção de uma namorada da faculdade, Kay Adams (Diane Keaton), que não tem descendência italiana mas que ele ama. Em contrapartida há alguém que é bem notado, Johnny Fontane (Al Martino), um cantor de baladas românticas que provoca gritos entre as jovens que beiram a histeria. Don Corleone já o tinha ajudado, quando Johnny ainda estava em começo de carreira e estava preso por um contrato com o líder de uma grande banda, mas a carreira de Johnny deslanchou e ele queria fazer uma carreira solo. Por ser seu padrinho Vito foi procurar o líder da banda e ofereceu 10 mil dólares para deixar Johnny sair, mas teve o pedido recusado. Assim, no dia seguinte Vito voltou acompanhado por Luca Brasi (Lenny Montana), um capanga, e após uma hora ele assinou a liberação por apenas mil dólares, mas havia um detalhe: nas "negociações" Luca colocou uma arma na cabeça do líder da banda. Agora, no meio da alegria da festa, Johnny quer falar algo sério com Vito, pois precisa conseguir o principal papel em um filme para levantar sua carreira, mas o chefe do estúdio, Jack Woltz (John Marley), nem pensa em contratá-lo. Nervoso, Johnny começa a chorar e Vito, irritado, o esbofeteia, mas promete que ele conseguirá o almejado papel. Enquanto a festa continua acontecendo, Don Corleone comunica a Tom Hagen (Robert Duvall), seu filho adotivo que atua como conselheiro, que Carlo terá um emprego mas nada muito importante, e que os "negócios" não devem ser discutidos na sua frente. Os verdadeiros problemas começam para Vito quando Sollozzo (Al Lettieri), um gângster que tem apoio de uma família rival, encabeçada por Phillip Tattaglia (Victor Rendina) e seu filho Bruno (Tony Giorgio). Sollozzo, em uma reunião com Vito, Sonny e outros, conta para a família que ele pretende estabelecer um grande esquema de vendas de narcóticos em Nova York, mas exige permissão e proteção política de Vito para agir. Don Corleone odeia esta idéia, pois está satisfeito em operar com jogo, mulheres e proteção, mas isto será apenas a ponta do iceberg de uma mortal luta entre as "famílias".',
                             '1972-03-24',
                             '2022-02-24',
                             'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/90/93/20/20120876.jpg',
                             'The Godfather',
                             22),
					       ( 'O rei leão',
							 '01:29:00',
							 'Clássico da Disney, a animação acompanha Mufasa (voz de James Earl Jones), o Rei Leão, e a rainha Sarabi (voz de Madge Sinclair), apresentando ao reino o herdeiro do trono, Simba (voz de Matthew Broderick). O recém-nascido recebe a bênção do sábio babuíno Rafiki (voz de Robert Guillaume), mas ao crescer é envolvido nas artimanhas de seu tio Scar (voz de Jeremy Irons), o invejoso e maquiavélico irmão de Mufasa, que planeja livrar-se do sobrinho e herdar o trono.',
							 '1994-07-08',
							 '2011-08-26',
							 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/84/28/19962110.jpg',
							 'The Lion King',
                             19),
					       ( 'Forrest Gump - O Contador de Histórias',
							 '02:20:00',
							 'Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump (Tom Hanks), um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, ele consegue participar de momentos cruciais, como a Guerra do Vietnã e Watergate, mas continua pensando no seu amor de infância, Jenny Curran.',
							 '1994-12-07',
							 null,
							 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/30/21/19874092.jpg',
							 'Forrest Gump',
                             22),
					       ( 'À espera de um milagre',
							 '03:09:00',
							 '1935, no corredor da morte de uma prisão sulista. Paul Edgecomb (Tom Hanks) é o chefe de guarda da prisão, que temJohn Coffey (Michael Clarke Duncan) como um de seus prisioneiros. Aos poucos, desenvolve-se entre eles uma relação incomum, baseada na descoberta de que o prisioneiro possui um dom mágico que é, ao mesmo tempo, misterioso e milagroso.',
							 '2000-03-10',
							 null,
							 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/91/66/66/20156966.jpg',
							 'The Green Mile',
                             22),
					       ( 'Vingadores: Ultimato',
							 '03:01:00',
							 'Em Vingadores: Ultimato, após Thanos eliminar metade das criaturas vivas em Vingadores: Guerra Infinita, os heróis precisam lidar com a dor da perda de amigos e seus entes queridos. Com Tony Stark (Robert Downey Jr.) vagando perdido no espaço sem água nem comida, o Capitão América/Steve Rogers (Chris Evans) e a Viúva Negra/Natasha Romanov (Scarlett Johansson) precisam liderar a resistência contra o titã louco.',
							 '2019-04-25',
							 '2019-07-11',
							 'https://br.web.img2.acsta.net/c_310_420/pictures/19/04/26/17/30/2428965.jpg',
							 'Avengers: Endgame',
                             21),
					       ( 'Batman - O Cavaleiro Das Trevas',
							 '02:32:00',
							 'Após dois anos desde o surgimento do Batman (Christian Bale), os criminosos de Gotham City têm muito o que temer. Com a ajuda do tenente James Gordon (Gary Oldman) e do promotor público Harvey Dent (Aaron Eckhart), Batman luta contra o crime organizado. Acuados com o combate, os chefes do crime aceitam a proposta feita pelo Coringa (Heath Ledger) e o contratam para combater o Homem-Morcego.',
							 '2008-07-18',
							 null,
							 'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/86/98/32/19870786.jpg',
							 'The Dark Knight',
                             21);

	-- tabela intermediaria ente genero e filme
    insert into tbl_filme_genero ( id_filme, id_genero )
						  values ( 1, 1 ),
								 ( 1, 2 ),
								 ( 2, 3 ),
								 ( 2, 4 ),
								 ( 2, 5 ),
								 ( 3, 6 ),
								 ( 3, 7 ),
								 ( 3, 1 ),
								 ( 4, 2 ),
								 ( 4, 8 ),
								 ( 5, 9 ),
								 ( 5, 8 ),
								 ( 5, 4 ),
								 ( 6, 9 ),
								 ( 6, 10 );
                                 
	-- tabela de ator e diretor
    insert into tbl_ator_diretor ( nome,
								   nome_artistico,
                                   data_nascimento,
                                   data_falecimento,
                                   foto,
                                   id_sexo )
                                   -- poderoso chefao
						  values ( 'Marlon Brando',
								   null,
                                   '1924-04-03',
                                   '2004-07-01',
                                   'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/51/54/20040663.jpg',
                                   2),
                                   ( 'Al Pacino',
								   'Alfredo James Pacino',
                                   '1940-04-25',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/19/03/19/18/33/1337912.jpg',
                                   2),
                                   ( 'James Caan',
								   'James Edmund Caan',
                                   '1940-03-26',
                                   '2022-07-06',
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/15/06/09/21/29/576102.jpg',
                                   2),
                                   ( 'Francis Ford Coppola',
								   null,
                                   '1939-04-07',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/35/21/99/19187501.jpg',
                                   2),
                                   -- rei leao
                                   ( 'Garcia Júnior',
								   null,
                                   '1967-03-02',
                                   null,
                                   'https://br.web.img2.acsta.net/c_310_420/pictures/14/01/16/13/52/556410.jpg',
                                   2),
                                   ( 'Matthew Broderick',
								   null,
                                   '1962-03-21',
                                   null,
                                   'https://br.web.img2.acsta.net/c_310_420/pictures/19/07/02/22/47/0236519.jpg',
                                   2),
                                   ( 'James Earl Jones',
								   'James Earl Jones',
                                   '1931-01-17',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/55/34/20040970.jpg',
                                   2),
                                   ( 'Roger Allers',
								   null,
                                   '1949-06-29',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/91/54/06/20150846.jpg',
                                   2),
                                   ( 'Rob Minkoff',
								   'Robert Ralph Minkoff',
                                   '1962-08-11',
                                   null,
                                   'https://br.web.img2.acsta.net/c_310_420/medias/nmedia/18/91/54/07/20150847.jpg',
                                   2),
                                   -- forrest gump
                                   ( 'Robert Zemeckis',
								   'Robert Lee Zemeckis',
                                   '1952-05-14',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/87/57/81/20030814.jpg',
                                   2),
                                   ( 'Tom Hanks',
								   'Thomas Jeffrey Hanks',
                                   '1956-07-09',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/18/08/08/18/47/1167635.jpg',
                                   2),
                                   ( 'Gary Sinise',
								   'Gary Alan Sinise',
                                   '1955-03-17',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/92/45/36/20200745.jpg',
                                   2),
                                   ( 'Robin Wright',
								   'Robin Wright Penn',
                                   '1966-04-08',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/19/11/05/01/50/2018682.jpg',
                                   1),
                                   -- a espera de um milagre
                                   ( 'Frank Darabont',
								   'Ferenc Árpád Darabont',
                                   '1959-01-28',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/medias/nmedia/18/90/95/95/20122149.jpg',
                                   2),
                                   ( 'Michael Duncan',
								   'Michael Clarke Duncan',
                                   '1957-12-10',
                                   '2012-09-03',
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/14/09/06/19/41/147683.jpg',
                                   2),
                                   ( 'David Morse',
								   'David Bowditch Morse',
                                   '1953-10-11',
                                   null,
                                   'https://br.web.img2.acsta.net/c_310_420/pictures/15/02/25/18/50/212119.jpg',
                                   2),
                                   -- vingadores: ultimato
                                   ( 'Joe Russo',
								   'Joseph Vincent Russo',
                                   '1971-07-08',
                                   null,
                                   'https://br.web.img2.acsta.net/c_310_420/pictures/15/11/24/17/01/231901.jpg',
                                   2),
                                   ( 'Anthony Russo',
								   'Anthony J. Russo',
                                   '1970-02-03',
                                   null,
                                   'https://br.web.img2.acsta.net/c_310_420/pictures/15/11/24/16/59/250993.jpg',
                                   2),
                                   ( 'Robert Downey Jr',
								   'Robert John Downey Jr',
                                   '1965-04-04',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/18/06/29/00/35/0101925.jpg',
                                   2),
                                   ( 'Chris Evans',
								   'Christopher Robert Evans',
                                   '1981-06-13',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/19/04/22/19/59/2129500.jpg',
                                   2),
                                   ( 'Mark Ruffalo',
								   'Mark Alan Ruffalo',
                                   '1967-11-22',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/19/04/22/20/02/3083743.jpg',
                                   2),
                                   -- batman
                                   ( 'Christopher Nolan',
								   'Christopher Edward Nolan',
                                   '1970-07-30',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/15/02/26/15/33/118611.jpg',
                                   2),
                                   ( 'Christian Bale',
								   'Christian Charles Philip Bale',
                                   '1974-01-30',
                                   null,
                                   'https://br.web.img3.acsta.net/c_310_420/pictures/15/02/24/18/43/126776.jpg',
                                   2),
                                   ( 'Heath Ledger',
								   'Heathcliff Andrew Ledger',
                                   '1979-04-04',
                                   '2008-01-22',
                                   'https://br.web.img2.acsta.net/c_310_420/pictures/18/08/16/19/43/2593099.jpg',
                                   2),
                                   ( 'Aaron Eckhart',
								   'Aaron Edward Eckhart',
                                   '1968-03-12',
                                   null,
                                   'https://br.web.img2.acsta.net/c_310_420/pictures/16/01/28/10/38/041658.jpg',
                                   2);

	-- tabela de casamento entre ator/diretor e nacionalidade
    insert into tbl_ator_diretor_nacionalidade ( id_ator_diretor, id_nacionalidade )
										 values ( 1, 1 ),
												( 2, 1 ),
												( 3, 1 ),
												( 4, 1 ),
												( 5, 2 ),
												( 6, 1 ),
												( 7, 1 ),
												( 8, 1 ),
												( 9, 1 ),
												( 10, 1 ),
												( 11, 1 ),
												( 12, 1 ),
												( 13, 1 ),
												( 14, 1 ),
												( 14, 3 ),
												( 15, 1 ),
												( 16, 1 ),
												( 17, 1 ),
												( 18, 1 ),
												( 19, 1 ),
												( 20, 1 ),
												( 21, 1 ),
												( 22, 4 ),
												( 23, 1 ),
												( 23, 4 ),
												( 24, 5 ),
												( 25, 1 );

	-- tabela de ator
    insert into tbl_ator ( quantidade_filmes,
						   biografia,
                           ano_inicio_carreira,
                           id_ator_diretor )
						-- poderoso chefao
				 values ( 41,
						 '- Trabalhou como ascensorista de elevador em uma loja por 4 dias, antes de se tornar famoso.
 						  - Possui uma ilha particular no oceano Pacífico, na Polinésia, desde 1966.
 						  - O Oscar que ganhou por "Sindicato dos Ladrões" foi roubado de sua casa, com o ator tendo solicitado à Academia de Artes e Ciências Cinematográficas a reposição da estatueta, em 1970.
 						  - Recusou o Oscar recebido por "O Poderoso Chefão", em protesto pelo modo como os Estados Unidos e, especialmente, Hollywood vinham discriminando os índios nativos do país. Brando não compareceu à cerimônia de entrega do Oscar e enviou em seu lugar a atriz Sacheen Littlefeather, que subiu ao palco para receber a estatueta do ator como se fosse uma índia verdadeira, divulgando seu protesto.
 						  - Em determinado momento das filmagens de "A Cartada Final", se recusava a estar no mesmo set que o diretor Frank Oz.
 						  - Possui uma estrela na Calçada da Fama, localizada em 1777 Vine Street.',
                           1968,
 						  1),
						( 60,
                          '- É um grande fã de ópera;
                          
                           - É um dos poucos astros de Hollywood que nunca casou;- Foi preso em janeiro de 1961, acusado de carregar consigo uma arma escondida;
                          
                           - Recusou o personagem Han Solo, da trilogia original de "Star Wars";- Foi o primeiro na história do Oscar a ser indicado no mesmo ano nas categorias de melhor ator e melhor ator coadjuvante.',
                          1971,
                          2),
						( 69,
                          'James Caan foi um ator americano, mais conhecido por seu papel Sonny Corleone no clássico O Poderoso Chefão, dirigido por Francis Coppola. Em vida, Caan recebeu diversos prêmios, incluindo quatro indicações ao Golden Globes, uma ao Emmy e uma ao Oscar. Além disso, em 1978 Caan ganhou uma estrela na calçada da fama de Hollywood.

						  Caan nasceu no Bronx, em Nova York e cresceu no Queens. O ator estudou na Universidade de Michigan e se transferiu para a Hempstead, sem colar grau, mas entre seus colegas de turma estavam Coppola e a atriz Lainie Kazan. Durante este tempo, Caan se interessou pela atuação e foi aceito na escola de teatro Neighborhood Playhouse, onde estudou por cinco anos. 

						  Seus primeiros trabalhos foram em El Dorado, Countdown e Caminhos Mal Traçados, até participar de O Poderoso Chefão com o personagem que se tornaria sua assinatura. Por sua interpretação de Sonny Corleone, Caan foi indicado ao Oscar e o Globo de Ouro de melhor ator coadjuvante. ',
                          1961,
                          3),                          
						-- rei leao
						( 6,
                          null,
                          1988,
                          5),
						( 47,
                          null,
                          1983,
                          6),
						( 66,
                          '- Do signo de Capricórnio;
                          
                           - Possui descendência africana, indígena e irlandesa;
                          
                           - Foi criado pelos avós maternos. Seus pais, Ruth Connolly and Robert Earl Jones, se separaram pouco antes de seu nascimento;
                          
                           - Começou a ter aulas de atuação para curar sua gagueira;
                          
                           - Também para melhorar sua dicção, começou a escrever poesias e contava com o apoio dos professores, que permitiam que ele as lesse em sala de aula;
                          
                           - É um veterano do exército dos Estados Unidos;
                          
                           - É membro da NRA (Associação Nacional de Rifles da América);
                          
                           - Foi casado com a atriz Julienne Marie, de quem se separou em 1972. Se casou novamente dez anos depois, em 82, com Cecilia Hart, com quem teve um filho;
                          
                           - Foi o primeiro afro-descendente a interpretar o presidente dos EUA. Foi no telefilme The Man, de 1972;
                          
                           - Conhecido por sua voz marcante, tendo conquistado notoriedade por dublar Darth Vader em Star Wars e Mufasa em O Rei Leão;',
                          1964,
                          7),
                          -- forrest gump
						( 97,
                          'Tom Hanks iniciou a carreira no cinema aos 24 anos, com um papel no filme de baixo orçamento Trilha de Corpos. Logo migrou para a TV, onde estrelou por dois anos a série Bosom Buddies. Nela passou a trabalhar com comédia, algo com o qual não estava habituado, rendendo convites para pequenas participações nas séries Táxi, Caras & Caretas e Happy Days.

						  Em 1984, veio seu primeiro sucesso no cinema: a comédia Splash - Uma Sereia em Minha Vida, na qual era dirigido por Ron Howard e contracenava com Daryl Hannah. Em seguida vieram várias comédias, entre elas A Última Festa de Solteiro (1984), Um Dia a Casa Cai (1986) e Dragnet - Desafiando o Perigo (1987), tornando-o conhecido do grande público.

						  Com Quero Ser Grande (1988) Hanks obteve sua primeira indicação ao Oscar de melhor ator. Apesar de consagrado como comediante, aos poucos passou a experimentar outros gêneros. Em 1993 surpreendeu em Filadélfia como um advogado homossexual que luta na justiça contra sua demissão, motivada por preconceito devido a ele ser portador do vírus da AIDS. Pelo papel conquistou seu primeiro Oscar.',
                          1980,
                          11),
						( 35,
                          null,
                          1979,
                          12),
						( 45,
                          'Robin Wright nasceu em Dallas, Texas, filha de Gayle Gaston, uma vendedora de cosméticos, e Freddie Wright, funcionário de uma empresa farmacêutica. A atriz ficou famosa por seus papeis em House of Cards, Mulher-Maravilha, Corpo Fechado e Forrest Gump - O Contador de Histórias.

						  Wright foi criada em San Diego, Califórnia. Quando jovem, frequentou a La Jolla High School, em La Jolla, e a Taft High School em Woodland Hills, em Los Angeles.

						  A atriz começou sua carreira como modelo quando tinha 14 anos. Aos 18, interpretou Kelly Capwell na novela Santa Barbara (1984), da NBC Daytime, recebendo diversas indicações ao Daytime Emmy e voltando os olhos do público para seu trabalho.

						  Das telas da TV para o cinema, Wright conseguiu um papel em Hollywood Vice Squad (1986) e protagonizou uma princesa em A Princesa Prometida, em 1987. Alguns anos mais tarde, a atriz foi aclamada pela crítica em seu papel como Jenny Curran, em Forrest Gump (1994), recebendo indicações ao Golden Globe Award e Screen Actors Guild de Melhor Atriz Coadjuvante.',
                          1984,
                          13),
						-- a espera de um milagre
						( 44,
						  'Michael Clarke Duncan é conhecido pela atuação em À Espera de um Milagre, que lhe rendeu indicações ao Oscar e ao Globo de Ouro de Melhor Ator Coadjuvante. Fez sua estreia nos cinemas em 1995, com um papel não creditado em Sexta-Feira em Apuros. O primeiro trabalho de destaque viria três anos depois com Armageddon. Agradou tanto que Bruce Willis recomendou que Frank Darabont contratasse ele para À Espera de um Milagre, em 1999.

						  Muitas vezes tratado como Big Mike, por causa da altura de 1,96 m, o ator se destacou ainda em Meu Vizinho Mafioso, Planeta dos Macacos, O Escorpião Rei e A Ilha. Participou também de três adaptações dos quadrinhos: O Demolidor, Sin City - A Cidade do Pecado e Lanterna Verde. Robert Rodriguez contava com o retorno dele para Sin City 2: A Dame to Kill For, algo que infelizmente não irá mais acontecer.',
                          1994,
                          15),
						( 50,
                          null,
                          1982,
                          16),
						-- vingadores: ultimato
						( 69,
                          'Do céu ao inferno e ao céu novamente. Se alguém pensou no mito do pássaro fênix que renasce das cinzas, até que a comparação poderia se encaixar para definir este brilhante ator que já deu vida para personagens tão distantes em tempo e estilo, como Charles Chaplin (Chaplin - 1992) e Tony Stark (Homem de Ferro - 2008).

						  Na ativa por mais de quatro décadas e dono de uma voz grave, afinada, Downey já dublou desenho animado (God, the Devil and Bob - 2000), se aventurou no mundo da música, em 2004, com o disco The Futurist (Sony) e fez bonito na televisão, onde faturou o Globo de Ouro, além de outros prêmios e indicações por Larry Paul, personagem do seriado Ally McBeal (2000 - 2002).

						  Mas é no cinema que sua estrela parece brilhar mais intensamente. Tendo estreado aos cinco anos de idade, em 1970, dirigido pelo pai em Pound e repetido a experiência outras vezes, como aconteceu em Hugo Pool (1997), o reconhecimento e ápice do sucesso veio em 2008 na pele do herói metálico e em Trovão Tropical, pelo qual foi indicado ao Oscar, entre outros prêmios.
                          
                          Descendente de irlandeses, escoceses, judeus e alemães, esse filho de pais separados (aos 11 anos) perdeu boa parte de sua infância devido ao trabalho de cineasta independente exercido por seu pai, que o fazia ficar para lá e para cá, entre Estados Unidos, Paris, Londres etc.',
                          1980,
                          19),
						( 39,
                          'Depois de uma infância e estudos ​​em Boston, Chris Evans decidiu ir para Nova York para tentar a sorte na comédia. Ele rapidamente consegue entrar na profissão, principalmente participando em séries de televisão (Boston Public). Sua carreira no cinema começou em 2001, em uma comédia para adolescentes (Não é Mais um Besteirol Americano). Mas sem ficar preso a apenas um gênero de filme, o ator vai para outras produções: trapaceia nas provas com Scarlett Johansson na comédia policial Nota Máxima (2004), interpreta o papel de Kim Basinger no thriller Celular - Um Grito de Socorro (2004) e seduz Jessica Biel em London (2005).

						  O destino de Chris Evans como o conhecemos hoje começou em 2005, quando ele conseguiu seu primeiro papel como super-herói. Em Quarteto Fantástico, um sucesso de bilheteria adaptado dos quadrinhos da Marvel, ele interpreta Johnny Storm, também conhecido como Tocha Humana. O filme é um sucesso e tem uma sequência dois anos depois (O Quarteto Fantástico e o Surfista Prateado). Para se manter na mesm a linha de superheróis, ele empresta sua voz no filme das Tartarugas Ninja (2007), descobre habilidades sobre-humanas em Heróis (2009) e luta no delirante Scott Pilgrim contra o Mundo (2010). No mesmo ano, ele assume a pele de um ex-agente renegado da CIA para Os Perdedores, também adaptação de um quadrinho.
                          
                          Com Capitão América (2011), ele tomou a decisão de sua carreira e assinou um contrato de seis filmes com a Marvel Studios. Ao aceitar o papel de Steve Rogers. Depois de Capitão América, o longa que apresenta o herói ao público , o personagem que ele encarna se junta aos Vingadores, fazendo no total 7 filmes para o MCU e algumas participações especiais em filmes como Thor: O Mundo Sombrio. No entanto, ele não se esquece de sair de seu traje de vez em quando com filmes como O Expresso do Amanhã, O Homem de Gelo, Before We Go, Um Laço de Amor e o sucesso Entre Facas e Segredos. ',
                          2000,
                          20),
						( 49,
                          'Apesar de ter um pequeno papel em Ride With The Devil (1999), a primeira participação de destaque de Mark Ruffalo no cinema vem com o premiado drama Conte Comigo (2000). Ele conquista papéis importantes no thriller erótico Em Carne Viva (2003) e no drama Brilho Eterno de uma Mente Sem Lembranças (2004), antes de se lançar em comédias românticas como De Repente 30 (2004) e Dizem Por Aí... (2005). Ele retoma os dramas e suspenses com Zodíaco (2007) e Ensaio Sobre a Cegueira (2008). Em 2010, Martin Scorsese convida-o a atuar em Ilha do Medo, ao lado de Leonardo DiCaprio. Ele recebe sua primeira indicação ao Oscar como ator coadjuvante no drama Minhas Mães e Meu Pai (2010). Um grande passo para o reconhecimento popular vem com o papel de Hulk no grande sucesso Os Vingadores - The Avengers (2012), abrindo a porta para novas produções no papel do monstro gigantesco.',
                          1994,
                          21),
						-- batman
						( 48,
                          'Caçula de três irmãs mais velhas, filho de um piloto de aviação comercial e de uma dançarina de circo, Bale começou a atuar por influência de uma delas. Pouca gente recorda que este ator inglês é o menino Jim, que tocou corações em Império do Sol (1987), de Steven Spielberg. Para ganhar o papel, derrotou cerca de quatro mil candidatos e sua atuação ainda rendeu prêmios.

						  Mesmo tendo começado cedo (aos 9 anos fez seu primeiro comercial de cereais), foi somente com Psicopata Americano (2000) que ganhou mais notoriedade no papel de Patrick Bateman, que seria, incialmente, de Leonardo DiCaprio.

						  Sua dedicação ao trabalho é reconhecida e sua "entrega" para viver Trevor em O Operário (2004), quando emagreceu cerca de 30 kg, foi considerada chocante demais.

						  Famoso por sua aversão a entrevistas, Bale é capaz de concedê-las com seu bom sotaque americano apenas para não confundir o público, caso o filme em questão seja de um personagem americano.',
                          1986,
                          23),
						( 17,
                          'Extremamente tímido, este australiano descendente de irlandeses e escoceses optou por atuar desde cedo. Mesmo com a rápida fama conquistada, em parte por sua beleza, ele procurou interpretar papéis que não explorassem este aspecto e conseguiu atuações marcantes em sua curta carreira. Premiado após sua morte pela atuação como Coringa, Ledger tem seu lugar marcado para sempre na história do cinema mundial. (RC)

						  - Filho de Sally Ramshaw e Kim Ledger;

						  - Descendente de irlandeses e escoceses;

						  - Teve três irmãs: Catherine (Kate) Ledger, Olivia Ledger e Ashleigh Bell;

						  - Seu nome e o da irmã mais velha, Kate Ledger, foram retirados dos personagens principais do romance "Wuthering Heights" de Emily Brontë;

						  - Teve um canguru de esimação, achado por sua mãe quando ainda era filhote;

						  - Na escola, era concentrado em atuar e nos esportes. Quando pediram para decidir entre os dois, optou por atuar;',
                          1988,
                          24),
						( 34,
                          'Comprou uma moto após aprender a dirigi-la nas filmagens de "Erin Brockovich, uma Mulher de Talento" (2000). Tirou férias de três anos após completar o 2º grau para esquiar na França e surfar no Havaí.',
                          1996,
                          25);

	-- tabela de ator
    insert into tbl_diretor ( quantidade_filmes,
							  biografia,
                              ano_inicio_carreira,
                              id_ator_diretor )
							-- poderoso chefao
					 values ( 72,
							 'Em 1969, fundou juntamente com George Lucas a produtora American Zoetrope, em São Francisco, tendo como primeiro projeto o filme THX 1138 (1970)
                             - É tio do ator Nicolas Cage;- Pai da tambem diretora Sofia Coppola;- Foi assistente de direção de Roger Corman;- Graduado na Universidade da Califórnia (UCLA), a mesma dos diretores, George Lucas e Steven Spielberg.',
							  1962,
							  4),
							 ( 9,
							   null,
                               1994,
                               8),
							 ( 14,
							   null,
                               1994,
                               9),
							 ( 49,
							   '- Especialista em efeitos especiais, Robert Zemeckis é um dos partidários dos filmes do também diretor Steven Spielberg, que já produziu vários de seus filmes;

							  - Trabalhando geralmente com seu parceiro de roteiros Bob Gale, os primeiros filmes de Robert apresentou ao público seu talento para comédias tipo pastelão, como Tudo por uma Esmeralda (1984); 1941 - Uma Guerra Muito Louca (1979) e, acrescentando efeitos muito especiais em Uma Cilada para Roger Rabbit (1988) e De Volta para o Futuro (1985);

							  - Apesar destes filmes terem sidos feitos meramente para o puro entretenimento, com raros desenvolvimentos dos personagens ou mesmo com uma trama cuidadosa, eles são diversão na certa;

							  - Seus filmes posteriores no entanto, se tornaram mais sérios e reflexivos, como o enormemente bem sucedido filme estrelado por Tom Hanks Forrest Gump (1994) e o filme estrelado por Jodie Foster Contato (1997), ambos aclamados pela crítica e novamente reunindo atordoantes efeitos especiais;',
                               1980,
                               10),
							 ( ,
							   '',
                               ,
                               14),
							 ( ,
							   '',
                               ,
                               17),
							 ( ,
							   '',
                               ,
                               18),
							 ( ,
							   '',
                               ,
                               22);
# Update
	update tbl_classificacao set nome = 'L';
		-- sem o 'where' a ponto de estudo e testes
	
    -- 'apagar' dados de uma coluna, sem alterar a sua estrutura
    update tbl_classificacao set classificacao = ''; -- ou, caso seja permitido o campo ser nulo, igualar a 'null'
    
# Delete
	delete from tbl_classificacao;
		-- sem o 'where' a ponto de estudo e testes, além de propiciar o cenario ideal para consertar o 'erro' do update

