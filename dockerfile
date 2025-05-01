# Dockerfile
# python3.13 기본이미지
FROM python:3.12

# app 디렉터리 생성
RUN mkdir /app

# app 디렉터리를 작업폴더로 지정
WORKDIR /app

# 작업폴더(app) pip 라이브러리 패키지 업데이트
RUN pip install --upgrade pip

# 호스트 파일에서 django를 설치한 pip 라이브러리 파일 컨테이너로 복제
COPY ./ /app/

# 호스트에서 설치했던 장고를 포함한 라이브러리를 requirements.txt를 참조해서 설치
# 배포 환경 : RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -r requirements.txt

# 포트 명시
EXPOSE 8000

# 장고 시작 명령어
ENTRYPOINT [ "python", "manage.py","runserver","0.0.0.0:8000" ]