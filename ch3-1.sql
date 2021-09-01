-- COUNT関数
SELECT COUNT(*)
  FROM Shohin;

-- NULLを除外する。
SELECT COUNT(shiire_tanka)
  FROM Shohin;

-- NULLを含むデータに対するCOUNT(*)とCOUNT(列名)の違い。
CREATE TABLE NullTbl(
    col_1 int
);
BEGIN TRANSACTION;
INSERT INTO NullTbl VALUES(NULL);
INSERT INTO NullTbl VALUES(NULL);
INSERT INTO NullTbl VALUES(NULL);
COMMIT;
SELECT COUNT(*), COUNT(col_1)
  FROM NullTbl;
DROP TABLE NullTbl;

-- SUM関数
SELECT SUM(hanbai_tanka)
  FROM Shohin;

-- COUNT(*)以外の集約関数はNULLを除外する。
SELECT SUM(hanbai_tanka), SUM(shiire_tanka)
  FROM Shohin;

-- AVG関数
SELECT AVG(hanbai_tanka)
  FROM Shohin;

SELECT AVG(hanbai_tanka), AVG(shiire_tanka)
  FROM Shohin;

-- MIN関数、MAX関数
SELECT MAX(hanbai_tanka), MIN(shiire_tanka)
  FROM Shohin;

-- 順序が定義できるデータ型なら適用できる。
SELECT MAX(torokubi), MIN(torokubi)
  FROM Shohin;

-- DISTINCT
-- 商品分類の重複を除いた結果をCOUNTする。
SELECT COUNT(DISTINCT shohin_bunrui)
  FROM Shohin;

SELECT SUM(hanbai_tanka), SUM(DISTINCT hanbai_tanka)
  FROM Shohin;
