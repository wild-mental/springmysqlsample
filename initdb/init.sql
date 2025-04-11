-- init.sql: 컨테이너 최초 실행 시 자동 적용되는 SQL
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO users (name, email) VALUES
('홍길동', 'hong@example.com'),
('김영희', 'kim@example.com');