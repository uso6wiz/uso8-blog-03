-- 初期ユーザー（NoOpPasswordEncoder のため平文）。2回目以降はスキップ
INSERT INTO users (username, password, authority)
VALUES ('admin', 'password', 'ADMIN')
ON CONFLICT (username) DO NOTHING;
