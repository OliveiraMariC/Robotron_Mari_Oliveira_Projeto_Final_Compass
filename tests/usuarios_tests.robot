# Sessão para configuração, documentação, imports de arquivos e libraries
*** Settings ***
  
Documentation        Arquivo de testes para endpoint /usuarios
Resource    ../suporte/base.robot

Suite Setup    Criar Sessao    

#Sessão para a criação dos cenários

*** Test Cases ***

#Requisições Simples
Cenario: GET Todos os Usuarios 200
    [Tags]    GETALL
    GET Endpoint /usuarios
    Trazer Quantidade Usuarios
    Validar Status Code "200"
    Validar Razao "OK"

Cenario: POST Cadastrar Usuarios 201
    [Tags]    POST1
    Trazer Quantidade Usuarios
    Post Endpoint /usuarios
    Validar Ter Criado o Usuario
    Validar Status Code "201"
    Validar Razao "Created"
    Trazer Quantidade Usuarios

Cenario: PUT Editar Usuario 200
    [Tags]    PUT1
    PUT Endpoint /usuarios
    Validar Ter Alterado Usuario
    Validar Status Code "200"
    Trazer Quantidade Usuarios

Cenario: DELETE Excluir Usuario 200
    [Tags]    DELUSER
    Cadastrar Usuario e Aramazenar ID
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    
    
