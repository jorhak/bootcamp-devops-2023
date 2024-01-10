#!/bin/bash
DOCKER_HUB_LOGIN_USER=
DOCKER_HUB_LOGIN_PASSWORD=
IMAGE_API=api_devops
IMAGE_WEB=web_devops
IMAGE_DB=postgres_devops
VERSION=v1.0.0
REGISTRY=jorhak
cd db
docker build -t $IMAGE_DB:$VERSION .
cd ../api
docker build -t $IMAGE_API:$VERSION .
cd ../web
docker build -t $IMAGE_WEB:$VERSION .
cd ..

docker login --username=$DOCKER_HUB_LOGIN_USER --password=$DOCKER_HUB_LOGIN_PASSWORD
docker tag $IMAGE_API:$VERSION $REGISTRY/$IMAGE_API:$VERSION
docker tag $IMAGE_WEB:$VERSION $REGISTRY/$IMAGE_WEB:$VERSION
docker tag $IMAGE_DB:$VERSION $REGISTRY/$IMAGE_DB:$VERSION

docker push $REGISTRY/$IMAGE_API:$VERSION
docker push $REGISTRY/$IMAGE_WEB:$VERSION
docker push $REGISTRY/$IMAGE_DB:$VERSION
