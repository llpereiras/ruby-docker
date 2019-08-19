# Site Vacinas

### Criar a image

<!-- `docker-compose run web rails new . --force --no-deps --database=postgresql` -->

`docker-compose build`

### Subir serviço minimal

`docker-compose up`

### Executar comandos dentro do container

`docker-compose run web rake db:create`

Ou

`docker-compose run web rails console`

### Derrubar aplicação do docker compose

`docker-compose down`

### Deletar imagens e container não mais utilizados

`ruby delete_images.rb`

### Referências

  * https://github.com/sdelrio/docker-minimal-nginx
  * https://github.com/matriphe/docker-alpine-nginx
  * https://blog.matheuscastiglioni.com.br/criando-minha-primeira-imagem-com-docker/
  * https://docs.docker.com/compose/rails/
  * https://devcenter.heroku.com/articles/local-development-with-docker-compose
