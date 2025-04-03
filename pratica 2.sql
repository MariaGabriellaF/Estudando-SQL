select * from Estadias

select * from Hospedes

select * from Quartos

select * from Servicos

select * from Solicitacoes

--Exiba os nomes de todos os hospedes.
select nome from Hospedes

--Exiba todos os dados dos servi�os.
select * from Servicos

--Mostre o tipo, o valor da di�ria, e o lucro mensal de cada quarto (valor da di�ria * 31). Renomeie
--esta �ltima coluna para Valor da Di�ria/M�s.
select tipo, valorDiaria, valorDiaria*31 as 'Di�ria/M�s.' from Quartos

--Mostre a soma e a m�dia dos pre�os de todos os servi�os.
select
	SUM(preco) as 'Soma total de pre�os',
	AVG(preco) as 'M�dia de pre�os'
	from Servicos

--Mostre o valor da di�ria do quarto mais caro e do mais barato.
select
	MAX(valorDiaria) MaiorDiaria,
	Min(valorDiaria) MenorDiaria
	from Quartos

--Exiba a data de nascimento do h�spede mais novo.
select
	Max(dataNascimento)
	from Hospedes

--Mostre quantos servi�os foram solicitados pelo h�spede de CPF 922411035844.
select
	COUNT(servico)
	from Solicitacoes
	where hospede = '922411035844'

--Mostre quantos h�spedes distintos j� tiveram estadias.
select
	count (distinct hospede)
	from Estadias

--Mostre a descri��o, pre�o e o pre�o com 35% de aumento, de todos os servi�os.
select
	descricao,
	preco,
	preco * 0.35 + preco
	from Servicos

--Quais os dados dos quartos que possuem valor de di�ria maior que R$ 300?
select * from Quartos where valorDiaria > 300

--Mostre os dados de todos os h�spedes que tiveram estadias no ano de 2018.
select h.* 
	from Hospedes as h, Estadias as e 
	where dataEntrada between '01-01-2018' and '31-12-2018' and h.cpf = e.hospede --tem q bater a chave primaria com a chave estrangeira

--Exiba os dados dos servi�os solicitados em setembro de 2023.
select Servicos.*
	from Servicos, Solicitacoes
	where data between '01-09-2023' and '30-09-2023' and Servicos.codServico = Solicitacoes.servico
	--se tiver N tabelas vou ter N-1 de jun��o de chave estrangeira

--Exiba os nomes dos h�spedes e a hora da solicita��o do servi�o, para hospedes que solicitaram
--servi�os de Lavanderia ou de Bab�.
select Hospedes.nome, Solicitacoes.data, Solicitacoes.hora ,Servicos.codServico
	from Hospedes, Solicitacoes, Servicos
	where Servicos.descricao in ('Lavanderia', 'Bab�')
	and Hospedes.CPF = Solicitacoes.hospede and Servicos.codServico = Solicitacoes.servico
	-- usa o in quando precisar fazer um 'OU'

--Mostre quantos servi�os foram solicitados por h�spedes do sexo masculino, no primeiro semestre
--de 2012.
select count (Solicitacoes.servico)
	from Servicos, Solicitacoes, Hospedes
	where Hospedes.sexo = 'M' and Solicitacoes.data between '01-01-2012' and '30-06-2012' 
	and Hospedes.CPF = Solicitacoes.hospede and Servicos.codServico = Solicitacoes.servico
