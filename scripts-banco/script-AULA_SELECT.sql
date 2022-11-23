use db_video_locadora;

# Estrutura básica do 'select'
-- retorna todas as colunas e todos os registros (*)
	select * from tbl_filme;
	select tbl_filme.* from tbl_filme;

-- retorna apenas os atributos especificados
	select nome, duracao, sinopse from tbl_filme;
	select tbl_filme.nome, tbl_filme.duracao, tbl_filme.sinopse from tbl_filme;

-- retorno filtrado pelo ID
	select * from tbl_filme where id = 1;
    select nome, duracao, sinopse from tbl_filme where id = 1;
    
-- retorno filtrado por outros atributos
	select * from tbl_filme 
			 where nome = 'batman'; -- não retorna o filme solicitado, pois quando usa-se '=' a igualdade deve ser literal

	select * from tbl_filme 
			 where nome like 'batman'; -- não retorna o filme solicitado, pois quando usa-se apenas o 'like' a igualdade deve ser literal
             
	select * from tbl_filme 
			 where nome like '%batman'; -- não retorna o filme solicitado, pois quando usa-se apenas o 'like' e um '%' no inicio, a palavra chave deve estar no final do registro
             
	select * from tbl_filme 
			 where nome like 'batman%'; -- retorna o filme solicitado, pois quando usa-se apenas o 'like' e um '%' no final, a palavra chave deve estar no incio do registro
             
	select * from tbl_filme 
			 where nome like '%batman%'; -- retorna o filme solicitado, pois quando usa-se apenas o 'like' e um '%' no incio e no final, a palavra chave pode estar em qualquer posicao do registro (inclusive em partes de palavras)

	select * from tbl_filme
			where nome like 'o%'; -- retorna os registros que comecam com 'o'

    select * from tbl_filme
			where sinopse like '%mulher%';

-- retorno ordenado ('order by' sempre deve estar no final do script)
	select * from tbl_filme 
			order by nome; -- retorna os registros ordenados pelo nome (por ordem alfabetica crescente - padrao)

	select * from tbl_filme 
			order by nome asc; -- retorna os registros ordenados pelo nome (por ordem alfabetica crescente - especificado)
    
	select * from tbl_filme 
			order by nome desc; -- retorna os registros ordenados pelo nome (por ordem alfabetica decrescente)
	
    select * from tbl_filme
			order by nome_original desc, nome; -- retorno ordenado por mais de um atributo (prioridade na ordem que os os atributos estão no scripit)

-- retorno utilizando os operadores de comparacao (=, <, >, <=, >=, <> - diferente)
	select * from tbl_filme 
			where data_lancamento < '1990-12-31';

	select * from tbl_filme 
			where data_lancamento > '1990-12-31';
		-- mesma estrutura para os demais operadores

-- retorno utilizando operadores lógicos (not, and, or)
	-- prioridade de execucao:
		# 0 - ()
        # 1 - not
        # 2 - and
        # 3 - or
        
	# nome: inicio 'a'
    # data lancamento: antes de 2010
    select * from tbl_filme
			where nome like 'a%' and data_lancamento < '2010-01-01';
	
    # nome: inicio 'o'
    # nome: inicio 'a'
    select * from tbl_filme
			where nome like 'a%' or nome like 'o%';
            
	# nome: inicio 'a'
    # nome original: inicio 'a'
    
	# nome: inicio 'o'
    # nome original: inicio 'o'
    
	# data lancamento: antes 2010
	select nome, nome_original, sinopse, duracao, data_lancamento from tbl_filme
			where ((nome like 'a%' or nome_original like 'a%') 
			or (nome like 'o%' or nome_original like 'o%' ))
            and (data_lancamento < '2010-01-01');
	
    
-- TRABALHANDO COM CÁLCULOS NO DB --
select 10 + 10;
select 10 - 10;
select 10 * 10;
select 10 / 10;

select (count(*) * 50.30) as qntd_filmes from tbl_filme; -- 'count': conta a quantidade de registros
select concat('Existem ', count(*), ' filmes cadastrados, e custou R$',  (count(*) * 50.30), ' para a video locadora.') as resultado from tbl_filme;

select sum(quantidade) as soma_tudo from tbl_filme; -- 'sum': permite somar os valores de uma coluna
select avg(quantidade) as media from tbl_filme; -- 'avg': permite extrair a média os valores de uma coluna
select round(avg(quantidade), 1) as media_arredondada from tbl_filme; -- 'round': permite arredondar e limitar a quantidade de casas decimais

select min(quantidade) as menor_valor from tbl_filme; -- 'min': retorna o menor valor registrado
select max(quantidade) as maior_valor from tbl_filme; -- 'max': retorna o maior valor registrado

-- TRABALHANDO COM COMBINAÇÕES DE SELECT --

# Encontrando valores entre dois parâmetros
select id, nome, sinopse, quantidade, 'R$4.50' as valorUnitario, concat('R$', (quantidade * 4.50)) as valorTotal
	from tbl_filme
	where quantidade >= 4 and quantidade <= 8
    order by quantidade;
    
select id, nome, sinopse, quantidade, 'R$4.50' as valorUnitario, concat('R$', (quantidade * 4.50)) as valorTotal
	from tbl_filme
	where quantidade between 4 and 8 -- 'between': retorna dados que estão entre dois valores
    order by quantidade;

select id, nome, sinopse, quantidade, 'R$4.50' as valorUnitario, concat('R$', (quantidade * 4.50)) as valorTotal
	from tbl_filme
	where quantidade not between 4 and 8 -- 'not between': retorna dados que NÃO estão entre dois valores
    order by quantidade;

# Encontrando valores com expecificações de valores    
select id, nome, sinopse, quantidade, 'R$4.50' as valorUnitario, concat('R$', (quantidade * 4.50)) as valorTotal
	from tbl_filme
    where quantidade = 2 or quantidade = 4 or quantidade = 6 or quantidade = 9 or quantidade = 10
    order by quantidade;
    
select id, nome, sinopse, quantidade, 'R$4.50' as valorUnitario, concat('R$', (quantidade * 4.50)) as valorTotal
	from tbl_filme
    where quantidade in(2, 4, 6, 9, 10) -- 'in': retorna dados conforme uma sequência de valores (utilizado em situações de vários 'or' para a mesma coluna)
    order by quantidade;

select id, nome, sinopse, quantidade, 'R$4.50' as valorUnitario, concat('R$', (quantidade * 4.50)) as valorTotal
	from tbl_filme
    where quantidade not in(2, 4, 6, 9, 10) -- 'not in': retorna dados que NÃO estão na sequência de valores (utilizado em situações de vários 'not or' para a mesma coluna)
    order by quantidade;
