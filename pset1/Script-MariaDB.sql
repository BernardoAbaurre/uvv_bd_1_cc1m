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
                cpf_supervisor CHAR(11) NOT NULL,
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

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
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