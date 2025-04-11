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

## 한글 인코딩 설정

Spring Boot 3.x와 MySQL 8.0에서 한글 인코딩을 제대로 처리하기 위해 필요한 핵심 설정들:

### 1. MySQL 관련 설정

```sql
-- 테이블 생성 시 CHARACTER SET과 COLLATION 설정
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    email VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- SQL 실행 전 인코딩 설정
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;
```

### 2. MySQL 서버 구성 (docker-compose.yml)

```yaml
mysql:
  image: mysql:8.0
  environment:
    MYSQL_CHARACTER_SET_SERVER: utf8mb4
    MYSQL_COLLATION_SERVER: utf8mb4_unicode_ci
  command: >
    --character-set-server=utf8mb4
    --collation-server=utf8mb4_unicode_ci
    --default-authentication-plugin=mysql_native_password
    --skip-character-set-client-handshake
    --init-connect='SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci'
```

### 3. Spring Boot 애플리케이션 설정 (application.yml)

```yaml
spring:
  datasource:
    url: jdbc:mysql://mysql:3306/myappdb?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul
  jpa:
    database-platform: org.hibernate.dialect.MySQLDialect
    properties:
      hibernate:
        connection:
          characterEncoding: UTF-8
          useUnicode: true
```

### 4. JVM 설정 (Dockerfile)

```dockerfile
ENTRYPOINT ["java", "-Dfile.encoding=UTF-8", "-jar", "app.jar"]
```

### 5. HTML 템플릿 설정

```html
<meta charset="UTF-8">
```

Spring Boot 3.x에서는 이미 많은 부분이 UTF-8로 기본 설정되어 있어 과거 버전들에 비해 설정이 간소화되었습니다. 