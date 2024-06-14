# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version:  3.2.4 - https://rubyinstaller.org/downloads/
* Rails version: 7.1.3.2
 ```
gem install rails -v 7.1.3.2
 ```

* Database:
  - postgresql:15.2-2 - https://www.postgresql.org/download/
  - creation: view folder dekamilk-api/scripts/26-04-2024-create.sql

* Instalar as gems do projeto (Lembrar de executar o terminal como Administrador)
 ```
 bundle install
 ```
* Iniciar a API 
```
rails s
```
 #pra gerar os arquivos do model automaticamente
```
 rails g scaffold <model> <propriedades>
 ```
  #quando alterado script do banco, lembrar de dar um dump nos schemas para ajustar com o que se tem salvo
```
rails db:schema:dump
```
