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
select 
tabela.*,
concat(funcionario.primeiro_nome,' ', nome_meio,'. ', ultimo_nome) as nome_gerente
from funcionario
inner join 
(select -- este select (que foi chamado de tabela) faz uma tabela com o nome do fúncionario, e nome e número de seu departamento
concat(funcionario.primeiro_nome,' ', nome_meio,'. ', ultimo_nome) as nome_funcionario,salario,
te.numero_departamento,
departamento.nome_departamento,cpf_gerente
from ((funcionario
inner join (select distinct cpf_funcionario,numero_departamento from trabalha_em) as te on funcionario.cpf = te.cpf_funcionario)
inner join departamento on te.numero_departamento = departamento.numero_departamento)) as tabela 
on funcionario.cpf = tabela.cpf_gerente
order by nome_departamento,salario desc;

-- Questão 6
select 
concat(f.primeiro_nome,' ',nome_meio,'. ',ultimo_nome) as nome_funcionario,
te.numero_departamento,
dependente.nome_dependente,YEAR(CURRENT_TIMESTAMP())-YEAR(dependente.data_nascimento) as idade_dependente,if(dependente.sexo = "M","Masculino","Feminino") as sexo_dependente
from ((funcionario as f
inner join (select distinct cpf_funcionario,numero_departamento from trabalha_em) as te on f.cpf = te.cpf_funcionario)
inner join dependente on f.cpf = dependente.cpf_funcionario)
order by nome_funcionario;

-- Questão 7
select cpf,nome_funcionario,salario,numero_departamento from
(select f.cpf,concat(f.primeiro_nome,' ',nome_meio,'. ',ultimo_nome) as nome_funcionario,salario,
d.nome_dependente,
te.numero_departamento
from ((funcionario as f 
left join dependente as d on f.cpf = d.cpf_funcionario)
inner join (select distinct cpf_funcionario,numero_departamento from trabalha_em) as te on f.cpf = te.cpf_funcionario)) as selec
where selec.nome_dependente is null;

-- Questão 8
select
concat(f.primeiro_nome,' ',nome_meio,'. ',ultimo_nome) as nome_funcionario,
trabalha_em.*
from funcionario as f
inner join trabalha_em on f.cpf = trabalha_em.cpf_funcionario;






