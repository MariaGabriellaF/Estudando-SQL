select * from Pais
select * from Cidade
select * from Cliente
select * from Tipo
select * from Produto
select * from Funcao
select * from Setor
select * from Funcionario
select * from Pedido
select * from Itens
select * from Produto

--a) Exibir c�digo, nome, pre�o de custo, pre�o de venda e a diferen�a entre estes dois pre�os para todos
--os produtos.
select p.codigo ,p.nome, p.custo, p.venda, p.venda-p.custo as 'Diferen�a entre pre�o de venda e pre�o de custo'
from Produto p

--b) Mostre todos os pedidos realizados no ano de 2009.
select *
from Pedido p
where p.dataPedido between '01-01-2009' and '31-12-2009'

--c) Mostre quantos funcion�rios tem e-mail

select count(*)
from Funcionario f
where f.email is not null


--d) Exibir c�digo e nome de todos os funcion�rios que tenham �Silva� em qualquer parte do nome

select f.codigo, f.nome
from Funcionario f
where f.nome like '%Silva%'


--e) Mostre os produtos comprados por clientes pessoa jur�dica.

select pr.*
from Cliente c, Pedido p, Itens i, Produto pr
where c.tipo = 'PJ'
and c.codigo = p.cliente
and i.produto = pr.codigo
and p.codigo = i.pedido

--f) Mostre os nomes e as cidades que nasceram os funcion�rios que realizaram pedidos de Liquidificador.

select f.nome, c.nome
from Funcionario f, Pedido p, Itens i, Produto pr, Cidade c
Where pr.nome = 'Liquidificador'
and f.naturalidade = c.codigo
and pr.codigo = i.produto
and i.pedido = p.codigo
and f.codigo = p.vendedor

--g) Exiba nome e tipo dos clientes que foram atendidos por funcion�rios que n�o moram no Bessa nem em
--Mana�ra.

select c.nome, c.tipo
from Cliente c, Funcionario f, Pedido p
where f.bairro not in ('Bessa', 'Mana�ra')
and p.cliente = c.codigo
and p.vendedor = f.codigo

--h) Mostre os nomes dos funcion�rios que realizaram algum pedido para clientes que moram no Rio de
--Janeiro.

select f.nome, ci.nome
from Funcionario f, Cliente c, Pedido p, Cidade ci
where ci.nome = 'Rio de Janeiro'
and p.vendedor = f.codigo
and p.cliente = c.codigo
and c.cidade = ci.codigo

--i) Mostre nome, descri��o e data da compra dos produtos comprados entre 2020 e 2022. Ordene pela
--data em ordem descendente.

select pr.nome, pr.descricao, p.dataPedido
from Produto pr, Pedido p, Itens i
where p.dataPedido between '01-01-2020' and '31-12-2022'
and i.produto = pr.codigo
and i.pedido = p.codigo
order by p.dataPedido desc


--j) Mostre para cada funcion�rio o seu nome e a quantidade de vendas realizadas.

select f.nome, count (p.vendedor) as 'Quantide de vendas'
from Funcionario f, Pedido p
where p.vendedor = f.codigo
group by f.nome

--k) Mostre o nome do produto, o seu valor de venda, a quantidade vendida e a soma dos pre�os de venda
--destes produtos comprados, que possuem quantidade em estoque entre 10 e 100 itens, apenas para
--os produtos cuja esta soma seja maior do que R$2000,00.

select pr.nome, pr.venda, count(*), SUM (pr.venda), pr.quantest
from Produto pr, Itens i
where i.produto = pr.codigo
and pr.quantest between 10 and 100
group by pr.nome, pr.venda, pr.quantest
having Sum(pr.venda) > 2000


--l) Exibir o c�digo do produto e a quantidade de pedidos feitos para os produtos que foram pedidos mais
--do que 30 vezes.

select produto, count(*)
from Itens
group by produto
having count(*) >30