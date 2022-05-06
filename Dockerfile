# syntax=docker/dockerfile:1

FROM node:18-alpine

ENV NODE_ENV production

# Add entrypoint to initialize Nullstone
WORKDIR /
COPY entrypoint.sh .
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /app

ENV PORT 80

CMD node app.js
