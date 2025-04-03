select * from Hospedes

select * from Quartos

select * from Estadias

select * from Servicos

select * from Solicitacoes

select
	SUM(valorDiaria) as totalDiaria,
	AVG(valorDiaria) 'Média Diária',
	MAX(valorDiaria) as 'maiorValorDiaria',
	MIN(valorDiaria) MenorDiaria
	from Quartos

select distinct hospede from Estadias

select count (*) from Hospedes

select count (dataNascimento) from Hospedes

select * from Hospedes where dataNascimento >= '01-01-1990' and dataNascimento <= '31-12-1990'

select * from Hospedes where dataNascimento between '01-01-1990' and '31-12-1990'

select nome, dataEntrada 
from Hospedes, Estadias 
where dataEntrada between '01-01-2024' and '31-12-2024'
and Hospedes.cpf = Estadias.hospede