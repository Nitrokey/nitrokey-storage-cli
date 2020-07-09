all: image build tests

image:
	docker build -t nitrokey/nkstorecli .


build: image
	docker rm nkstorecli || true
	docker run --name nkstorecli nitrokey/nkstorecli 
	docker cp nkstorecli:/root/nkstorecli/src/nkstorecli .
	docker stop nkstorecli

	
tests: build
	stat nkstorecli


