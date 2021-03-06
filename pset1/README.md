<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <META http-equiv="Content-Type" content="text/html; charset=iso-8859-15">
        <title>esquema_elmasri_architect</title>
    </head>
    <body>
        <center>
            <h1>Problem Set 1</h1>
            <p>Este Pset consiste em implementar e reparar os erros do banco de dados no modelo elmasri</p>
            <h2>Erros</h2>
        </center>
        <ul>
            <li>O auto relacionamento na tabela funcionario estava errado pois, este tinha cardinalidade 1:N, ou seja, 1 funcionário poderia ter vários supervisores. Para corrigir este erro, transformei a cardinalidade em N:(1,0). </li>
            <li> O campo numero_departamento.funcionario deveria ser uma FK para a tablea departamento, mas ao fazer esta relação, é criado um loop infinito de erros na hora de preencher as tabelas, pois uma depende que o campo da outra já tenha sido preenchido. Para corrigir este erro, criei uma tabela intermediária (gerente) entre funcionario e departamento. Além disso transferi o campo numero_departamento.funcionario para a tabela trabalha_em.</li>
        </ul>
        <center>
            <h2>esquema_elmasri_architect</h2>
        </center>
        <img src="esquema_elmasri_bernardo.png" alt="esquema_elmasri_bernardo">
        <h3>List of tables</h3>
        <ul>
            <li>
                <a href="#departamento">departamento</a>
            </li>
            <li>
                <a href="#dependente">dependente</a>
            </li>
            <li>
                <a href="#Funcionario">Funcionario</a>
            </li>
            <li>
                <a href="#gerente">gerente</a>
            </li>
            <li>
                <a href="#localizacoes_departamento">localizacoes_departamento</a>
            </li>
            <li>
                <a href="#projeto">projeto</a>
            </li>
            <li>
                <a href="#trabalha_em">trabalha_em</a>
            </li>
        </ul>
        <div class="tableNameHeading">
            <h1>
                departamento<a name="departamento"></a>
            </h1>
            <h2>
      (Physical Name: departamento)
      </h2>
        </div>
        <div class="table">
            <table class="tableDefinition" width="100%">
                <tr>
                    <td class="tdTableHeading tdLogicalColName">Logical Column Name</td><td class="tdTableHeading tdPhysicalColName">Physical Column Name</td><td class="tdTableHeading tdDataType">Type</td><td class="tdTableHeading tdPkFlag">PK</td><td class="tdTableHeading tdNullFlag">Nullable</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_departamento (PK)</td><td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">N&uacute;mero do departamento.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">nome_departamento</td><td class="tdTableDefinition">nome_departamento</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Nome do departamento.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">data_inicio_gerente</td><td class="tdTableDefinition">data_inicio_gerente</td><td class="tdTableDefinition">DATE</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Data de in&iacute;cio do gerente no departamento.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_gerente
                &nbsp;(<a href="#gerente">FK</a>)
              </td><td class="tdTableDefinition">cpf_gerente</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">CPF do gerente do departamento. &Eacute; uma FK para a tabela gerente.</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#gerente">gerente</a> through (cpf_gerente)
                    </li>
                </ul>
                <p class="subTitle">Referenced By</p>
                <ul>
                    <li>
                        <a href="#projeto">projeto</a> referencing (numero_departamento)
                    </li>
                    <li>
                        <a href="#localizacoes_departamento">localizacoes_departamento</a> referencing (numero_departamento)
                    </li>
                    <li>
                        <a href="#trabalha_em">trabalha_em</a> referencing (numero_departamento)
                    </li>
                </ul>
            </div>
        </div>
        <div class="tableNameHeading">
            <h1>
                dependente<a name="dependente"></a>
            </h1>
            <h2>
      (Physical Name: dependente)
      </h2>
        </div>
        <div class="table">
            <table class="tableDefinition" width="100%">
                <tr>
                    <td class="tdTableHeading tdLogicalColName">Logical Column Name</td><td class="tdTableHeading tdPhysicalColName">Physical Column Name</td><td class="tdTableHeading tdDataType">Type</td><td class="tdTableHeading tdPkFlag">PK</td><td class="tdTableHeading tdNullFlag">Nullable</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">nome_dependente (PK)</td><td class="tdTableDefinition">nome_dependente</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Nome do dependente.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_funcionario (PK)
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_funcionario</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">CPF do funcion&aacute;rio. &Eacute; uma FK para a tabela funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Sexo do dependente.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">DATE</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Data de nascimento do dependente.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">parentesco</td><td class="tdTableDefinition">parentesco</td><td class="tdTableDefinition">VARCHAR(8)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Parentesco entre dependente e funcion&aacute;rio.</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#Funcionario">Funcionario</a> through (cpf_funcionario)
                    </li>
                </ul>
            </div>
        </div>
        <div class="tableNameHeading">
            <h1>
                Funcionario<a name="Funcionario"></a>
            </h1>
            <h2>
      (Physical Name: funcionario)
      </h2>
        </div>
        <div class="table">
            <table class="tableDefinition" width="100%">
                <tr>
                    <td class="tdTableHeading tdLogicalColName">Logical Column Name</td><td class="tdTableHeading tdPhysicalColName">Physical Column Name</td><td class="tdTableHeading tdDataType">Type</td><td class="tdTableHeading tdPkFlag">PK</td><td class="tdTableHeading tdNullFlag">Nullable</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf (PK)</td><td class="tdTableDefinition">cpf</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">CPF do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">primeiro_nome</td><td class="tdTableDefinition">primeiro_nome</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Primeiro nome do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">nome_meio</td><td class="tdTableDefinition">nome_meio</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Inicial do nome do meio do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">ultimo_nome</td><td class="tdTableDefinition">ultimo_nome</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">&Uacute;ltimo nome do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">DATE</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Data de nascimento do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">endereco</td><td class="tdTableDefinition">endereco</td><td class="tdTableDefinition">VARCHAR(50)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Endere&ccedil;o do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Inicial do sexo do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">salario</td><td class="tdTableDefinition">salario</td><td class="tdTableDefinition">DECIMAL(10,2)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Sal&aacute;rio do funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_supervisor
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_supervisor</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">CPF do supervisor. &Eacute; uma FK para a pr&oacute;pria tabela, pois o supervisor tamb&eacute;m &eacute; um funcion&aacute;rio. Removi a restrição NOT NULL deste campo pois o presidente da impresa não tem supervisor.</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#Funcionario">Funcionario</a> through (cpf_supervisor)
                    </li>
                </ul>
                <p class="subTitle">Referenced By</p>
                <ul>
                    <li>
                        <a href="#Funcionario">Funcionario</a> referencing (cpf)
                    </li>
                    <li>
                        <a href="#dependente">dependente</a> referencing (cpf)
                    </li>
                    <li>
                        <a href="#trabalha_em">trabalha_em</a> referencing (cpf)
                    </li>
                    <li>
                        <a href="#gerente">gerente</a> referencing (cpf)
                    </li>
                </ul>
            </div>
        </div>
        <div class="tableNameHeading">
            <h1>
                gerente<a name="gerente"></a>
            </h1>
            <h2>
      (Physical Name: gerente)
      </h2>
            <p class="comment">Funcion&aacute;rios que s&atilde;o gerentes de departamentos</p>
        </div>
        <div class="table">
            <table class="tableDefinition" width="100%">
                <tr>
                    <td class="tdTableHeading tdLogicalColName">Logical Column Name</td><td class="tdTableHeading tdPhysicalColName">Physical Column Name</td><td class="tdTableHeading tdDataType">Type</td><td class="tdTableHeading tdPkFlag">PK</td><td class="tdTableHeading tdNullFlag">Nullable</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_gerente (PK)
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_gerente</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">CPF do gerente do departamento. &Eacute; uma FK para a tabela funcionario.</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#Funcionario">Funcionario</a> through (cpf_gerente)
                    </li>
                </ul>
                <p class="subTitle">Referenced By</p>
                <ul>
                    <li>
                        <a href="#departamento">departamento</a> referencing (cpf_gerente)
                    </li>
                </ul>
            </div>
        </div>
        <div class="tableNameHeading">
            <h1>
                localizacoes_departamento<a name="localizacoes_departamento"></a>
            </h1>
            <h2>
      (Physical Name: localizacoes_departamento)
      </h2>
        </div>
        <div class="table">
            <table class="tableDefinition" width="100%">
                <tr>
                    <td class="tdTableHeading tdLogicalColName">Logical Column Name</td><td class="tdTableHeading tdPhysicalColName">Physical Column Name</td><td class="tdTableHeading tdDataType">Type</td><td class="tdTableHeading tdPkFlag">PK</td><td class="tdTableHeading tdNullFlag">Nullable</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_departamento (PK)
                &nbsp;(<a href="#departamento">FK</a>)
              </td><td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">N&uacute;mero do departamento. &Eacute; uma FK para departamento.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">local (PK)</td><td class="tdTableDefinition">local</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Localiza&ccedil;&atilde;o do departamento.</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#departamento">departamento</a> through (numero_departamento)
                    </li>
                </ul>
            </div>
        </div>
        <div class="tableNameHeading">
            <h1>
                projeto<a name="projeto"></a>
            </h1>
            <h2>
      (Physical Name: projeto)
      </h2>
        </div>
        <div class="table">
            <table class="tableDefinition" width="100%">
                <tr>
                    <td class="tdTableHeading tdLogicalColName">Logical Column Name</td><td class="tdTableHeading tdPhysicalColName">Physical Column Name</td><td class="tdTableHeading tdDataType">Type</td><td class="tdTableHeading tdPkFlag">PK</td><td class="tdTableHeading tdNullFlag">Nullable</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_projeto (PK)</td><td class="tdTableDefinition">numero_projeto</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">N&uacute;mero do projeto.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">nome_projeto</td><td class="tdTableDefinition">nome_projeto</td><td class="tdTableDefinition">VARCHAR(20)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Nome do projeto. Deve ser &uacute;nico, &eacute; uma chave alternativa.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_departamento
                &nbsp;(<a href="#departamento">FK</a>)
              </td><td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">N&uacute;mero do departamento que o projeto pertence. &Eacute; uma FK para a tabela departamento.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">local_projeto</td><td class="tdTableDefinition">local_projeto</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Localiza&ccedil;&atilde;o do projeto.</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#departamento">departamento</a> through (numero_departamento)
                    </li>
                </ul>
                <p class="subTitle">Referenced By</p>
                <ul>
                    <li>
                        <a href="#trabalha_em">trabalha_em</a> referencing (numero_projeto)
                    </li>
                </ul>
            </div>
        </div>
        <div class="tableNameHeading">
            <h1>
                trabalha_em<a name="trabalha_em"></a>
            </h1>
            <h2>
      (Physical Name: trabalha_em)
      </h2>
        </div>
        <div class="table">
            <table class="tableDefinition" width="100%">
                <tr>
                    <td class="tdTableHeading tdLogicalColName">Logical Column Name</td><td class="tdTableHeading tdPhysicalColName">Physical Column Name</td><td class="tdTableHeading tdDataType">Type</td><td class="tdTableHeading tdPkFlag">PK</td><td class="tdTableHeading tdNullFlag">Nullable</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_funcionario (PK)
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_funcionario</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">CPF dp funcion&aacute;rio. &Eacute; uma FK para a tabela funcion&aacute;rio.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_projeto (PK)
                &nbsp;(<a href="#projeto">FK</a>)
              </td><td class="tdTableDefinition">numero_projeto</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">horas</td><td class="tdTableDefinition">horas</td><td class="tdTableDefinition">DECIMAL(3,1)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Horas trabalhadas pelo funcion&aacute;rio no projeto.</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_departamento
                &nbsp;(<a href="#departamento">FK</a>)
              </td><td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">Numero do departamento que o funcion&aacute;rio trabalha. &Eacute; uma FK para a tabela departamento</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#Funcionario">Funcionario</a> through (cpf_funcionario)
                    </li>
                    <li>
                        <a href="#departamento">departamento</a> through (numero_departamento)
                    </li>
                    <li>
                        <a href="#projeto">projeto</a> through (numero_projeto)
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
