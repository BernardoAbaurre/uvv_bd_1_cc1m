use uvv;
-- Questão 1 
select distinct te.numero_departamento, round(avg(funcionario.salario),1) as media_salarial
from funcionario
inner join (select distinct cpf_funcionario,numero_departamento from trabalha_em) as te
on funcionario.cpf = te.cpf_funcionario
group by numero_departamento;

-- Questão 2
select f.sexo, round(avg(f.salario),1) as media_salarial
from funcionario as f
group by sexo;

-- Questão 3
select 
concat(funcionario.primeiro_nome,' ', nome_meio,'. ', ultimo_nome) as nome,data_nascimento, YEAR(CURRENT_TIMESTAMP())-YEAR(data_nascimento) as idade, salario,
te.numero_departamento,
departamento.nome_departamento
from ((funcionario
inner join (select distinct cpf_funcionario,numero_departamento from trabalha_em) as te on funcionario.cpf = te.cpf_funcionario)
inner join departamento on te.numero_departamento = departamento.numero_departamento) 
group by nome;

-- Questão 4
select concat(f.primeiro_nome,' ', nome_meio,'. ', ultimo_nome),YEAR(CURRENT_TIMESTAMP())-YEAR(f.data_nascimento) as idade,f.salario as salario_atual,if(salario < 35000, salario * 1.2, salario * 1.15) as salario_ajustado
from funcionario as f;

-- Questão 5