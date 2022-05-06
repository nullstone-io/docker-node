# syntax=docker/dockerfile:1

FROM node:18-alpine

ENV NODE_ENV development

# Add entrypoint to initialize Nullstone
WORKDIR /
COPY local.entrypoint.sh .
RUN chmod +x /local.entrypoint.sh
ENTRYPOINT ["/local.entrypoint.sh"]

WORKDIR /app

ENV PORT 9000

CMD node app.js
