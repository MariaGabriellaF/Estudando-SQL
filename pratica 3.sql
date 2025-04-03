select *from Hospedes
select *from Estadias
select *from Quartos
select *from Servicos
select *from Solicitacoes

--Mostre os nomes dos h�spedes e a descri��o dos servi�os solicitados, para cada h�spede que
--solicitou servi�o no segundo semestre de 2023.

select nome, descricao, servico 
from Hospedes, Servicos, Solicitacoes 
where data between '01-06-2023' and '31-12-2023' and Hospedes.CPF = Solicitacoes.hospede and Solicitacoes.servico = Servicos.codServico

--b) Exiba os dados dos servi�os solicitados por h�spedes cujo nome tenha �Santos� em qualquer parte.
--Ordene pela descri��o do servi�o.

select se.*, h.nome
from Hospedes h, Servicos se, Solicitacoes so
where h.CPF = so.hospede and se.codServico = so.servico
and h.nome like '%Santos%' order by se.descricao

--c) Mostre os nomes dos h�spedes e quantidade de suas estadias, apenas para hospedes que tiveram
--estadias em quartos do tipo Standard ou Luxo Superior em 2012.

select nome, count(*) as 'Quantidade de estadia'
from Hospedes, Estadias, Quartos
where tipo in ('Standard', 'Luxo Superior')
and Hospedes.CPF = Estadias.hospede and Estadias.quarto = Quartos.numero
and dataEntrada between '01-01-2012' and '31-12-2012'
group by nome

--Mostre as datas de entrada e sa�da das estadias realizadas por h�spedes que informaram a data de
--nascimento. Ordene pela data de entrada em ordem descendente.
select h.nome, e.dataEntrada, e.dataSaida
from Hospedes h, Estadias e
where h.dataNascimento is not null 
and h.CPF = e.hospede 
order by e.dataEntrada desc

--e) Mostre a quantidade por sexo de cada servi�o solicitado.
select se.descricao, h.sexo, count(so.servico) as 'Quantidade de servi�os solicitados'
from Hospedes h, Servicos se, Solicitacoes so
where h.CPF=so.hospede and se.codServico = so.servico
group by h.sexo, se.descricao

--f) Exiba os distintos nomes dos h�spedes que tiveram estadias em quartos cujo valor da di�ria �
--maior que R$500, e que solicitaram servi�o de Lanchonete ou Passadeira.
select Distinct h.nome
from Hospedes h, Estadias e, Quartos q, Solicitacoes so, Servicos se
where q.valorDiaria > 500 and se.descricao in ('Lanchonete', 'Passadeira')
and h.CPF = e.hospede 
and e.quarto = q.numero
and se.codServico = so.servico
and so.hospede = h.CPF

--g) Mostre, para cada servi�o, a sua descri��o e uma m�dia de pre�os pagos, apenas para servi�os
--solicitados entre os anos de 2015 e 2018.

select se.descricao, AVG(preco) as 'M�dia de pre�os pagos'
from Servicos se, Solicitacoes so
where so.data between '01-01-2015' and '31-12-2018'
and se.codServico = so.servico
group by se.descricao

--h) Mostre, para cada quarto, o seu tipo, valor de di�ria e quantidade de estadias. Ordene pelo tipo do
--quarto.
select q.tipo, q.valorDiaria, COUNT(*) as 'Quantidade de estadias'
from Quartos q, Estadias e
where q.numero = e.quarto
group by q.tipo, q.valorDiaria
order by q.tipo asc

--i) Mostre os nomes dos h�spedes que pagaram pelo quarto com maior valor de di�ria.

select * from Quartos
select * from Estadias

select h.nome
from Hospedes h, Quartos q, Estadias e
where h.CPF = e.hospede and e.quarto = q.numero	
and q.valorDiaria = (select MAX(q2.valorDiaria) from Quartos q2)