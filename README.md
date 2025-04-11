# Spring Boot MySQL Sample

This is a simple Spring Boot application that demonstrates how to connect to a MySQL database using Docker Compose.

## 프로젝트 구조

- 3-tier 아키텍처 사용 (Controller-Service-Repository)
- Thymeleaf 템플릿 엔진으로 웹 페이지 구현
- MySQL 데이터베이스 사용
- Docker 및 Docker Compose로 애플리케이션 빌드 및 실행

## 실행 방법

이 프로젝트는 Docker Compose를 사용하여 Spring Boot 애플리케이션과 MySQL 데이터베이스를 함께 실행합니다.

```bash
# 도커 컴포즈 실행
docker-compose up
```

## 접속 방법

애플리케이션이 실행되면 다음 URL로 접속할 수 있습니다:

- Web UI: http://localhost:8080

## 기능

- 사용자 목록 조회 (/users)
- 사용자 추가 (/users/new)
- 사용자 수정 (/users/edit/{id})
- 사용자 삭제 (/users/delete/{id})