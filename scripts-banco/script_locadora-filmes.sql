#Permite criar um banco de dados
create database db_video_locadora;


 -- Comandos de vizualizacao e manipulacao do banco de dados
	#Permite especificar qual banco de dados será manipulado
	use db_video_locadora;
    
	#Permite vizualizar os bancos de dados e tabelas existentes (no banco de dados manipulado)
	show databases;
	show tables;

	#Permitem vizualizar a estrutura (campos) de uma tabela
	desc tbl_; -- comando abreviado (mais comum)
	describe tbl_;

	#Permite excluir um banco de dados
	drop database db_;

	#Permite apagar uma tabela
	drop table tbl_;


 -- Comandos de alteracao de tabelas
	#Permite apagar um atributo da tabela
	alter table tbl_
		drop column nome;
	
    #Permite criar um atributo novo na tabela
	alter table tbl_
		add column nome varchar(35);
	
    #Permite alterar a estrutura de um atributo, sem apaga-lo
		-- 'modify': modifica toda a estrutura do artibuto
	alter table tbl_
		modify column nome varchar(35) not null;
        
        -- 'change': renomeia (segunda nomenclatura) e modifica a estrutura do atributo
	alter table tbl_
		change nome novo_nome varchar(35) not null;
        
	#Permitem renomear o nome de uma tabela
    alter table tbl_genero rename tbl_genero_filme;
    rename table tbl_genero to tbl_genero_filme;
		-- comandos nao executados

    #Permite apagar uma constraint (relacionamento) de uma tabela
    alter table tbl_filme
		drop foreign key FK_classificacao_filme;

	#Permite adicionar uma constraint (relacionamento) em uma tabela
	alter table tbl_filme
		add constraint FK_classificacao_filme
			foreign key(id_classificacao)
            references tbl_classificacao(id);
        
        
 -- Comandos de criacao de tabelas
	#Tabela de generos de filmes
	create table tbl_genero (
		id int not null auto_increment primary key,
		nome varchar(45) not null,

		#Permite definir o ID como indice unico (nao se repete)
		unique index(id)
	);

	#Tabela de classificacao indicativa
	create table tbl_classificacao (
		id int not null auto_increment,
		nome varchar(20) not null,
		classificacao varchar(30) not null,
		caracteristica varchar(80) not null,
		
		#Permite definir o ID como indice unico (nao se repete) e chave primaria
		unique index(id),
		primary key(id) -- comando existente pois é possivel criar mais de uma chave primaria (nao recomendado)
	);

	#Tabela de nacionalidade
	create table tbl_nacionalidade (
		id int not null auto_increment primary key,
		nome varchar(30) not null,
		
		unique index(id)
	);

	#Tabela de sexo
	create table tbl_sexo (
		id int not null auto_increment primary key,
		descricao varchar(15) not null,
		sigla varchar(5) not null,
		
		unique index(id)
	);
    
    #Tabela de filme
    create table tbl_filme (
		id int not null auto_increment primary key,
        nome varchar(50) not null,
        nome_original varchar(50),
        duracao time,
        sinopse text,
        data_lancamento date not null,
        data_relancamento date,
        foto_capa varchar(200),
        id_classificacao int not null, -- atributo para receber a FK (foreign key: chave estrangeira)
        
        #Script para criacao de chave estrangeira
        constraint FK_classificacao_filme -- nome da FK ('FK_[tabela original]_[tabela destino]')
			foreign key(id_classificacao) -- identifica qual atributo vai ser a FK nesta tabela
            references tbl_classificacao(id), -- de onde veio a PK
        
        unique index(id)
    );

	#Tabela com as informacoes gerais dos atores/diretores
	create table tbl_ator_diretor (
		id int not null auto_increment primary key,
        nome varchar(80) not null,
        nome_artistico varchar(80),
        data_nascimento date not null,
        data_falecimento date,
        foto varchar(200),
        id_sexo int not null,
        
        constraint FK_sexo_ator_diretor
			foreign key (id_sexo)
            references tbl_sexo(id),
            
		unique index(id)
    );
    
    #Tabela de casamento (intermediaria) entre a tabela de nacionalidade e a tabela de ator e diretor
    create table tbl_ator_diretor_nacionalidade (
		id int not null auto_increment primary key,
        id_ator_diretor int not null,
        id_nacionalidade int not null,
        
        constraint FK_ator_diretor_nacionalidade
			foreign key (id_ator_diretor)
            references tbl_ator_diretor(id),
		
        constraint FK_nacionalidade_ator_diretor
			foreign key (id_nacionalidade)
            references tbl_nacionalidade(id),
            
		unique index(id)
    );
    
    #Tabela de ator
    create table tbl_ator (
		id int not null auto_increment primary key,
        quantidade_filmes int,
        biografia text,
        ano_inicio_carreira year,
        id_ator_diretor int not null,
        
        constraint FK_ator_diretor_ator
			foreign key (id_ator_diretor)
            references tbl_ator_diretor(id),
            
		unique index(id)
	);
    
    #Tabela de diretor
    create table tbl_diretor (
		id int not null auto_increment primary key,
        quantidade_filmes int,
        biografia text,
        ano_inicio_carreira year,
        id_ator_diretor int not null,
        
        constraint FK_ator_diretor_diretor
			foreign key (id_ator_diretor)
            references tbl_ator_diretor(id),
            
		unique index(id)
	);
    
    #Tabela de casamento (intermediaria) entre filme e ator
    create table tbl_filme_ator (
		id int not null auto_increment primary key,
        id_filme int not null,
        id_ator int not null,
        
        constraint FK_filme_filme_ator
			foreign key (id_filme)
            references tbl_filme(id),
            
		constraint FK_ator_filme_ator
			foreign key (id_ator)
            references tbl_ator(id),
        
        unique index(id)
    );
    
    #Tabela de casamento (intermediaria) entre filme e diretor
    create table tbl_filme_diretor (
		id int not null auto_increment primary key,
        id_filme int not null,
        id_diretor int not null,
        
        constraint FK_filme_filme_diretor
			foreign key (id_filme)
            references tbl_filme(id),
            
		constraint FK_diretor_filme_diretor
			foreign key (id_diretor)
            references tbl_diretor(id),
        
        unique index(id)
    );
    
    #Tabela de casamento (intermediaria) entre filme e genero
    create table tbl_filme_genero (
		id int not null auto_increment primary key,
        id_filme int not null,
        id_genero int not null,
        
        constraint FK_filme_filme_genero
			foreign key (id_filme)
            references tbl_filme(id),
            
		constraint FK_genero_filme_genero
			foreign key (id_genero)
            references tbl_genero(id),
            
		unique index(id)
    );
    
    