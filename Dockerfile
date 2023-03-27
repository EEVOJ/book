FROM ubuntu:20.04 AS mkdocsbuild

WORKDIR /app
COPY . .

RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && apt-get update && apt-get install -y \
        python3 python3-pip \
    && pip install --no-cache-dir --upgrade -r requirements.txt \
    && mkdocs build

FROM nginx:stable-alpine

COPY --from=mkdocsbuild /app/site/ /usr/share/nginx/html/
