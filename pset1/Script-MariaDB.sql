/*criar o banco de dados uvv*/
create database uvv;

/*criar um usuário administrador e conceder todos os privilégios a este*/
create user bernardo identifyed by '123456';
grant asll privileges on uvv.* to bernardo;

/*criar e comentar, tableas e colunas do banco de dados*/
CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(30),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT pk_funcionario PRIMARY KEY (cpf)
);
COMMENT ON COLUMN funcionario.cpf IS 'CPF do funcionário.';
COMMENT ON COLUMN funcionario.primeiro_nome IS 'Primeiro nome do funcionário.';
COMMENT ON COLUMN funcionario.nome_meio IS 'Inicial do nome do meio do funcionário.';
COMMENT ON COLUMN funcionario.ultimo_nome IS 'Último nome do funcionário.';
COMMENT ON COLUMN funcionario.data_nascimento IS 'Data de nascimento do funcionário.';
COMMENT ON COLUMN funcionario.endereco IS 'Endereço do funcionário.';
COMMENT ON COLUMN funcionario.sexo IS 'Inicial do sexo do funcionário.';
COMMENT ON COLUMN funcionario.salario IS 'Salário do funcionário.';
COMMENT ON COLUMN funcionario.cpf_supervisor IS 'CPF do supervisor. É uma FK para a própria tabela, pois o supervisor também é um funcionário.';
COMMENT ON COLUMN funcionario.numero_departamento IS 'Número do departamento do funcionário. É uma FK para a tabela departamento.';


CREATE TABLE departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                data_inicio_gerente DATE,
                cpf_gerente CHAR(11) NOT NULL,
                CONSTRAINT pk_departamento PRIMARY KEY (numero_departamento)
);
COMMENT ON COLUMN departamento.numero_departamento IS 'Número do departamento.';
COMMENT ON COLUMN departamento.nome_departamento IS 'Nome do departamento.';
COMMENT ON COLUMN departamento.data_inicio_gerente IS 'Data de início do gerente no departamento.';
COMMENT ON COLUMN departamento.cpf_gerente IS 'CPF do gerente do departamento. É uma FK para a tabela funcionários.';

/*transfora a coluna nome_departamento em uma chave alternativa*/
CREATE UNIQUE INDEX nome_departamento_idx
 ON departamento
 ( nome_departamento );

CREATE TABLE localizacoes_departamento (
                numero_departamento INTEGER NOT NULL,
                local VARCHAR(15) NOT NULL,
                CONSTRAINT pk_localizacoes_departamento PRIMARY KEY (numero_departamento, local)
);
COMMENT ON COLUMN localizacoes_departamento.numero_departamento IS 'Número do departamento. É uma FK para departamento.';
COMMENT ON COLUMN localizacoes_departamento.local IS 'Localização do departamento.';


CREATE TABLE projeto (
                numero_projeto INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                local_projeto VARCHAR(15),
                CONSTRAINT pk_projeto PRIMARY KEY (numero_projeto)
);
COMMENT ON COLUMN projeto.numero_projeto IS 'Número do projeto.';
COMMENT ON COLUMN projeto.nome_projeto IS 'Nome do projeto. Deve ser único, é uma chave alternativa.';
COMMENT ON COLUMN projeto.numero_departamento IS 'Número do departamento que o projeto pertence. É uma FK para a tabela departamento.';
COMMENT ON COLUMN projeto.local_projeto IS 'Localização do projeto.';

/*transfora a coluna nome_projeto em uma chave alternativa*/
CREATE UNIQUE INDEX nome_projeto_idx
 ON projeto
 ( nome_projeto );

CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INTEGER NOT NULL,
                horas DECIMAL(3,1) NOT NULL,
                CONSTRAINT pk_trabalha_em PRIMARY KEY (cpf_funcionario, numero_projeto)
);
COMMENT ON COLUMN trabalha_em.cpf_funcionario IS 'CPF dp funcionário. É uma FK para a tabela funcionário.';
COMMENT ON COLUMN trabalha_em.horas IS 'Horas trabalhadas pelo funcionário no projeto.';


