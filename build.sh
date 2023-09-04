#!/usr/bin/env bash
set -euo pipefail
set -x


DOCKER_project_namespace='myhomemail565'
DOCKER_app_name='nanominer'
DOCKER_image_tag_ver=$DOCKER_project_namespace/$DOCKER_app_name:3.8.5
DOCKER_image_tag_latest=$DOCKER_project_namespace/$DOCKER_app_name

docker build --pull --no-cache --build-arg "VER=3.8.5" -t "$DOCKER_image_tag_latest" -t "$DOCKER_image_tag_ver" .
docker push $DOCKER_image_tag_latest
docker push $DOCKER_image_tag_ver
printf "$DOCKER_image_tag_ver\n" > .manifest
