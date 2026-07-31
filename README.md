# (codes) Macêdo — Landing Page

Landing page institucional da **Macêdo Desenvolvimento de Software LTDA**.

Site estático (HTML + CSS + JS puro, sem build) servido via Nginx e pronto para
deploy no Railway ou em qualquer plataforma que suporte Docker.

## Estrutura

```
index.html              # Página principal
styles.css              # Estilos
script.js               # Menu mobile + animações de scroll
Dockerfile              # Imagem Nginx (usa $PORT do Railway)
default.conf.template   # Config Nginx (gzip, cache, headers)
.dockerignore
```

## Rodar localmente

Basta abrir o `index.html` no navegador, ou servir estático:

```bash
python3 -m http.server 8000
```

Depois acesse http://localhost:8000

### Com Docker

```bash
docker build -t codes-macedo .
docker run --rm -p 8080:80 codes-macedo
```

Acesse http://localhost:8080

## Deploy no Railway

1. Faça push do repositório para o GitHub.
2. No Railway, crie um novo projeto a partir do repositório.
3. O Railway detecta o `Dockerfile` automaticamente e faz o build.
4. A imagem lê a variável `$PORT` injetada pelo Railway (default `80`).

## Personalização

- **E-mail / WhatsApp:** ajuste os links na seção `#contato` do `index.html`.
- **Cores:** edite as variáveis CSS em `:root` no `styles.css`.
- **Conteúdo:** todo o texto está em `index.html`.
