select * from tbl_;

use db_video_locadora;

-- TRABALHANDO COM DATA E HORA --

-- Funções para retornar a data atual do servidor (onde ele está instalado)
select curdate() as data_atual;
select current_date() as data_atual;

-- Funções para retornar a hora atual do servidor (onde ele está instalado)
select curtime() as hora_atual;
select current_time() hota_atual;

-- Função que retorna a data e a hora do servidor (onde ele está instalado)
select current_timestamp() as data_hora_atual;

-- Funções para formatar hora
	# time_format
	select time_format(curtime(), '%H') as hora; -- '%H': horas de 00-23
	select time_format(curtime(), '%h') as hora; -- '%h': horas de 00-12
    
	select time_format(curtime(), '%i') as minuto;
	select time_format(curtime(), '%m') as minuto; -- '%m': tambén usado para mês
    
	select time_format(curtime(), '%s') as segundo;
    
    select time_format(curtime(), '%r') as hora_completa; -- '%r': hora completa de 00-12 em AM/PM
	
    select time_format(curtime(), '%T') as hora_completa; --  mesmo retorno de 'curtime()'
    
	select time_format(curtime(), '%h%:%i') as hora_minuto; -- combinação de parâmetros
    
    # funções para retornar somente hora, minuto e segundo (mesmo retorno da função anterior)
    select hour(current_time()) as hora;
    select minute(current_time()) as minuto;
    select second(current_time()) as segundo;
    
-- Funções para formatar data
	# date_format
    select date_format(curdate(), '%W') as dia_semana; -- 'W': nome do dia da semana
    select date_format(curdate(), '%w') as numero_semana; -- 'w': dia da semana em numeral (0: domingo [...] 6: sábado)
    select date_format(curdate(), '%a') as dia_semana_abreviado; -- '%a': (tue: tuesday)
    
    select date_format(curdate(), '%M') as nome_mes;
    select date_format(curdate(), '%m') as numero_mes;
    select date_format(curdate(), '%b') as nome_mes_abreviado; -- '%b': (nov: november)
    
    select date_format(curdate(), '%d') as dia_atual;
    
    select date_format(curdate(), '%Y') as ano; -- 'Y': ano atual com quatro digitos
    select date_format(curdate(), '%y') as ano; -- 'Y': ano atual com os últimos dois digitos
    
    select date_format(curdate(), '%d/%m/%Y') as dia_mes_ano; -- combinação de parâmetros para formatar a data no padrão brasileiro
    
	# funções para retornar somente o dia, mes e ano
    select day(current_time()) as dia;
    select month(current_time()) as mes;
    select year(current_time()) as ano;
    
-- Funções paara calcular diferência de hora e data
	select timediff('15:00:00', '10:00:00') as intervalo_hora; -- calcula diferênca de horas
	select datediff('2022-11-22', '2022-11-20') as intervalo_dia; -- calcula diferênca de dias
    
    # SITUAÇÃO: cálculo de valor a pagar em uma diária de R$45,00
	select concat('R$', (datediff('2022-11-22', '2022-11-20') * 45.00)) as valor_pagar;
    
-- função para retornar somente a data
select date(current_timestamp());
    
-- função para retornar somente a hora
select time(current_timestamp());
