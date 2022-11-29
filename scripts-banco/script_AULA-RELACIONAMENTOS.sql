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
		   tbl_classificacao.nome as nome_classificacao, tbl_classificacao.classificacao
	from   tbl_filme
-- 			inner join tbl_filme_genero
-- 			on		   tbl_filme.id = tbl_filme_genero.id_filme
--          inner join tbl_genero
--          on         tbl_genero.id = tbl_filme_genero.id_genero
            inner join tbl_classificacao
            on		   tbl_filme.id_classificacao = tbl_classificacao.id where tbl_filme.id = 3            
	order by nome_filme; # ou 'tbl_filme.nome'
    
-- EXEMPLO 02: 'INNER JOIN': não retorna registros em que determinadas chaves estrangeiras não foram fornecidas --
	-- Proposta: retornar nome do filme, sinopse, genero, classificacao, nome dos atores, nacionalidade dos atores
	select tbl_filme.nome as nome_filme, tbl_filme.sinopse,
		   tbl_genero.nome as nome_genero,
		   tbl_classificacao.nome as nome_classificacao, tbl_classificacao.classificacao, tbl_classificacao.caracteristica,
		   tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nacionalidade_ator

	from   tbl_filme # nome do filme e sinopse estão nessa tabela, logo, não é necessário utilizar o inner join

		   -- relacionamentos para encontrar o genero do filme
		   inner join tbl_filme_genero
		   on		  tbl_filme.id = tbl_filme_genero.id_filme # boa prática: [chave primária] = [chave estrangeira]
		   inner join tbl_genero
		   on		  tbl_genero.id = tbl_filme_genero.id_genero
		   
		   -- relacionamento para encontrar a classificacao
		   inner join tbl_classificacao
		   on		  tbl_classificacao.id = tbl_filme.id_classificacao
		   
		   -- relacionamentos para encontrar o nome do ator
		   inner join tbl_filme_ator
		   on		  tbl_filme.id = tbl_filme_ator.id_ator
		   inner join tbl_ator
		   on 		  tbl_ator.id = tbl_filme_ator.id_ator
		   inner join tbl_ator_diretor
		   on	  	  tbl_ator_diretor.id = tbl_ator.id_ator_diretor
		   
		   -- relacionamentos para encontrar a nacionalidade
		   inner join tbl_ator_diretor_nacionalidade
		   on		  tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
		   inner join tbl_nacionalidade
		   on		  tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade
		   
		   where tbl_filme.id = 1;
               
-- EXEMPLO 03: 'LEFT JOIN': é possível retornar registros que determinadas chaves estrangeiras não foram fornecidas --
	-- Proposta: retornar nome do filme, sinopse, genero, classificacao, nome dos atores, nacionalidade dos atores
	select tbl_filme.nome as nome_filme, tbl_filme.sinopse,
		   tbl_genero.nome as nome_genero,
		   tbl_classificacao.nome as nome_classificacao, tbl_classificacao.classificacao, tbl_classificacao.caracteristica,
		   tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nacionalidade_ator

	from   tbl_filme # nome do filme e sinopse estão nessa tabela, logo, não é necessário utilizar o inner join

		   -- relacionamentos para encontrar o genero do filme
		   inner join tbl_filme_genero
		   on		  tbl_filme.id = tbl_filme_genero.id_filme # boa prática: [chave primária] = [chave estrangeira]
		   inner join tbl_genero
		   on		  tbl_genero.id = tbl_filme_genero.id_genero
		   
		   -- relacionamento para encontrar a classificacao
		   inner join tbl_classificacao
		   on		  tbl_classificacao.id = tbl_filme.id_classificacao
		   
		   -- relacionamentos para encontrar o nome do ator
		   inner join tbl_filme_ator
		   on		  tbl_filme.id = tbl_filme_ator.id_ator
		   inner join tbl_ator
		   on 		  tbl_ator.id = tbl_filme_ator.id_ator
		   left join tbl_ator_diretor # o id do ator pode não existir na tabela de ator_diretor
		   on	  	  tbl_ator_diretor.id = tbl_ator.id_ator_diretor
		   
		   -- relacionamentos para encontrar a nacionalidade
		   inner join tbl_ator_diretor_nacionalidade
		   on		  tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
		   inner join tbl_nacionalidade
		   on		  tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade
		   
		   where tbl_filme.id = 1;
           
-- 'inner join' - retorna apenas o nome do ator e nacionalidade que possuem as duas informações
	select tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nome_nacionalidade
	
    from tbl_ator_diretor    
		 inner join tbl_ator_diretor_nacionalidade
         on			tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
         inner join tbl_nacionalidade
         on			tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
         
	-- 'left join' - retorna todos os atores e suas nacionalidade
	select tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nome_nacionalidade
	
    from tbl_ator_diretor    
		 left join tbl_ator_diretor_nacionalidade
         on			tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
         left join tbl_nacionalidade
         on			tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
                  
	-- 'right join' - retorna todos as nacionalidades e seus atores
	select tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nome_nacionalidade
	
    from tbl_ator_diretor    
		 right join tbl_ator_diretor_nacionalidade
         on			tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
         right join tbl_nacionalidade
         on			tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
         	
	-- 'union' - retorna a porra toda, pois une os scripts e, ainda, exclui as duplicidades (lindo maravilhoso nunca errou [mentira, errou sim, ambos os scripts precisam ter a mesma quantidade de colunas e nome])
	select tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nome_nacionalidade
	
    from tbl_ator_diretor    
		 left join tbl_ator_diretor_nacionalidade
         on			tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
         left join tbl_nacionalidade
         on			tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade
         
	union # ' all': prezerva as repetições
    
	select tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nome_nacionalidade
	
    from tbl_ator_diretor    
		 right join tbl_ator_diretor_nacionalidade
         on			tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
         right join tbl_nacionalidade
         on			tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;
         
	-- "'null' as data_nascimento" - resolve o problema de scripts com quantidades e nomes diferentes de colunas
	select tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nome_nacionalidade,
           tbl_ator_diretor.data_nascimento
	
    from tbl_ator_diretor    
		 left join tbl_ator_diretor_nacionalidade
         on			tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
         left join tbl_nacionalidade
         on			tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade
         
	union
    
	select tbl_ator_diretor.nome as nome_ator, tbl_ator_diretor.nome_artistico,
		   tbl_nacionalidade.nome as nome_nacionalidade,
           'null' as data_nascimento
	
    from tbl_ator_diretor    
		 right join tbl_ator_diretor_nacionalidade
         on			tbl_ator_diretor.id = tbl_ator_diretor_nacionalidade.id_ator_diretor
         right join tbl_nacionalidade
         on			tbl_nacionalidade.id = tbl_ator_diretor_nacionalidade.id_nacionalidade;