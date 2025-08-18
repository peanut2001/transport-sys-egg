# 使用官方的 Nginx 镜像作为基础镜像
FROM node:18-alpine

COPY ./ /opt/oa-api

WORKDIR /opt/oa-api

RUN npm install --registry=https://registry.npm.taobao.org

CMD ["npm", "run", "start"]