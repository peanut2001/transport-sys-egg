# 使用官方的 Nginx 镜像作为基础镜像
FROM debian:latest

COPY ./ /opt/oa-api

WORKDIR /opt/oa-api

RUN curl -fsSL https://fnm.vercel.app/install | bash

RUN source /root/.bashrc

RUN fnm install 18

RUN fnm use 18

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

CMD ["npm", "run", "start"]