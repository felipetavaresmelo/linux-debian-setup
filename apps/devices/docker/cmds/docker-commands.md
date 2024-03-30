# Principais comandos Docker

## Listar containers em execução
```sh
docker container ls
```

## Listar containers existentes (incluindo os que estão parados)
```sh
docker container ls -a`
```

## Criar em modo daemon (liberando o terminal)
```sh
docker container run -d nginx
```

## Criar em modo daemon com bind de porta do serviço 
```sh
docker container run -d -p 8080:80 nginx
```

## Criar container ubuntu em modo interativo e com o tts (bash) disponível para executar comandos internos
```sh
docker container run -it ubuntu /bin/bash
```

## Criar container hello-world definindo o nome 
```sh
docker container run --name meucontainer hello-world
```

## Criar container definindo o nome e ao final da execução excluir o mesmo
```sh
docker container run --name meucontainer --rm hello-world
```

## Inspecionar um container em execução
```sh
docker container inspect <CONTAINER ID>
```
## Executar comandos no bash de um container
```sh
docker container exec -it <CONTAINER ID> /bin/bash
```

## Parar execução de um container
```sh
docker container stop <CONTAINER ID>
```

## Inicializar a execução do container
```sh
docker container start <CONTAINER ID>
```

## Remover o container (-f forçando quando estiver em execução)
```sh
docker container -f rm <CONTAINER ID>
```

## Analisar 5(n) ultimas linhas (stdout) de log do container
```sh
docker container logs -n 5 <CONTAINER ID>
```

## Monitorar continuamente o log (stdout) do container
```sh
docker container logs -f <CONTAINER ID>
```

## Analisar o log (stdout) do container com data e hora
```sh
docker container logs -t <CONTAINER ID>
```

## Exemplo de Dockerfile

```dockerfile
FROM ubuntu
RUN apt-get update
RUN apt-get install curl --yes
``` 

### Criar imagem do container estando na mesma pasta do dockerfile
```sh
docker image build -t ubuntu-curl .
```

### Listar as imagens criadas e baixadas
```sh
docker image ls
```