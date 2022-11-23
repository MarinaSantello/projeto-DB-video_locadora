select * from tbl_;

use db_video_locadora;

-- RELACIONAMENTOS --

	# WHERE
    select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.data_lancamento,
		   tbl_genero.nome as nome_genero, tbl_classificacao.nome as nome_classificacao, tbl_classificacao.classificacao
	from   tbl_filme, tbl_genero, tbl_filme_genero, tbl_classificacao
	where  tbl_filme.id = tbl_filme_genero.id_filme and -- relacionamento chave primaria = chave estrangeira -- 'and': obrigatório para relacionamentos usando o 'where'
           tbl_genero.id = tbl_filme_genero.id_genero and
           tbl_classificacao.id = tbl_filme.id_classificacao;
    
    # FROM: melhor performance
	select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.data_lancamento,
		   tbl_genero.nome as nome_genero, tbl_classificacao.nome as nome_classificacao, tbl_classificacao.classificacao
	from   tbl_filme
			inner join tbl_filme_genero
			on		   tbl_filme.id = tbl_filme_genero.id_filme
            inner join tbl_genero
            on         tbl_genero.id = tbl_filme_genero.id_genero
            inner join tbl_classificacao
            on		   tbl_classificacao.id = tbl_filme.id_classificacao
            
	order by nome_filme; # ou 'tbl_filme.nome'