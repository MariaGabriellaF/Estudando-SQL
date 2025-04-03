create database Clinica

use clinica

create table Pacientes(
	codP int not null identity,
	nome varchar(80) not null,
	cpf varchar(14) not null,
	sexo varchar(1) not null,
	idade int not null, 
	convenio varchar(80),
	primary key (codP),
	unique(cpf),
	check (sexo in ('M','F'))
	)

--	Medicos (codM (PK), nome, especialidade, turno, salario)
create table Medicos(
	codM int not null identity,
	nome varchar(80) not null,
	especialidade varchar(80) not null,
	turno varchar(10) not null, 
	salario int not null,
	primary key (codM),
	check (turno in ('manha', 'tarde', 'noite'))
)

--Consultas (paciente (FK), medico (FK), data, diagnostico, preco)
--paciente referencia Pacientes (codP)
--medico referencia Medicos (codM)

create table Consultas (
	codC int not null identity,
	paciente int not null,
	medico int not null,
	dataConsulta datetime not null,
	diagnostico varchar(100),
	preco float,
	primary key (codC),
	foreign key (paciente) references Pacientes,
	foreign key (medico) references Medicos
)

insert into Pacientes (nome, cpf, sexo, idade, convenio) 
values ('Lucas', '089.333.999-00', 'M', 20, 'Bradesco Saúde Individual')

insert into Pacientes (nome, cpf, sexo, idade, convenio)
values ('Rafaella', '111.222.333-44', 'F', 27, 'Unimed')

select * from Pacientes 
select *from Medicos
select *from Consultas

insert into Medicos (nome, especialidade, turno, salario)
values ('Jacinta', 'pediatra', 'manha', 3500.00)

insert into Medicos (nome, especialidade, turno, salario)
values ('Juliana', 'pediatra', 'noite', 3500.00)

insert into Medicos (nome, especialidade, turno, salario)
values ('Viturino', 'Neurologia', 'tarde', 10000)

insert into Medicos (nome, especialidade, turno, salario)
values ('João', 'cardiologista', 'tarde', 1000)


insert into Consultas (paciente, medico, dataConsulta, diagnostico, preco)
values (1, 1, '18-02-2025', 'Virose', 500)

insert into Consultas (paciente, medico, dataConsulta, diagnostico, preco)
values (2, 2, '03-01-2024', 'Dor de dente', 800)

insert into Consultas (paciente, medico, dataConsulta, diagnostico, preco)
values (2, 4, '03-05-2023', 'coração partido', 220.45)

insert into Consultas (paciente, medico, dataConsulta, diagnostico, preco)
values (1, 3, '13-06-2023', 'febre', 80)


update Medicos set salario = 2*salario where especialidade = 'pediatra'
update Consultas set preco = 220.45
update Consultas set preco = 79 where preco = 80

delete from Consultas where medico = 4
delete from Medicos where salario < 1500
delete from Consultas where preco < 80

alter table Consultas add horario time default '00:00:00.0000'

insert into Consultas (paciente, medico, dataConsulta, diagnostico, preco, horario)
values (2, 2, '11-08-2006', 'dor de corno', 500, '12:30:00.000')

insert into Consultas (paciente, medico, dataConsulta, diagnostico, preco, horario)
values (1, 2, '13-08-2006', 'virose', 500, '13:30:00.000')

alter table Consultas drop column diagnostico

drop table Consultas

use master
drop database Clinica
