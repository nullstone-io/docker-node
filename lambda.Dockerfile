# syntax=docker/dockerfile:1
ARG NODE_VERSION=16
FROM public.ecr.aws/lambda/nodejs:${NODE_VERSION}

RUN npm i -g yarn

ENV NODE_ENV production
WORKDIR ${LAMBDA_TASK_ROOT}