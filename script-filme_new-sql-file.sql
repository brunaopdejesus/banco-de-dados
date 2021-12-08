# INSERTS, UPDATES E DELETES
# começar pelas tables que não recebem fk (foreign key)
# usar aspas simples em TODOS os atributos, exceto INT

# insert de valores individual
insert into tblGenero (nome)
				values ('Romance');

             
# insert de múltiplos valores
insert into tblGenero (nome)
				values  ('Aventura'),
						('Animação'),
						('Musical'),
                        ('Policial'),
                        ('Fantasia');
                        
                        
# tabela de classificação
insert into tblClassificacao (nome)
					values  ('+10'),
							('+12'),
							('+14'),
							('+16'),
							('+18'),
                            ('Livre');
                            

# tabela de filme
insert into tblFilme (nome,
						duracao,
                        dataLancamento,
                        dataRelancamento,
                        sinopse,
                        nomeOriginal,
                        fotoCapa,
                        idClassificacao,
                        qtde
                        ) values 
							('Forrest Gump - O Contador de Histórias',
                             '02:20:00',
                             '1994-12-07',
                             null,
                             'Quarenta anos da história dos Estados Unidos, vistos pelos olhos de Forrest Gump (Tom Hanks), um rapaz com QI abaixo da média e boas intenções. Por obra do acaso, ele consegue participar de momentos cruciais, como a Guerra do Vietnã e Watergate, mas continua pensando no seu amor de infância, Jenny Curran.',
                             'Forrest Gump',
                             'filme03.jpg',
                             4,
                             3
                            ),
                            
                            ('À Espera de Um Milagre',
                             '03:09:00',
                             '2000-03-10',
                             null,
							 'Clássico da Disney, a animação acompanha Mufasa (voz de James Earl Jones), o Rei Leão, e a rainha Sarabi (voz de Madge Sinclair), apresentando ao reino o herdeiro do trono, Simba (voz de Matthew Broderick). O recém-nascido recebe a bênção do sábio babuíno Rafiki (voz de Robert Guillaume), mas ao crescer é envolvido nas artimanhas de seu tio Scar (voz de Jeremy Irons), o invejoso e maquiavélico irmão de Mufasa, que planeja livrar-se do sobrinho e herdar o trono.',
                             'The Green Mile',
                             'filme04.png',
                             4,
                             4
                            );
                            
                            
            
            
# tabela filmeGenero
insert into tblFilmeGenero (idFilme, idGenero)
					values  (1, 1),
							(2, 2),
							(2, 3),
							(2, 4);
                            
# update
update tblFilme set duracao = '03:00:00' 
				where idFilme = 1;
                
update tblFilme set sinopse = '1935, no corredor da morte de uma prisão sulista. Paul Edgecomb (Tom Hanks) é o chefe de guarda da prisão, que temJohn Coffey (Michael Clarke Duncan) como um de seus prisioneiros. Aos poucos, desenvolve-se entre eles uma relação incomum, baseada na descoberta de que o prisioneiro possui um dom mágico que é, ao mesmo tempo, misterioso e milagroso.'
	where idFilme = 4;

#delete
delete from tblGenero
			where idGenero = 7;  
                                        
select * from tblfilme;
select * from tblclassificacao;
select * from tblGenero;
select * from tblFilmeGenero;

# INSERTS
insert into tblSexo (nome)
			values ('Feminino'), ('Masculino');
            
