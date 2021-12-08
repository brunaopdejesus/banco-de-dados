#RETORNA A DATA ATUAL DO SERVIDOR
select curdate() as dataAtual;
select current_date() as dataAtual;

#RETORNA A HORA ATUAL DO SERVIDOR
select curtime() as horaAtual;
select current_time() as horaAtual;

#RETORNA A DATA E HORA ATUAIS DO SERVIDOS	
select current_timestamp() as dataHoraAtual;


#FUNÇÕES DE FORMTAÇÃO DE HORA
select time_format(curtime(), '%H') as hora;
select time_format(curtime(), '%i') as minuto;
select time_format(curtime(), '%s') as segundo;
select time_format(curtime(), '%H:%i') as horaMinuto;
select time_format(curtime(), '%r') as horaAMPM; #00 até 12
select time_format(curtime(), '%T') as hora24h; #00 até 24
 
#hour(), minute(), second()
select hour(curtime()) as hora;
select minute(curtime()) as minutos;
select second(curtime()) as segundos;

#timediff() - calcula a diferença entre horas
select timediff(curtime(), '06:00:00') as diferencaHora;


#FUNÇÕES DE FORMATAÇÃO DE DATA
select date_format(curdate(), '%W') as diaSemana;
select date_format(curdate(), '%w') as numeroDiaSemana; #segunda = 1,... domingo = 0
select date_format(curdate(), '%a') as diaSemana;
select date_format(curdate(), '%m') as mes;
select date_format(curdate(), '%b') as mes;
select date_format(curdate(), '%M') as mes;
select date_format(curdate(), '%d') as dia;
select date_format(curdate(), '%y') as ano;
select date_format(curdate(), '%Y') as ano;

select date_format(curdate(), '%Y-%m-%d') as dataFormatada;
select date_format(curdate(), '%d-%m-%Y') as dataFormatada;

select day(curdate()) as dia;
select month(curdate()) as mes;
select year(curdate()) as ano;

#datediff - calcula a diferença entre datas
select datediff(curdate(), '2021-11-23') as diferencaData;

select week(curdate()) as numeroDaSemana;

#segunda = 0 ... domingo = 6
select weekday('2021-11-23') as numeroDaSemana;
select weekofyear(curdate()) as numeroDaSemana;
select yearweek('2021-11-23') as anoNumeroSemana;

select dayofyear(curdate());

 

 