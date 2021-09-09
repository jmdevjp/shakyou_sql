-- セットで行う必要がある2つのSQL文
UPDATE Shohin
   SET hanbai_tanka = hanbai_tanka - 1000
 WHERE shohin_mei = 'カッターシャツ';

UPDATE Shohin
   SET hanbai_tanka = hanbai_tanka + 1000
 WHERE shohin_mei = 'Tシャツ';

-- トランザクション開始と処理の確定 (SQL Server, PostgreSQL)
BEGIN TRANSACTION;

UPDATE Shohin
   SET hanbai_tanka = hanbai_tanka - 1000
 WHERE shohin_mei = 'カッターシャツ';

UPDATE Shohin
   SET hanbai_tanka = hanbai_tanka + 1000
 WHERE shohin_mei = 'Tシャツ';

COMMIT;
-- トランザクション開始と処理の確定 (MySQL)
/*
START TRANSACTION;
COMMIT;
*/

-- OracleとDB2にはトランザクション開始文は無い。
/*
COMMIT;
*/

-- ロールバック文
BEGIN TRANSACTION;
ROLLBACK;
