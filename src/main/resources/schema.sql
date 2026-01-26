-- MyBatis 用。起動時に実行（spring.sql.init）
CREATE TABLE IF NOT EXISTS blogs (
  id     BIGSERIAL PRIMARY KEY,
  title  VARCHAR(255) NOT NULL,
  article TEXT
);

CREATE TABLE IF NOT EXISTS users (
  username  VARCHAR(255) PRIMARY KEY,
  password  VARCHAR(255) NOT NULL,
  authority VARCHAR(50)  NOT NULL
);
