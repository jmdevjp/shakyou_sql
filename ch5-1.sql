-- CREATE VIEW
CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui;

-- ビューを使う
SELECT shohin_bunrui, cnt_shohin
  FROM ShohinSum;

-- 多段ビュー
CREATE VIEW ShohinSumJim (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, cnt_shohin
  FROM ShohinSum
 WHERE shohin_bunrui = '事務用品';

SELECT shohin_bunrui, cnt_shohin
  FROM ShohinSumJim;

-- ビューに ORDER BY句は使えない(使わない)。
/*
CREATE VIEW ShohinSum (shohin_bunrui, cnt_shohin)
AS
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui
 ORDER BY shohin_bunrui;
*/

-- ビューに対する更新が可能な条件
-- 1. SELECT句にDISTINCTが含まれていない
-- 2. FROM句に含まれるテーブルが1つだけである
-- 3. ビューがGROUP BY句を使用していない
-- INSERT INTO ShohinSum VALUES ('電化製品', 5);
-- →テーブルの shohin_bunrui 以外の列に指定する値が無い。
-- 4. ビューがHAVING句を使用していない

-- 更新可能なビュー
CREATE VIEW ShohinJim (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
AS
SELECT *
  FROM Shohin
 WHERE shohin_bunrui = '事務用品';

-- 更新可能なビューへの挿入
INSERT INTO ShohinJim VALUES ('0009', '印鑑', '事務用品', 95, 10, '2009-11-30');

-- ビューの更新を許可する(PostgreSQL)
CREATE OR REPLACE RULE insert_rule
AS ON INSERT
TO ShohinJim DO INSTEAD
INSERT INTO Shohin VALUES (
    new.shohin_id,
    new.shohin_mei,
    new.shohin_bunrui,
    new.hanbai_tanka,
    new.shiire_tanka,
    new.torokubi
);

-- ビューの削除
DROP VIEW ShohinSum;
-- 多段ビューの削除(PostgreSQL)
DROP VIEW ShohinSum CASCADE;

-- Shohinテーブルを初期状態に戻す。
DELETE
  FROM Shohin
 WHERE shohin_id = '0009';
