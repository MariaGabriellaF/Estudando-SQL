--aula 03.04

--função TOP -> limitar o topo dos resultados que vai ser mostrado na tela (pegar o topo da tabela)
-- sintaxe: SELECT top n coluna FROM tabela
--percent : vai pegar o porcento

select top 2 nome from Hospedes
select top 20 percent nome from Hospedes

--Datepart
select DATEPART (yy, dataNascimento), nome from Hospedes
select nome, year(dataNascimento) from Hospedes

--getdate
select GETDATE()

--datename
select datename(mm, getdate())
select datename(dw, GETDATE())

--datediff
--faz a diferença de duas datas
select datediff (yy, dataEntrada, GETDATE()) from Estadias

--dateadd adiciona uma parte na data
select dateadd(dd, 5, GETDATE())

--quais os dados as estadias que aconteceram nos ultimos 3 anos?
select * 
from Estadias e
where datediff (yy, e.dataEntrada, GETDATE()) <= 3

--criação de tabelas com consultas (guarda os dados da consulta em uma tabela), essa não esta atualizada

select nome into tabtemp from Hospedes
select * from tabtemp

--views (n consegue alterar uma view, só consultar), ela está sempre atualizada
create view NomeHospedes as
select nome from Hospedes

select * from NomeHospedes

--Qual o nome do hóspede que teve mais estadias?

create view Desafio as
select h.nome, count(*) qtd
from Hospedes h join Estadias e on h.CPF= e.hospede
group by h.nome

select * from Desafio

select nome from Desafio
where qtd = (select MAX(qtd) from Desafio)
