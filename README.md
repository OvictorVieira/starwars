# Projeto sobre filmes do Star Wars

Este projeto possui uma pasta chamada "docker", dentro desta tem um arquivo chamado docker-compose.yml que é responsável por construir o ambiente de desenvolvimento completo para o projeto.

# Utilizando o Docker

Ao clonar o projeto, basta acessar a pasta `docker` e executar o comando abaixo:

``
    $ docker-compose up -d
``

Após a execução do comando acima, seu ambiente estará pronto.

Os seguintes containers serão disponibilizados:

- starwars_web
- starwars_database
- starwars_phpadmin

# Executando o projeto dentro do container

- Instale as dependências da aplicação `` bundle install ``
- Rode a migrations do projeto `` bundle exec rake db:migrate ``
- Rode o servidor `` bundle exec puma -p 3000 ``
- Abra seu navegador `` http://localhost:3000 ``

# Tecnologias utilizadas

- Ruby 2.6
- Ruby on Rails 5.2
- Mysql 5.6
