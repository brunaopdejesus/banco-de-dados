#concat() - permite realizar a concatenação de dados
select concat('Filme: ', nome) as nomeFilme, nome,
	   concat('O filme ', nome, ' tem duração de ', duracao) as resultado
	from tblFilme;
    
#concat_ws() - permite realizar a concatenção dos dados, utilizando um caracter de separação entre os dados
select concat_ws(' | ', nome, duracao, dataLancamento) as resultadoConcat_ws
	from tblfilme;
    
#locate() - retorna a posição da palavra ou caracter desejado
select locate('mufasa', sinopse) as resultadoLocate, sinopse
	from tblfilme;
    
#reverse() - permite inverter o conteúdo de uma coluna
select reverse(nome) as resultadoReverse
	from tblfilme;
    
#length ou char_length - retorna a quantidade de caracteres de uma coluna
select length(nome) as qtde,
	   char_length(nome) as qtdeChar
	from tblfilme;

#insert() - permite inserir um novo conteúdo dentro do texto de uma coluna
#insert(Coluna, Posição de início do novo conteúdo, qtde de caracteres que serão removidos, novo conteúdo que será inserido)
select insert(sinopse, 5, 0, ' videolocadora ') as resultadoInsert,
	sinopse
	from tblfilme;

select locate('prisão', sinopse) as locatePrisao
	from tblfilme;
  
#ex: <b>prisão</b>  
select insert(sinopse, locate('prisão', sinopse), length('prisao'), '<b>prisão</b>') as insertPrisao
	from tblfilme;
    
#substr() - permite retirar um pedaço de um conteúdo
select concat(substr(sinopse, 1, locate('.', sinopse)), ' <a href="pagina.php">Saiba mais...</a>') as resultadoSubstr
	from tblfilme;
    
#replace() - permite localizar um conteúdo e substituir por outra coisa
select replace(sinopse, 'prisão', '<b>prisão</b>') as resultadoReplace
	from tblfilme;
    
select * from tblfilme;

alter table tblFilme
	add column valor float;
    
update tblfilme set valor = '9.75' where idFilme = 4;

#multipliquei o valor 
select nome, qtde, valor, round((qtde * valor), 2) as valorTotal
	from tblFilme;
  
#aplicando 10% de desconto no valor original
select nome, sinopse, 
	   concat('R$', round(valor, 2)) as valorOriginal,
	   concat('R$', round((valor - (valor * 10)/100), 2)) as valorDesconto
	from tblfilme;
    
    


    
