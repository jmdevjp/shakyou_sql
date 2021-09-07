-- テーブルを空にする。
DELETE FROM Shohin;

-- 探索型DELETE。
DELETE FROM Shohin
 WHERE hanbai_tanka >= 4000;

-- TRUNCATE(必ずテーブルを全行削除する)
TRUNCATE Shohin;