insert into tblAtor (nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, foto, idSexo)
			values ('Timothy Francis Robbins',
					'Tim Robbins',
                    '1958-10-16',
                    null,
                    'Timothy Francis "Tim" Robbins, é um ator, roteirista, produtor, cineasta e músico norte-americano, vencedor do Óscar de Melhor Ator Coadjuvante pela sua atuação em Mystic River, de Clint Eastwood.',
                    'foto-ator-01.png',
                    2
            ),
            ('Morgan Freeman',
             'Morgan Freeman',
             '1937-06-01',
             null,
             'Morgan Porterfield Freeman Jr. é um premiado ator, produtor, narrador e cineasta estadunidense. Ele apareceu em uma variedade de gêneros de filmes retratando papéis de personagens e é particularmente conhecido por sua distinta voz profunda.',
             'foto-ator-02.png',
             2
            ),
            ('Manoel Garcia Júnior',
             'Garcia Júnior',
             '1967-03-02',
             null,
             'Manoel Garcia Júnior é um ator, dublador, radialista, tradutor e diretor de dublagem brasileiro. Manoel é filho dos também dubladores Garcia Neto e Dolores Machado.',
             'foto-ator-03.png',
             2
            ),
            ('Jorgeh José Ramos',
             'Jorgeh Ramos',
             '1941-02-03',
             '2014-12-01',
             'Jorgeh José Ramos foi um ator, locutor, poeta, jornalista, pintor e dublador brasileiro. Conhecido por ser a voz mais famosa de trailers no Brasil e por seu bordão: sexta-feira nos cinemas, trabalhou em diversos estúdios do Rio de Janeiro.',
             'foto-ator-04.png',
             2
            ),
            ('Gary Alan Sinise',
             'Gary Sinise',
             '1955-03-17',
             null,
			 'Gary Alan Sinise é um ator norte-americano, diretor de cinema e músico. Durante sua carreira, ganhou vários prêmios, incluindo um Emmy e um Globo de Ouro, além de ser nomeado para um Oscar. Também é conhecido por estrelar como o detetive Mac Taylor na série CSI: New York.',
             'foto-ator-05.png',
             2
            ),
            ('Michael Clarke Duncan',
             'Michael Clarke Duncan',
             '1957-12-10',
             '2012-09-03',
			 'Michael Clarke Duncan foi um ator e dublador norte-americano, mais conhecido por seu papel como John Coffey em The Green Mile, para o qual foi indicado a um Oscar e um Globo de Ouro.',
             'foto-ator-06.png',
             2
            );
            
insert into tblAtor (nome, nomeArtistico, dataNascimento, dataFalecimento, biografia, foto, idSexo)
			values ('Thomas Jeffrey Hanks',
					'Tom Hanks',
                    '1956-07-09',
                    null,
                    'Timothy Francis "Tim" Robbins, é um ator, roteirista, produtor, cineasta e músico norte-americano, vencedor do Óscar de Melhor Ator Coadjuvante pela sua atuação em Mystic River, de Clint Eastwood.',
                    'foto-ator-07.png',
                    2
            );
            desc tblAtor;
            select * from tblDiretor;
            
insert into tblDiretor (nome, dataNascimento, nomeArtistico, biografia, foto, idSexo) values
					   ('Frank Darabont',
                        '1959-01-28',
                        'Frank Darabont',
                        'Frank Darabont é um cineasta, roteirista e produtor de cinema francês radicado nos Estados Unidos. Fez várias adaptações dos livros de Stephen King.',
                        'foto-diretor-01.png',
                        2),
					   ('Roger Allers',
                        '1949-06-29',
                        'Roger Allers',
                        'Roger Allers é um diretor, roteirista, artista de storyboard, cartunista e dramaturgo americano. Ele é mais conhecido por co-dirigir o filme de animação tradicional de maior bilheteria na história, O Rei Leão da Walt Disney Animation Studios, e por escrever a adaptação da Broadway, O Rei Leão.',
                        'foto-diretor-02.png',
                        2),
					   ('Robert Lee Zemeckis',
                        '1951-05-14',
                        'Robert Zemeckis',
                        'Robert Lee Zemeckis é um cineasta, produtor e roteirista estadunidense. Sua família é de origem lituana e iugoslava.',
                        'foto-diretor-03.png',
                        2);
                       
insert into tblRoteirista (nome, idSexo) values
							('Frank Darabont',
							 2),
                            ('Eric Roth',
							 2), 
							('Linda Woolverton',
							 1),
							('Stephen King',
                             2);
                        
insert into tblNacionalidade (nome) values
							 ('Americano'),
							 ('Francês'),
							 ('Brasileiro');
            
desc tblGenero;
select * from tblGenero;

insert into tblGenero (nome) values
					  ('Romance'),
                      ('Comédia');
                      
desc tblEstudio;
select * from tblEstudio;

insert into tblEstudio (nome) values
					  ('Castle Rock Entertainment'),
                      ('Walt Disney Pictures'),
                      ('Fairview Entertainment'),
                      ('Paramount Pictures Studios'),
                      ('Warner Bros. Pictures');
                            
						

















