select tipo
from Quartos
where valorDiaria = (Select MAX(valorDiaria) from Quartos)

--qual nome do hospedeq solicitou o serviço mais barato?

select h.nome
from Hospedes h, Solicitacoes so, Servicos se
where so.servico = se.codServico and so.hospede = h.CPF
and se.preco = (select MIN(preco) from Servicos )

select * from Solicitacoes

--fazer sub-consultas sem juntar tabelas

--ele elimina os repitidos
select nome from Hospedes
where cpf in (select hospede from Solicitacoes
where servico in (select codServico from Servicos 
where preco = (select MIN(preco) from Servicos)))

--sub-consulta com join (aqui só mutiplica as linhas q eu quero, é mais rapido)
select h.nome, so.data
from Hospedes h join Solicitacoes so on h.CPF = so.hospede join Servicos se on se.codServico = so.servico
where se.preco = (Select Min(preco) from Servicos)

--quais os serviços solicitados em 2023 por hospedes do sexo Masculino?
select *
from Servicos se join Solicitacoes so on se.codServico = so.servico join Hospedes h on so.hospede = h.CPF
where so.data between '01-01-2023' and '31-12-2023' and h.sexo = 'M'

--outra forma
select *
from Servicos 
where codServico in (Select servico from Solicitacoes
where data between '01-01-2023' and '31-12-2023'
and Hospede in (Select cpf from Hospedes
where sexo = 'M'))