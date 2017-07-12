FROM daocloud.io/library/python:3.6.1-alpine

RUN mkdir -p /code/dj_demo
WORKDIR /code/dj_demo
COPY requirements.txt /code/

# I must change the default url(official), because that is too slow in my country
# It will download 420+ MB, be patient
RUN echo "https://mirrors.ustc.edu.cn/alpine/latest-stable/main" > /etc/apk/repositories && \
	echo "https://mirrors.ustc.edu.cn/alpine/latest-stable/community" >> /etc/apk/repositories && \
	apk add --no-cache mariadb-dev g++ && \
    pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ --upgrade pip && \
	pip install --index https://pypi.mirrors.ustc.edu.cn/simple/ -r ../requirements.txt && \
    apk del g++ mariadb-dev && \
    apk add --no-cache mariadb-client-libs

COPY wait-for.sh /code/
