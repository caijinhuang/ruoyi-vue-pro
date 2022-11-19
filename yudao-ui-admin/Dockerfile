## 将编译后的文件打入docker独立部署
FROM nginx:1.17.2

## 创建目录，并使用它作为工作目录
RUN mkdir -p /dist
COPY ./dist /dist
COPY ./nginx_yudao.conf /

CMD nginx -g 'daemon off;'
