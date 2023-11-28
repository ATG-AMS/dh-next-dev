# Node.js LTS Alpine 이미지를 가져옵니다.
FROM mcr.microsoft.com/devcontainers/typescript-node:1-20-bullseye

LABEL org.opencontainers.image.source=https://github.com/ATG-AMS/dh-next-dev

# npm 버전을 최신 안정 버전으로 설정합니다.
RUN npm install -g npm@latest --no-cache

# git을 설치합니다.
RUN apk add --no-cache git

# 스크립트 파일을 보관할 디렉토리를 만듭니다.
RUN mkdir /scripts

# 스크립트 파일을 /scripts 디렉토리에 복사합니다.
COPY script.sh healthcheck.sh /scripts/

# 스크립트 파일을 실행 가능하게 만듭니다.
RUN chmod +x /scripts/script.sh /scripts/healthcheck.sh

# 작업 디렉토리를 설정합니다.
WORKDIR /app

# 외부에서 접근 가능한 포트를 엽니다.
EXPOSE 4000
EXPOSE 6006

# HEALTHCHECK를 설정합니다.
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD /scripts/healthcheck.sh

# 컨테이너가 시작될 때 script.sh를 실행합니다.
CMD [ "sh", "/scripts/script.sh" ]
