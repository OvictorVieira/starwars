# Projeto sobre filmes do Star Wars

Este projeto possui uma pasta chamada "docker", dentro desta tem um arquivo chamado docker-compose.yml que é responsável por construir o ambiente de desenvolvimento completo para o projeto.

# Instalar o Docker e Docker-Compose

Para utilizar o ambiente que foi projetado utilizando o docker, é necessário que tenha instalado em sua maquina o `docker` e `docker-compose`, assim, evitando quaisquer conflitos e dificuldades em executar o ambiente.

- [Instalar Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce)
- [Instalar Docker-Compose](https://docs.docker.com/compose/install/#install-compose)

# Utilizando o Docker

Ao clonar o projeto, basta acessar a pasta `docker` e executar o comando abaixo:

``
    $ docker-compose up -d
``

Após a execução do comando acima, seu ambiente estará pronto.

Os seguintes containers serão disponibilizados:

- starwars_web - Container principal
- starwars_database - Container do Mysql
- starwars_phpadmin - Container do SGBD

# Executando o projeto dentro do container

Para acessar o ambiente de desenvolvimento dentro do Container, execute o seguinte comando:

``
    $ docker exec -it starwars_web bash
``

- Instale as dependências da aplicação `` bundle install ``
- Rode o comando para criação dos bancos de dados `` bundle exec rake db:create ``
- Rode a migrations do projeto `` bundle exec rake db:migrate ``
- Rode o servidor `` bundle exec puma -p 3000 ``
- Abra seu navegador `` http://localhost:3000 ``

# Tecnologias utilizadas

- Ruby 2.6
- Ruby on Rails 5.2
- Mysql 5.6
- Docker
- Docker Compose
- Bootstrap 4

# API Para consumo dos dados

- [SWAPI](https://swapi.co/) - API Star Wars
