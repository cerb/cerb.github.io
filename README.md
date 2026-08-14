# cerb.github.io

Cerb project website

## Local development

```bash
git clone -b 12.0 https://github.com/cerb/cerb.github.io.git

# ... or download + unzip: https://codeload.github.com/cerb/cerb.github.io/zip/refs/heads/12.0

cd cerb.github.io

docker compose up
```

The site will be available at http://127.0.0.1:4000. Changes trigger automatic incremental rebuilds.

## Rebuild dependencies

```bash
docker compose --profile build build --no-cache jekyll-build
```

## Production build

```bash
docker compose --profile build run --rm jekyll-build
```

Then sync `_site/` to S3.

## Architecture and conventions

See [CLAUDE.md](CLAUDE.md) for repo layout, collections, content conventions, and templating notes.