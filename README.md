# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version:  3.2.4
* Rails version: 7.1.3.2

* Database:
->postgresql:15.2-2
-> creation: view foldes dekamilk-api/scripts/26-04-2024-create.sql

* Instalar as gems do projeto
 ```
 bundle install
 ```
* Iniciar a API 
```
rails s
```
```
 rails g scaffold <model> <propriedades> #pra gerar os arquivos do model automaticamente
 ```
```
rails db:schema:dump #quando alterado script do banco, lembrar de dar um dump nos schemas para ajustar com o que se tem salvo
```