#!/usr/bin/env bash
docker build -t harbor.yunnet.top/library/oa-api ./bin
docker login --username= --password=LhjbDYsLj0cdk1uXzAojWaALuhyCvFmv harbor.yunnet.top/library
docker push docker.dolphin-ai.cn/library/oa-api:latest