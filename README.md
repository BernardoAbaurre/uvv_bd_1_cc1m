# uvv_bd_1_cc1m
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <META http-equiv="Content-Type" content="text/html; charset=iso-8859-15">
    </head>
    <body>
        <center>
            <h2>Detalhes do BD Elmasri</h2>
        </center>
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
                <tr valign="top">
                    <td class="tdTableDefinition">nome_departamento</td><td class="tdTableDefinition">nome_departamento</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">data_inicio_gerente</td><td class="tdTableDefinition">data_inicio_gerente</td><td class="tdTableDefinition">DATE</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_gerente
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_gerente</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
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
                        <a href="#projeto">projeto</a> referencing (numero_departamento)
                    </li>
                    <li>
                        <a href="#localizacoes_departamento">localizacoes_departamento</a> referencing (numero_departamento)
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
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_funcionario (PK)
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_funcionario</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">DATE</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">parentesco</td><td class="tdTableDefinition">parentesco</td><td class="tdTableDefinition">VARCHAR(8)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
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
                <tr valign="top">
                    <td class="tdTableDefinition">primeiro_nome</td><td class="tdTableDefinition">primeiro_nome</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">nome_meio</td><td class="tdTableDefinition">nome_meio</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">ultimo_nome</td><td class="tdTableDefinition">ultimo_nome</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">data_nascimento</td><td class="tdTableDefinition">DATE</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">endereco</td><td class="tdTableDefinition">endereco</td><td class="tdTableDefinition">VARCHAR(30)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">sexo</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">salario</td><td class="tdTableDefinition">salario</td><td class="tdTableDefinition">DECIMAL(10,2)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">cpf_supervisor
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_supervisor</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
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
                        <a href="#departamento">departamento</a> referencing (cpf)
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
                <tr valign="top">
                    <td class="tdTableDefinition">local (PK)</td><td class="tdTableDefinition">local</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
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
                <tr valign="top">
                    <td class="tdTableDefinition">nome_projeto</td><td class="tdTableDefinition">nome_projeto</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_departamento
                &nbsp;(<a href="#departamento">FK</a>)
              </td><td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">local_projeto</td><td class="tdTableDefinition">local_projeto</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
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
                <tr valign="top">
                    <td class="tdTableDefinition">numero_projeto (PK)
                &nbsp;(<a href="#projeto">FK</a>)
              </td><td class="tdTableDefinition">numero_projeto</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap>PK</td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">horas</td><td class="tdTableDefinition">horas</td><td class="tdTableDefinition">DECIMAL(3,1)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#Funcionario">Funcionario</a> through (cpf_funcionario)
                    </li>
                    <li>
                        <a href="#projeto">projeto</a> through (numero_projeto)
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
