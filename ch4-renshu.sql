-- 4.1
-- 0行のレコードを得る。

-- 4.2
-- 商品IDの主キー制約違反のため、コピーが失敗する。

-- 4.3
CREATE TABLE ShohinSaeki
(shohin_id CHAR(4) NOT NULL,
 shohin_mei VARCHAR(100) NOT NULL,
 hanbai_tanka INTEGER,
 shiire_tanka INTEGER,
 saeki INTEGER,
 PRIMARY KEY (shohin_id));

INSERT INTO ShohinSaeki (shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, saeki)
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka, hanbai_tanka - shiire_tanka
  FROM Shohin;

-- 4.4
BEGIN TRANSACTION;

UPDATE ShohinSaeki
   SET hanbai_tanka = hanbai_tanka - 1000
 WHERE shohin_mei = 'カッターシャツ';

UPDATE ShohinSaeki
   SET saeki = hanbai_tanka - shiire_tanka
 WHERE shohin_mei = 'カッターシャツ';

COMMIT;
