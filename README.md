# nullstone/node

Node Base Image that is configured with different image tags for local and production.
This image is opinionated, but not restrictive.

## Quick Reference

- Maintained by
  [Nullstone](https://nullstone.io)
- Where to get help
  [Nullstone Slack](https://join.slack.com/t/nullstone-community/signup)

## Supported Tags and respective `Dockerfile` links

- [local](local.Dockerfile)
- [latest](Dockerfile)
- [lambda, lambda-16](lambda.Dockerfile)
- [lambda-14](lambda.Dockerfile)
- [lambda-12](lambda.Dockerfile)

## Variants

This repository builds 3 variants of images: a local image, a production container image, and a production serverless image.

### Local

The local image variant is used to run node in an isolated development environment on your local machine.
- `CMD` is set to `node app.js` to run a development server.
- `PORT` is set to `9000` to align with Nullstone conventions to quickly attach nginx sidecar (example coming soon)
- `ENTRYPOINT` is set to a custom entrypoint script that does the following:
    - Run `yarn install` - Allows developer to run `docker compose restart app` to make changes to dependencies
    - If `POSTGRES_URL` is specified, set `DB_ADAPTER=postgresql`, `DATABASE_URL=$POSTGRES_URL`
    - If `MYSQL_URL` is specified, set `DB_ADAPTER=mysql`, `DATABASE_URL=$MYSQL_URL`

### Production

The production image variant uses node to run a node app in production mode.
- `PORT` is set to `80`
- `ENTRYPOINT` is set to a custom entrypoint script that does the following:
    - If `POSTGRES_URL` is specified, set `DB_ADAPTER=postgresql`, `DATABASE_URL=$POSTGRES_URL`
    - If `MYSQL_URL` is specified, set `DB_ADAPTER=mysql`, `DATABASE_URL=$MYSQL_URL`
