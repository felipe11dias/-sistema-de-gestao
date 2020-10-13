# Leia-me

Sistema De Gestão informações: 
Tecnologias: Ruby 2.7.1p83, Rails 6.0.3.4 e Sqlite3.

Autenticação é realizada utilizando a gem devise.

Usuários foram catalogados por 2 tipos:

user.admin = true - Dono
user.admin = false - Funcionário


Fluxo de uso:

Usuário dono
1 - Crie sua empresa e o usuário dono da empresa no formuário de criação da empresa.
2 - Acesse sua conta posteriomente criação da mesma junto com a empresa.
3 - Cadastre novos usuários do tipo funcionário.
4 - Crie publicações.
5 - Acompanhe as publicações no mural de mensagens ou comente nas publicações já existentes.
6 - Gerencie os usuários da sua empresa, Gerencie suas publicações, Gerencie seus comentarios e acompanhe o mural de mensagens.

Usuário funcionário
1 - Acesse sua conta posteriomente criação da mesma pelo dono da empresa.
2 - Gerencie suas publicações, Gerencie seus comentarios e acompanhe o mural de mensagens.
