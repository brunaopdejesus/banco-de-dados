#cria um database novo no BD
create database dbFilmesTurmaB;

#permite visualizar os databases existentes no BD
show databases;

#permite apagar um database do BD
drop database dbFilmesTurmaB;

#seleciona o database a ser utilizado
use dbFilmesTurmaB;


#cria uma tabela e seus atributos
#tabela Classificação
create table tblClassificacao (
	idClassificacao int not null auto_increment primary key,
    nome varchar(20) not null,
    unique index(idClassificacao)
);

#permite visualizar as tabelas existentes no database
show tables;

#tabela Sexo
create table tblSexo (
	idSexo int not null auto_increment,
    nome varchar(10) not null,
    primary key(idSexo),
    unique index (idSexo)
);

#permite visualizar a descrição da estrutura da tabela
desc tblFilme;

#tabela Gênero
create table tblGenero (
	idGenero int not null auto_increment primary key,
    nome varchar(30) not null,
    unique index (idGenero)
);

#tabela Estúdio
create table tblEstudio (
	idEstudio int not null auto_increment primary key,
    nome varchar(50) not null, 
    unique index (idEstudio)
);

#tabela Nacionalidade
create table tblNacionalidade (
	idNacionalidade int not null auto_increment primary key,
    nome varchar(20) not null, 
    unique index (idNacionalidade)
);

#tabela Filme
create table tblFilme (
	idFilme int not null auto_increment primary key,
		unique index (idFilme),
    nome varchar(80) not null,
    nomeOriginal varchar(80),
    duracao time not null,
    dataLancamento date not null,
    dataRelancamento date,
    sinopse text not null,
    fotoCapa varchar(80),
		idClassificacao int not null,
        constraint FK_Classificacao_Filme #define um nome para o relacionamento
        foreign key (idClassificacao) #especifica quem será a FK nesta tabela
        references tblClassificacao (idClassificacao) #especifica de qual tabela virá a PK
);

#tabela Diretor
create table tblDiretor (
	idDiretor int not null auto_increment primary key,
		unique index (idDiretor),
	nome varchar(80) not null,
	dataNascimento date not null,
    nomeArtistico varchar(80),
    biografia text,
    foto varchar(80),
		idSexo int not null,
        constraint FK_Sexo_Diretor
        foreign key (idSexo)
        references tblSexo (idSexo)
);

show tables;

#tabela Filme Diretor
create table tblFilmeDiretor (
	idFilmeDiretor int not null auto_increment primary key,
		unique index (idDiretor),
        
	#relacionamento com Filme - FOREIGN KEY
	idFilme int not null,
		constraint FK_Filme_FilmeDiretor
        foreign key (idFilme)
        references tblFilme (idFilme),
        
	#relacionamento com Diretor - FOREIGN KEY
    idDiretor int not null,
		constraint FK_Diretor_FilmeDiretor
        foreign key (idDiretor)
        references tblDiretor (idDiretor)
);

alter table tblFilmeDiretor
	add unique index (idFilmeDiretor);
	

#tabela Ator
create table tblAtor (
	idAtor int not null auto_increment primary key,
		unique index (idAtor),
	nome varchar(8),
    nomeArtistico varchar(80),
    dataNasc date not null,
	dataFalecimento date,
    biografia text,
    
    idSexo int not null
);

desc tblAtor;

#alterando a estrutura de uma tabela
#reescrever todas as características, mesmo as que estiverem corretas
##MODIFY COLUMN - Permite alterar as propriedades de um atributo
alter table tblAtor
	modify column nome varchar(80) not null;

##CHANGE COLUMN - Permite mudar a escrita e as propriedades de um atributo
alter table tblAtor
	change column dataNasc dataNascimento date not null;
    
##ADD COLUMN - Permite adicionar um novo atributo
alter table tblAtor
	add column foto varchar(80);

##ADD CONSTRAINT - Permite adicionar um relacionamento em uma tabela já existente
alter table tblAtor
	add constraint FK_Sexo_Ator
		foreign key (idSexo)
        references tblSexo (idSexo);

#adicionando uma nova unique index()
alter table tblAtor
	add unique index(idAtor, foto);
    
##DROP COLUMN - Permite apagar um atributo
alter table tblAtor
	drop column idSexo;

##DROP FOREIGN KEY - Permite apagar o relacionamento
alter table tblAtor
	drop foreign key FK_Sexo_Ator;

#como verificar as constraints existentes em uma tabela
SELECT
	CONSTRAINT_NAME,
		REFERENCED_TABLE_NAME,
		REFERECEND_COLUMN_NAME
    FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
    WHERE REFERENCED_TABLE_NAME = 'tblFilme';
    
    
alter table tblAtor
	add column idSexo int not null,
	add constraint FK_Sexo_Ator
        foreign key (idSexo)
        references tblSexo(idSexo);
        
desc tblAtor;

#apagar tabela    
drop table tblAtor;   


create table tblFilmeAtor (
	idFilmeAtor int not null auto_increment primary key,
		unique index(idFilmeAtor),
        
	idAtor int not null,
		constraint FK_Ator_FilmeAtor
        foreign key (idAtor)
        references tblAtor (idAtor),
        
	idFilme int not null, 
		constraint FK_Filme_FilmeAtor
        foreign key (idFilme)
        references tblFilme (idFilme)
	
);

