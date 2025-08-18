#!/usr/bin/env bash
source /root/.bashrc
export NODE_ENV=production EGG_SERVER_ENV=prod
npm install
npm run build
rm -rf bin/dist/
mv -f dist/ bin/
docker build -t docker.dolphin-ai.cn/library/oa-api ./bin
docker login --username=Hdolphin+jenkins --password=MSR7VqzImB9pIR779izskan3AXHrr6cH docker.dolphin-ai.cn/library
docker push docker.dolphin-ai.cn/library/oa-api:latest