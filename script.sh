#!/bin/bash

# 사용자로부터 깃허브 토큰 정보를 읽어옵니다.
USER_ID=${USER_ID}
GITHUB_TOKEN=${GITHUB_TOKEN}
GITHUB_REPOSITORY="github.com/ATG-AMS/dh-next-web.git"

# '/usr/src/app' 내에 'donghae-front' 디렉토리를 만들고, 그곳에 레포지토리를 클론합니다.
git clone https://${USER_ID}:${GITHUB_TOKEN}@${GITHUB_REPOSITORY} /app --config core.askPass=true

# 작업 디렉토리를 '/usr/src/app/donghae-front'으로 변경합니다.
cd /app/dh-next-web

# 애플리케이션 종속성을 설치합니다.
npm install

# 무한 루프를 실행하여 컨테이너를 계속 실행 상태로 유지합니다.
tail -f /dev/null
