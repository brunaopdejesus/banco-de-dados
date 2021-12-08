use dbfilmesturmab;

#RELACIONAMENTO ENTRE TABELAS NO BD
##FORMA 1 DE FAZER RELACIONAMENTO - WHERE
select tblfilme.nome as nomeFilme, 
	   tblfilme.duracao, 
       tblfilme.dataLancamento,
	   tblgenero.nome as nomeGenero
from   tblfilme, tblgenero, tblfilmegenero
where  tblfilme.idFilme = tblfilmegenero.idFilme and
	   tblgenero.idGenero = tblfilmegenero.idGenero
order by nomeGenero;
       #chave primária e onde ela virou estrangeria
       #ficar atento às tabelas chamadas no from
	   #um filme se repetiu três vezes, isso deve ser resolvido no back
       
select * from tblfilme;
select * from tblfilmegenero;

##FORMA 2 DE FAZER RELACIONAMENTO - FROM
##ESSA FORMA DE RELACIONAR CRIA UMA PERFORMANCE (PROCESSAMENTO) MAIS RÁPIDO NA GERAÇÃO DO RESULTADO
### INNER JOIN - RETORNA DADOS QUE FORAM RELACIONADOS ENTRE A TABELA DA ESQUERDA E QUE CONTÉM RELAÇÃO COM A TABELA DA DIREITA
select  tblfilme.nome as nomeFilme,
		tblfilme.duracao,
        tblfilme.datalancamento,
        tblgenero.nome as nomeGenero
from 	tblfilme inner join tblfilmegenero
			on tblFilme.idFilme = tblFilmeGenero.idFilme
		inner join tblgenero
			on tblgenero.idGenero = tblfilmegenero.idGenero;
            

### LEFT JOIN - RETORNA DADOS QUE FORAM RELACIONADOS ENTRE A TABELA DA ESQUERDA 
###				E QUE CONTÉM RELAÇÃO COM A TABELA DA DIREITA, 
###				PORÉM TAMBÉM RETORNA OS DADOS DA TABELA DA ESQUERDA QUE NÃO FORAM RELACIONADOS COM A TABELA DA DIREITA
select  tblfilme.nome as nomeFilme,
		tblfilme.duracao,
        tblfilme.datalancamento,
        tblgenero.nome as nomeGenero
from 	tblfilme left join tblfilmegenero
			on tblFilme.idFilme = tblFilmeGenero.idFilme
		left join tblgenero
			on tblgenero.idGenero = tblfilmegenero.idGenero;
            
            
### RIGHT JOIN - RETORNA DADOS QUE FORAM RELACIONADOS ENTRE A TABELA DA ESQUERDA 
###				E QUE CONTÉM RELAÇÃO COM A TABELA DA DIREITA, 
###				PORÉM TAMBÉM RETORNA OS DADOS DA TABELA DA DIREITA QUE NÃO FORAM RELACIONADOS COM A TABELA DA ESQUERDA
select  tblfilme.nome as nomeFilme,
		tblfilme.duracao,
        tblfilme.datalancamento,
        tblgenero.nome as nomeGenero
from 	tblfilme right join tblfilmegenero
			on tblFilme.idFilme = tblFilmeGenero.idFilme
		right join tblgenero
			on tblgenero.idGenero = tblfilmegenero.idGenero;

# APLICANDO FULL JOIN NO MYSQL
## FULL JOIN, PARA REPRESENTAR ESSE RESULTADO, É NECESSÁRIO UTILIZAR O COMANDO UNION
## (O COMANDO UNION SERVE PARA UNIR DOIS OU MAIS SCRIPTS DE SELECT). CRIAMOS UM 
## SELECT APENAS COM O LEFT JOIN E UNIMOS COM OUTRO SELECT COM O RIGHT JOIN
select  tblfilme.nome as nomeFilme,
		tblfilme.duracao,
        tblfilme.datalancamento,
        tblgenero.nome as nomeGenero
from 	tblfilme left join tblfilmegenero
			on tblFilme.idFilme = tblFilmeGenero.idFilme
		left join tblgenero
			on tblgenero.idGenero = tblfilmegenero.idGenero
union all
select  tblfilme.nome as nomeFilme,
		tblfilme.duracao,
        tblfilme.datalancamento,
        tblgenero.nome as nomeGenero
from 	tblfilme right join tblfilmegenero
			on tblFilme.idFilme = tblFilmeGenero.idFilme
		right join tblgenero
			on tblgenero.idGenero = tblfilmegenero.idGenero;

select * from tblfilme;
select * from tblgenero;
select * from tblator;
select * from filmegenero;

# = está relacionado com
select  tblFilme.nome as nomeFilme,
		tblFilme.nomeOriginal,
        tblClassificacao.nome as nomeClassificacao,
        tblGenero.nome as nomeGenero,
        tblAtor.nome as nomeAtor
from 	tblClassificacao inner join tblFilme 
			on tblClassificacao.idClassificacao = tblFilme.idClassificacao
		inner join tblFilmeGenero
			on tblFilme.idFilme = tblFilmeGenero.idFilme
		inner join tblGenero
			on tblGenero.idGenero = tblFilmeGenero.idGenero
		inner join tblFilmeAtor
			on tblFilme.idFilme = tblFilmeAtor.idFilme
		inner join tblAtor
			on tblAtor.idAtor = tblFilmeAtor.idAtor
where year(tblAtor.dataNascimento) >= 1965
	order by tblAtor.nomeArtistico asc;
    
    
select	tblfilme.nome as nomeFilme,
		tblfilme.dataLancamento,
		tblfilme.sinopse,
		tblclassificacao.nome as nomeClassificacao,
		tblgenero.nome as nomeGenero,
		tblator.nome as nomeAtor,
		tblator.dataNascimento,
		tbldiretor.nome as nomeDiretor,
		tblroteirista.nome as nomeRoteirista,
		tblatornacionalidade.idnacionalidade as nacionalidadeAtor        
from	tblClassificacao inner join tblfilme
			on tblClassificacao.idClassificacao = tblFilme.idClassificacao
		inner join tblFilmeGenero
			on tblFilme.idFilme = tblFilmeGenero.idFilme
		inner join tblGenero
			on tblGenero.idGenero = tblFilmeGenero.idGenero
		inner join tblatornacionalidade
			on tblAtor.idator = tblatornacionalidade.idAtor
		inner join tblAtor 
			on tblNacionalidade.idnacionalidade = tblnacionalidade.idNacionalidade;
		inner join tblDiretor 
			on tbl     
		
            
            
from	tblfilme, tblclassificacao, tblgenero, tblator, tbldiretor, tblroteirista, tblatornacionalidade;





            

            





