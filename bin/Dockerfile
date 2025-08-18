# 使用官方的 Nginx 镜像作为基础镜像
FROM docker.dolphin-ai.cn/library/nginx:alpine

# 删除默认的 Nginx 页面
RUN rm -rf /usr/share/nginx/html/*

# 将本地 dist 文件夹中的内容复制到 Nginx 的默认静态资源目录
COPY dist/ /usr/share/nginx/html/

RUN mkdir -p /etc/nginx/ssl

COPY default.conf /etc/nginx/conf.d/default.conf

# 暴露 80 端口
EXPOSE 80

# 启动 Nginx（默认启动命令）
CMD ["nginx", "-g", "daemon off;"]