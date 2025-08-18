#!/usr/bin/env bash
docker build -t docker.dolphin-ai.cn/library/oa-api ./bin
docker login --username=Hlibrary+jenkins --password=LhjbDYsLj0cdk1uXzAojWaALuhyCvFmv docker.dolphin-ai.cn/library
docker push docker.dolphin-ai.cn/dolphin/dolphin-admin:latest