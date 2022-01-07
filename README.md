# Sistema De Gestão - Backend

## Backend
Módulo de sistema de gestão

## Features
- Api de login com [gem devise](https://github.com/heartcombo/devise)
- Api do CRUD de Usuários
- Api do CRUD de Empresa
- Api do CRUD de Publicações
- Api do CRUD de Comentários

## Tecnologias utilizadas
- [Ruby 2.7.1p83](https://www.ruby-lang.org/pt/)
- [Ruby on Rails 6.0.3.4](https://rubyonrails.org/)
- [SQLite3](https://www.sqlite.org/index.html)

## Instalação
Faça o clone do projeto no git, canto superior direito no repositório do projeto(Botão 'Code').

Utilize dos comando na pasta do projeto:
- Use o comando: bundle install(Instala as dependências)
- Use o comando: rails server(Rodar o projeto, levantar o servidor para receber requisições)

# Funcionamento do Projeto

## Usuários

Usuários foram catalogados por 2 tipos:

user.admin = true - Dono 

user.admin = false - Funcionário

## Fluxo de uso:

### Usuário dono:
- 1 - Faz seu cadastro e crie sua empresa.
- 2 - Acesse sua conta posteriomente criação da mesma junto com a empresa
- 3 - Cadastre novos usuários do tipo funcionário.
- 4 - Crie publicações.
- 5 - Acompanhe as publicações no mural de mensagens ou comenta nas publicações já existentes
- 6 - Gerencie os usuários funcionários da sua empresa
- 7 - Gerencie suas publicações
- 8 - Gerencie seus comentários
- 9 - Acompanhe o mural de mensagens


### Usuário funcionário:
- 1 - Acesse sua conta posteriomente criação da mesma pelo dono da empresa
- 2 - Gerencie suas publicações
- 3 - Gerencie seus comentários
- 4 - Acompanhe o mural de mensagens


## Fonte de Estudo Pessoal e Teste para emprego realizado em 2020
- Tabbs [Site](https://www.tabbs.com.br/)
