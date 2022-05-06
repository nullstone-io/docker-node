build:
	docker build -t nullstone/node:local -f local.Dockerfile .
	docker build -t nullstone/node .

push:
	docker push nullstone/node:local
	docker push nullstone/node