CREATE TABLE dependente (
                nome_dependente VARCHAR(15) NOT NULL,
                cpf_funcionario CHAR(11) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(8),
                CONSTRAINT pk_dependente PRIMARY KEY (nome_dependente, cpf_funcionario)
);
COMMENT ON COLUMN dependente.nome_dependente IS 'Nome do dependente.';
COMMENT ON COLUMN dependente.cpf_funcionario IS 'CPF do funcionário. É uma FK para a tabela funcionário.';
COMMENT ON COLUMN dependente.sexo IS 'Sexo do dependente.';
COMMENT ON COLUMN dependente.data_nascimento IS 'Data de nascimento do dependente.';
COMMENT ON COLUMN dependente.parentesco IS 'Parentesco entre dependente e funcionário.';

/*criar chaves estrangeiras*/
ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE funcionario ADD CONSTRAINT departamento_funcionario_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*criar regras de integridade*/
ALTER TABLE funcionario ADD CONSTRAINT CHK_funcionario CHECK
((sexo = 'F' OR sexo = 'M')AND salario >= 0);

ALTER TABLE dependente ADD CONSTRAINT CHK_dependente CHECK
(sexo = 'F' OR sexo = 'M');

ALTER TABLE trabalha_em ADD CONSTRAINT CHK_trabalha_em CHECK 
(horas >= 0);

/* preencher tabelas */

/* preencher taela funcionario em ordem de hierarquia (supervisor antes de seus supervisionados) */
INSERT INTO funcionario VALUES
('88866555576', 'Jorge', 'E', 'Brito', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1),
('33344555587', 'Fernando', 'T', 'Wong', '1955-12-08', 'Rua da Lapa, 34, São Paulo, SP', 'M', 40000, '88866555576', 5),
('12345678966', 'João', 'B', 'Silva', '1965-01-09', 'Rua das Flores, 751, São Paulo, SP', 'M', 30000, '33344555587', 5),
('66688444476', 'Ronaldo', 'K', 'Lima', '1962-09-15', 'Rua Rebouças, 65, Piracicaba, SP', 'M', 38000, '33344555587', 5),
('45345345376', 'Joice', 'A', 'Leite', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5),
('98765432168', 'Jennifer', 'S', 'Souza', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4),
('99988777767', 'Alice', 'J', 'Zelaya', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168', 4),
('98798798733', 'André', 'V', 'Pereira', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4);

/*preencher a tabela dependente*/
INSERT INTO dependente VALUES
('33344555587', 'Alicia', 'F', '1986-04-05', 'Filha'),
('33344555587', 'Tiago', 'M', '1983-10-25', 'Filho'),
('33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa'),
('98765432168', 'Antonio', 'M', '1942-02-28', 'Marido'),
('12345678966', 'Michael', 'M', '1988-01-04', 'Filho'),
('12345678966', 'Alicia', 'F', '1988-12-30', 'Filha'),
('12345678966', 'Elizabeth', 'F', '1967-05-05', 'Esposa');

/*preencher tabela departamento*/
INSERT INTO departamento VALUES
(5, 'Pesqusia', '33344555587', '1988-05-22'),
(4, 'Administração', '98765432168', '1995-01-01'),
(1, 'Matriz', '88866555576', '1981-06-19');

/*preencher tabela localizacoes_departamento*/
INSERT INTO localizacoes_departamento VALUES
(1, 'São Paulo'),
(4, 'Mauá'),
(5, 'Santo André'),
(5, 'Itu'),
(5, 'São Paulo');

/* preencher tabela projeto*/
INSERT INTO projeto VALUES
(1, 'Produto X', 'Santo André', 5),
(2, 'Produto Y', 'Itu', 5),
(3, 'Produto Z', 'São Paulo', 5),
(10, 'Informatização', 'Mauá', 4),
(20, 'Reorganiazãço', 'São Paulo', 1),
(30, 'Novos benefícios', 'Mauá', 4);

/*preencher tabela trabalha_em*/
INSERT INTO trabalha_em VALUES
('12345678966', 1, 32.5),
('12345678966', 2, 7.5),
('66688444476', 3, 40),
('45345345376', 1, 20),
('45345345376', 2, 20),
('33344555587', 2, 10),
('33344555587', 3, 10),
('33344555587', 10, 10),
('33344555587', 20, 10),
('99988777767', 30, 30),
('99988777767', 10, 10),
('98798798733', 10, 35),
('98798798733', 30, 5),
('98765432168', 30, 20),
('98765432168', 20, 15),
('88866555576', 20, 0); -- neste registro preenchi horas como 0 pois o campo horas possui a restrição NOT NULL


