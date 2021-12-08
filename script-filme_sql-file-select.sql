# SELECT
/* DIVISÃO DO SELECT:
	select - especifica as colunas que serão visualizadas
    from - especifica as tabelas que serão utilizadas na consulta
    where - especifica o critério de filtro
*/
/* se for selecionar mais de uma tabela:
	   select tblFilme.nome, tblFilme.sinopse from tbl...
*/


# permite visualizar todas as colunas e todos os registros de uma tabela (*), duas formas
select * from tblfilme;
select tblFilme.* from tblFilme;


# permite visualizar colunas especificas da tabela
select nome, sinopse from tblFilme;

# as - significa alias (permite criar um apelido para o nome de uma coluna ou de uma tabela
select nome, duracao, sinopse from tblFilme;

# apelidos SEMÂNTICOS
select filme.nome as nomeFilme, filme.duracao, filme.sinopse 
	from tblFilme as filme;
    
    
select nome, sinopse from tblFilme where idFilme = 2;

select nome, sinopse 
	from tblFilme 
    where nome like '%liberdade%';
    
/*
	OPERADORES DE COMPARAÇÃO:
		=
		<
		>
		<> (diferente)
		<=
		>= 
        like
			= busca pela igualdade do valor
			like %var no início = busca pelo término da string
			like var% no final = busca pelo início da string
			like %var% no início e no final = busca por qualquer parte da string
            
		OPERADORES LÓGICOS:
		and
        or
        not
*/

select * from tblFilme;

alter table tblFilme
	add column qtde int;

update tblFilme set qtde = 5 where idFilme = 1;
update tblFilme set qtde = 8 where idFilme = 2;

select * from tblFilme
	where qtde <=6;
    
# Exemplo de operadores lógicos
select * from tblFilme
	where qtde >=6 and qtde <=10;
    
select * from tblFilme
	where qtde <=6 or qtde >=10;
    
select * from tblFilme
	where not(qtde >=6 and qtde <=10);
    
select * from tblFilme
	where qtde = 2 or 
		  qtde = 5 or 
          qtde = 8 or 
          qtde = 10;
          
# in - permite buscar no mesmo atributo por vários valores, não precisando digitar o atributo várias vezes
# Só funciona com o operador lógico OR
select * from tblFilme
	where qtde in (2, 5, 8, 10);
    
select * from tblFilme
	where qtde not in (2, 5, 8, 10);

# between - retorna os dados em range (intervalo) de valores
select * from tblFilme
	where qtde between 6 and 10;
    
select * from tblFilme
	where qtde not between 6 and 10;    
    
# Ordenação de dados
# order by asc - ordena de forma crescente
# order by desc - ordena de forma decrescente
# deve ser sempre o último comando no select
select * from tblfilme order by nome asc;
select * from tblfilme order by nome desc;
select * from tblfilme order by nome asc, duracao desc;

# limit
select * from tblfilme limit 2;
select * from tblfilme order by idFilme asc limit 1;
select * from tblfilme order by idFilme desc limit 1;

# count - retorna a quantidade de itens no select
select count(*) as qtdeFilmes from tblfilme;
select count(*) as qtdeFilmes, 
	   count(dataRelancamento) as qtdeFilmesDataRelacancamento
	from tblfilme;
select count(*) as qtdeClassificacao from tblFilme 
	where idClassificacao = 4;

# min - retorna o menor valor do select
# max - retorna o maior valor do select
select min(qtde) as qtdeMinima from tblFilme;
select max(qtde) as qtdeMinima from tblFilme;

# sum() - realiza a soma de valores de uma coluna
select sum(qtde) as somaQtdeFilmes from tblfilme;

# avg() - calcula a média de valores de uma coluna
# round() - permite especificar a qtde de casas decimais
select round(avg(qtde), 1) as mediaQtdeFilmes from tblFilme;

/*
	select - especifica as colunas que serão visualizadas
    from - especifica as colunas que serão utilizadas na consulta
    where - especifica o critério de filtro

*/






