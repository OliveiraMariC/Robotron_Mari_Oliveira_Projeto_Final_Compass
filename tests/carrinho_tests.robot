# Sessão para configuração, documentação, imports de arquivos e libraries
*** Settings ***

Documentation       Arquivo de Testes Endpoint /carrinho
Resource    ../Keywords/carrinho_keywords.robot
Resource    ../Keywords/login_keywords.robot
Suite Setup    Criar Sessao
#Sessão para a criação dos cenários
*** Test Cases ***
Cenario: GET Listar Todos os Carrinhos 200
    [Tags]     GETALLCARS
    GET Endpoint /carrinhos
    Validar Status Code "200"
    Validar Se Carrinho Contém IdProduto "BeeJh5lz3k6kSIzA"
    
Cenario: POST Criar Carrinho 201
    [Tags]    POSTCAR201    
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Validar Status Code "201"
    Validar Ter Criado o Carrinho
    DELETE Endpoint /carrinhos/concluir-compra

Cenario: POST Criar Carrinho Errado 400
    [Tags]    POSTCAR400
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Criar Carrinho Estatico Valido
    Validar Status Code "400"
    DELETE Endpoint /carrinhos/concluir-compra

Cenario: POST Criar Carrinho Token Inválido 401
     [Tags]    POSTCAR401
    Selecionar Token Invalido
    Criar Carrinho Estatico Valido
    Validar Status Code "401"

Cenario: GET Buscar Carrinho 200
    [Tags]    GETCAR200
    Fazer Login e Armazenar Token
    Criar Um Carrinho e Armazenar ID
    GET Endpoint /carrinhos/id
    DELETE Endpoint /carrinhos/concluir-compra

Cenario: GET Buscar Carrinho Não Encontrado 400
    [Tags]    GETCAR400
    Fazer Login e Armazenar Token
    GET Endpoint Carrinho Não Encontrado

Cenario: DELETE Carrinho Concluir Compra 200
    [Tags]    CONCLUIRCAR200   
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"

Cenario: DELETE Carrinho Concluir Compra Token Inválido 401
    [Tags]    CONCLUIRCAR401
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Selecionar Token Invalido
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "401"
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/concluir-compra

Cenario: DELETE Carrinho Cancelar Compra 200
    [Tags]    CANCELARCAR200
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"

Cenario: DELETE Carrinho Cancelar Compra Token Inválido 401
    [Tags]    CANCELARCAR401
    Fazer Login e Armazenar Token
    Criar Carrinho Estatico Valido
    Selecionar Token Invalido
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "401"
    Fazer Login e Armazenar Token
    DELETE Endpoint /carrinhos/cancelar-compra