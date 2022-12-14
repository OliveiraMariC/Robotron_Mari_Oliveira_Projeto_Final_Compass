# Sessão para configuração, documentação, imports de arquivos e libraries
*** Settings ***
Documentation      Arquivo de Testes Endpoint /produtos
Resource    ../suporte/base.robot

Suite Setup    Criar Sessao    

#Sessão para a criação dos cenários
*** Test Cases ***
Cenario 01: GET Listar Todos os Produtos 200
    [Tags]    PRODUTO BUSCAR TODOS 200    
    GET Endpoint /produtos
    Validar Status Code "200"
    Validar Razao "OK"

Cenário 02: GET Produto ID
    [Tags]        PRODUTO BUSCAR ID 200
    GET Endpoint /produtos por ID
    Validar Status Code "200"

Cenário 03: GET Produto Sem ID 400
    [Tags]    PRODUTO BUSCAR ID 400
    GET Endpoint /produtos sem ID 400
    Validar Status Code "400"

# Nao exclui o produto e status code 405
Cenario 04: POST Cadastrar Produto 201
    [Tags]        PRODUTO CADASTRAR MD 201
    Fazer Login e armazenar Token
    Criar Dados Produto Valido
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Message "Cadastro realizado com sucesso"
    #DELETE Endpoint /produtos
    #Validar Status Code "405"
Cenário 08: POST Cadastrar Produto Massa Estatica Invalido
    [Tags]    PRODUTO ME CADASTRO INVALIDO 400
    Fazer Login e armazenar Token
    Validar Ter Logado
    Dados Produto Estatico "produto_invalido"
    POST Endpoint /produtos
    Validar Status Code "400" 
    Validar Message "Já existe produto com esse nome"
Cenario 05: PUT Alterar Produto 200
    [Tags]        PRODUTO ALTERAR MD 200
    Fazer Login e armazenar Token
    Criar Dados Produto Valido
    PUT Endpoint /produtos
    Validar Message "Registro alterado com sucesso"
    Validar Status Code "200" 
    DELETE Endpoint /produtos
    
#O Status Code é 405 quando deveria ser 403

    
Cenario 09: POST Cadastrar Produto Massa Estatica Sem Nome
    [Tags]    PRODUTO ME CADASTRO SEM NOME 400
    Fazer Login e armazenar Token
    Validar Ter Logado
    Dados Produto Estatico "produto_sem_nome"
    POST Endpoint /produtos
    Validar Status Code "400"
Cenario 10: POST Cadastrar Produto Massa Estatica Sem Preco
    [Tags]    PRODUTO  ME CADASTRO SEM PRECO 400
    Fazer Login e armazenar Token
    Validar Ter Logado
    Dados Produto Estatico "produto_sem_preco"
    POST Endpoint /produtos
    Validar Status Code "400"    

Cenario 11: POST Cadastrar Produto Massa Estatica Sem Descricao
    [Tags]    PRODUTO  ME CADASTRO SEM DESCRICAO 400
    Fazer Login e armazenar Token
    Validar Ter Logado
    Dados Produto Estatico "produto_sem_descricao"
    POST Endpoint /produtos
    Validar Status Code "400"

Cenario 12: POST Cadastrar Produto Massa Estatica Sem Qtd
    [Tags]    PRODUTO  ME CADASTRO SEM Qtd 400
    Fazer Login e armazenar Token
    Validar Ter Logado
    Dados Produto Estatico "produto_sem_quantidade"
    POST Endpoint /produtos
    Validar Status Code "400"
Cenario 05: PUT Alterar Produto 200
    [Tags]        PRODUTO ALTERAR MD 200
    Fazer Login e armazenar Token
    Criar Dados Produto Valido
    PUT Endpoint /produtos
    Validar Message "Registro alterado com sucesso"
    Validar Status Code "200" 
    DELETE Endpoint /produtos
Cenario 05: PUT Alterar Produto 401
    [Tags]        PRODUTO ALTERAR MD 401
    Fazer Login e armazenar Token
    Selecionar Token Invalido
    Criar Dados Produto Valido
    PUT Endpoint /produtos
    Validar Message "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401" 
Cenario 05: PUT Alterar Produto 403
    [Tags]        PRODUTO ALTERAR MD 403
    Fazer Login e armazenar Token SAdmin
    Criar Dados Produto Valido
    PUT Endpoint /produtos
    Validar Message "Rota exclusiva para administradores"
    Validar Status Code "403"   

Cenario 06: DELETE Produto 401
    [Tags]        PRODUTO SEM TOKEN MD 401
    Fazer Login e armazenar Token
    Selecionar Token Invalido
    POST Endpoint /produtos
    Validar Message "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    Validar Status Code "401"
Cenario 07: DELETE Produto 403
    [Tags]        PRODUTO NAO Adm ME 403
    Fazer Login e armazenar Token SAdmin
    Dados Produto Estatico "produto_valido"
    DELETE Endpoint /produtos
    Validar Status Code "405"