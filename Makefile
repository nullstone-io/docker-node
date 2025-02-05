build:
	docker build -t nullstone/node:local -f local.Dockerfile .
	docker build -t nullstone/node .
	#aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
	docker build --build-arg=NODE_VERSION=12 -t nullstone/node:lambda-12 -f lambda.Dockerfile .
	docker build --build-arg=NODE_VERSION=14 -t nullstone/node:lambda-14 -f lambda.Dockerfile .
	docker build --build-arg=NODE_VERSION=16 -t nullstone/node:lambda-16 -f lambda.Dockerfile .
	docker build --build-arg=NODE_VERSION=18 -t nullstone/node:lambda-18 -f lambda.Dockerfile .
	docker build --build-arg=NODE_VERSION=20 -t nullstone/node:lambda-20 -f lambda.Dockerfile .
	docker build --build-arg=NODE_VERSION=22 -t nullstone/node:lambda-22 -f lambda.Dockerfile .
	docker tag nullstone/node:lambda-22 nullstone/node:lambda

push:
	docker push nullstone/node:local
	docker push nullstone/node
	docker push nullstone/node:lambda
	docker push nullstone/node:lambda-12
	docker push nullstone/node:lambda-14
	docker push nullstone/node:lambda-16
	docker push nullstone/node:lambda-18
	docker push nullstone/node:lambda-20
	docker push nullstone/node:lambda-22
