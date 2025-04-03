select * from Estadias

select * from Hospedes

select * from Quartos

select * from Servicos

select * from Solicitacoes

--Exiba os nomes de todos os hospedes.
select nome from Hospedes

--Exiba todos os dados dos serviços.
select * from Servicos

--Mostre o tipo, o valor da diária, e o lucro mensal de cada quarto (valor da diária * 31). Renomeie
--esta última coluna para Valor da Diária/Mês.
select tipo, valorDiaria, valorDiaria*31 as 'Diária/Mês.' from Quartos

--Mostre a soma e a média dos preços de todos os serviços.
select
	SUM(preco) as 'Soma total de preços',
	AVG(preco) as 'Média de preços'
	from Servicos

--Mostre o valor da diária do quarto mais caro e do mais barato.
select
	MAX(valorDiaria) MaiorDiaria,
	Min(valorDiaria) MenorDiaria
	from Quartos

--Exiba a data de nascimento do hóspede mais novo.
select
	Max(dataNascimento)
	from Hospedes

--Mostre quantos serviços foram solicitados pelo hóspede de CPF 922411035844.
select
	COUNT(servico)
	from Solicitacoes
	where hospede = '922411035844'

--Mostre quantos hóspedes distintos já tiveram estadias.
select
	count (distinct hospede)
	from Estadias

--Mostre a descrição, preço e o preço com 35% de aumento, de todos os serviços.
select
	descricao,
	preco,
	preco * 0.35 + preco
	from Servicos

--Quais os dados dos quartos que possuem valor de diária maior que R$ 300?
select * from Quartos where valorDiaria > 300

--Mostre os dados de todos os hóspedes que tiveram estadias no ano de 2018.
select h.* 
	from Hospedes as h, Estadias as e 
	where dataEntrada between '01-01-2018' and '31-12-2018' and h.cpf = e.hospede --tem q bater a chave primaria com a chave estrangeira

--Exiba os dados dos serviços solicitados em setembro de 2023.
select Servicos.*
	from Servicos, Solicitacoes
	where data between '01-09-2023' and '30-09-2023' and Servicos.codServico = Solicitacoes.servico
	--se tiver N tabelas vou ter N-1 de junção de chave estrangeira

--Exiba os nomes dos hóspedes e a hora da solicitação do serviço, para hospedes que solicitaram
--serviços de Lavanderia ou de Babá.
select Hospedes.nome, Solicitacoes.data, Solicitacoes.hora ,Servicos.codServico
	from Hospedes, Solicitacoes, Servicos
	where Servicos.descricao in ('Lavanderia', 'Babá')
	and Hospedes.CPF = Solicitacoes.hospede and Servicos.codServico = Solicitacoes.servico
	-- usa o in quando precisar fazer um 'OU'

--Mostre quantos serviços foram solicitados por hóspedes do sexo masculino, no primeiro semestre
--de 2012.
select count (Solicitacoes.servico)
	from Servicos, Solicitacoes, Hospedes
	where Hospedes.sexo = 'M' and Solicitacoes.data between '01-01-2012' and '30-06-2012' 
	and Hospedes.CPF = Solicitacoes.hospede and Servicos.codServico = Solicitacoes.servico
