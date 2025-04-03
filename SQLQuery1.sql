select *from Hospedes where dataNascimento is not null

select *from Hospedes order by nome


--Mostre, cada hospede, seu nome e a quantidade de estadia
 select Hospedes.nome, count(*) as 'Quantidade' from Hospedes, Estadias where Hospedes.CPF = Estadias.hospede  group by nome


 --Mostre, para cada hospede, o seu nome, o seu sexo, a quantidade de serviçois solicitados e uma media de preco pago pelos servicos

 select Hospedes.nome, Hospedes.sexo, count(*) as 'quantidade', AVG(Servicos.preco) as 'media de preco' 
 from Hospedes, Solicitacoes, Servicos 
 where Hospedes.CPF = Solicitacoes.hospede and Solicitacoes.servico = Servicos.codServico 
 group by Hospedes.nome, Hospedes.sexo



select Hospedes.nome, Hospedes.sexo, count(*) as 'quantidade', AVG(Servicos.preco) as 'media de preco' 
	from Hospedes, Servicos, Solicitacoes
	where Solicitacoes.hospede = Hospedes.CPF and Servicos.codServico = Solicitacoes.servico
	group by Hospedes.nome, Hospedes.sexo


 select *from Solicitacoes

  --Mostre, para cada hospede, o seu nome, o seu sexo, a quantidade de serviçois solicitados e uma media de preco pago pelos servicos.
  --Mostre apenas os hospedes cuja média de precos pagos seja maior que 60

  
select Hospedes.nome, Hospedes.sexo, count(*) as 'quantidade', AVG(Servicos.preco) as 'media de preco' 
	from Hospedes, Servicos, Solicitacoes
	where Solicitacoes.hospede = Hospedes.CPF and Servicos.codServico = Solicitacoes.servico
	group by Hospedes.nome, Hospedes.sexo
	having  AVG(Servicos.preco) >60

--mostrar nome do hospede mais velho
select nome from Hospedes where dataNascimento = (select MAX(dataNascimento) from Hospedes where sexo = 'F')