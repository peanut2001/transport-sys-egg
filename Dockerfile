# 使用官方的 Nginx 镜像作为基础镜像
FROM node:18-alpine

WORKDIR /opt/oa-api

COPY ./ /opt/oa-api

RUN ls

RUN npm install --registry=https://registry.npm.taobao.org

EXPOSE 7002

CMD ["npm", "run", "dev"]