create table tblDiretorNacionalidade (
	idDiretorNacionalidade int not null auto_increment primary key,
		unique index (idDiretorNacionalidade),
	
    idDiretor int not null, 
		constraint FK_Diretor_DiretorNacionalidade
        foreign key (idDiretor)
        references tblDiretor (idDiretor),
        
	idNacionalidade int not null, 
		constraint FK_Nacionalidade_DiretorNacionalidade
        foreign key (idNacionalidade)
        references tblNacionalidade (idNacionalidade)
);

show tables;

create table tblAtorNacionalidade (
	idAtorNacionalidade int not null auto_increment primary key, 
		unique index (idAtorNacionalidade),
	
    idAtor int not null,
		constraint FK_Ator_AtorNacionalidade
        foreign key (idAtor)
        references tblAtor (idAtor),
    
    idNacionalidade int not null, 
		constraint FK_Nacionalidade_AtorNacionalidade
        foreign key (idNacionalidade)
        references tblNacionalidade (idNacionalidade)
);

create table tblRoteirista (
	idRoteirista int not null auto_increment primary key,
		unique index (idRoteirista),
	nome varchar(80) not null,
	
    idSexo int not null,
		constraint FK_Sexo_Roteirista
        foreign key (idSexo)
        references tblSexo (idSexo)
);

create table tblRoteiristaNacionalidade (
	idRoteiristaNacionalidade int not null auto_increment primary key,
		unique index (idRoteiristaNacionalidade),

	idRoteirista int not null,
		constraint FK_Roteirista_RoteiristaNacionalidade
        foreign key (idRoteirista)
        references tblRoteirista (idRoteirista),
        
	idNacionalidade int not null,
		constraint FK_Nacionalidade_RoteiristaNacionalidade
        foreign key (idNacionalidade)
        references tblNacionalidade (idNacionalidade)
);

create table tblFilmeRoteirista (
	idFilmeRoteirista int not null auto_increment primary key,
		unique index (idFilmeRoteirista),
    
    idFilme int not null,
		constraint FK_Filme_FilmeRoteirista
        foreign key (idFilme)
        references tblFilme (idFilme),
        
	idRoteirista int not null,
		constraint FK_Roteirista_FilmeRoteirista
        foreign key (idRoteirista)
        references tblRoteirista (idRoteirista)
);

create table tblFilmeGenero (
	idFilmeGenero int not null auto_increment primary key,
		unique index (idFilmeGenero),

	idFilme int not null,
		constraint FK_Filme_FilmeGenero
        foreign key (idFilme)
        references tblFilme (idFilme),
        
	idGenero int not null,
		constraint FK_Genero_FilmeGenero
        foreign key (idGenero)
        references tblGenero (idGenero)
);

create table tblFilmeEstudio (
	idFilmeEstudio int not null auto_increment primary key,
		unique index (idFilmeEstudio),
    
    idEstudio int not null,
		constraint FK_Estudio_FilmeEstudio
        foreign key (idEstudio)
        references tblEstudio (idEstudio),
        
	idFilme int not null,
		constraint FK_Filme_FilmeEstudio
        foreign key (idFilme)
        references tblFilme (idFilme)
);

show tables;
select * from tblatornacionalidade;
select * from tblator;
select * from tblnacionalidade;

insert into tblatornacionalidade (idAtor, idNacionalidade) values 
									(1, 1);
insert into tblatornacionalidade (idAtor, idNacionalidade) values 
									(2, 1);
insert into tblatornacionalidade (idAtor, idNacionalidade) values 
									(3, 1),
                                    (4, 3),
                                    (5, 3),
                                    (6, 1),
                                    (7, 1);
                                    
select * from tbldiretornacionalidade;
select * from tbldiretor;
select * from tblnacionalidade;

insert into tbldiretornacionalidade (idDiretor, idNacionalidade) values 
									(1, 1),
                                    (2, 1),
                                    (3, 1);
                                    

select * from tblator;
select * from tblfilme;
select * from tblfilmeator;

insert into tblfilmeator (idFilme, idAtor) values
						 (1, 1),
						 (1, 2),
						 (2, 3),
						 (2, 4),
						 (3, 7),
						 (3, 5),
						 (4, 7),
						 (4, 6);
                         
                                                  
select * from tblfilme;
select * from tblroteirista;
select * from tblfilmeroteirista;

insert into tblfilmeroteirista (idFilme, idroteirista) values
						 (1, 1),
						 (2, 3),
						 (3, 2), 
						 (4, 4);                     
                         

                         
select * from tblfilme;
select * from tbldiretor;
select * from tblfilmediretor;
insert into tblFilmeDiretor (idFilme, idDiretor) values
						 (1, 1),
						 (2, 2),
						 (3, 3),
                         (4, 1);
/*
show tables;
#ADICIONAR DADOS!!!
	select * from tblfilmediretor; # !!!!!

desc tbldiretor;
desc tblfilmediretor;

#ALTERAR IDDIRETOR NA TBLFILMEDIRETOR, ESTÁ COMO UNIQUE INDEX

alter table tblfilmediretor
		add constraint FK_Diretor_FilmeDiretor
        foreign key (idDiretor)
        references tblDiretor (idDiretor);
        
alter table tblfilmediretor
    drop column idDiretor;
    
alter table tblfilmediretor
	add column idDiretor int not null;
    
alter table tblfilmediretor
	add constraint FK_Diretor_FilmeDiretor
        foreign key (idDiretor)
        references tblDiretor (idDiretor);

delete from tblfilmediretor;

alter table tblfilmediretor
	add constraint FK_Diretor_FilmeDiretor
        foreign key (idDiretor)
        references tblDiretor (idDiretor);
*/




