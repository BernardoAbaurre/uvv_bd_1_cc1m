# uvv_bd_1_cc1m
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <META http-equiv="Content-Type" content="text/html; charset=iso-8859-15">
    </head>
    <body>
        <center>
            <h2>Elmasri</h2>
        </center>
        <img src="pset1/esquema_elmasri_bernardo.png" alt="esquema_elmasri_bernardo">
        <h3>List of tables</h3>
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
            <p class="comment">Tabela que armazena as informa&ccedil;o&#7869;s dos departamentos.</p>
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
                &nbsp;(<a href="#Funcionario">FK</a>)
              </td><td class="tdTableDefinition">cpf_gerente</td><td class="tdTableDefinition">CHAR</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">CPF do gerente do departamento. &Eacute; uma FK para a tabela funcion&aacute;rios.</div>
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
                        <a href="#projeto">projeto</a> referencing (numero_departamento)
                    </li>
                    <li>
                        <a href="#localizacoes_departamento">localizacoes_departamento</a> referencing (numero_departamento)
                    </li>
                    <li>
                        <a href="#Funcionario">Funcionario</a> referencing (numero_departamento)
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
            <p class="comment">Tabela que armazena as informa&ccedil;&otilde;es dos dependentes dos funcion&aacute;rios.</p>
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
            <p class="comment">Tabela que armazena as informa&ccedil;&otilde;es dos funcion&aacute;rios.</p>
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
                    <td class="tdTableDefinition">endereco</td><td class="tdTableDefinition">endereco</td><td class="tdTableDefinition">VARCHAR(30)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap></td>
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
                        <div class="comment">CPF do supervisor. &Eacute; uma FK para a pr&oacute;pria tabela, pois o supervisor tamb&eacute;m &eacute; um funcion&aacute;rio. Pode ser NULL porque o presidente da impresa não tem supervisor</div>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="tdTableDefinition">numero_departamento
                &nbsp;
              </td><td class="tdTableDefinition">numero_departamento</td><td class="tdTableDefinition">INTEGER</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="comment">N&uacute;mero do departamento do funcion&aacute;rio.</div>
                    </td>
                </tr>
            </table>
            <div class="references">
                <p class="subTitle">References</p>
                <ul>
                    <li>
                        <a href="#Funcionario">Funcionario</a> through (cpf_supervisor)
                    </li>
                    <li>
                        <a href="#departamento">departamento</a> through (numero_departamento)
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
            <p class="comment">
                Tabela que armazena as poss&iacute;veis localiza&ccedil;&otilde;es dos departamentos.
                <br>
                <br>
            </p>
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
            <p class="comment">Tabela que armazena as informa&ccedil;&otilde;es sobre os projetos dos departamentos.</p>
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
                    <td class="tdTableDefinition">nome_projeto</td><td class="tdTableDefinition">nome_projeto</td><td class="tdTableDefinition">VARCHAR(15)</td><td class="tdTableDefinition" nowrap></td><td class="tdTableDefinition" nowrap>NOT NULL</td>
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
            <p class="comment">Tabela para armazenar quais funcion&aacute;rios trabalham em quais projetos.</p>
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
