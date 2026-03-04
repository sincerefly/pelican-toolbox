# 使用 Python 3 Alpine 镜像作为基础
FROM python:3-alpine

# 设置工作目录
WORKDIR /app

# 复制项目文件到工作目录
COPY . /app

RUN apk --no-cache add bash curl nodejs npm make

# 安装 pnpm
RUN npm install -g pnpm

# 安装 Pelican
# RUN apk --no-cache add gcc musl-dev libxml2-dev libxslt-dev
RUN pip install pelican[markdown]

# 验证 Node/npm/pnpm/make 可用
RUN node -v && npm -v && pnpm -v && make -v

# 安装 UPX
RUN if [ "$TARGETPLATFORM" = "linux/arm64" ]; then \
        wget https://collection.b0.upaiyun.com/softwares/upx/upx_0.4.4_Linux_arm64.tar.gz && \
        tar -xzf upx_0.4.4_Linux_arm64.tar.gz -C /usr/local/bin && \
        rm -rf upx_0.4.4_Linux_arm64.tar.gz; \
    else \
        wget https://collection.b0.upaiyun.com/softwares/upx/upx_0.4.4_Linux_x86_64.tar.gz && \
        tar -xzf upx_0.4.4_Linux_x86_64.tar.gz -C /usr/local/bin && \
        rm -rf upx_0.4.4_Linux_x86_64.tar.gz; \
fi

# 启动命令
CMD ["tail", "-f", "/dev/null"]
