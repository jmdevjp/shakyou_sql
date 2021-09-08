-- UPDATE
UPDATE Shohin
   SET torokubi = '2009-10-10';

-- 探索型UPDATE
UPDATE Shohin
   SET hanbai_tanka = hanbai_tanka * 10
 WHERE shohin_bunrui = 'キッチン用品';

-- NULLクリア
UPDATE Shohin
   SET torokubi = NULL
 WHERE shohin_id = '0008';

-- 複数列の更新 (正しく更新できるが冗長)
UPDATE Shohin
   SET hanbai_tanka = hanbai_tanka * 10
 WHERE shohin_bunrui = 'キッチン用品';
UPDATE Shohin
   SET shiire_tanka = shiire_tanka / 2
 WHERE shohin_bunrui = 'キッチン用品';

-- 複数列の更新 (冗長な処理を1つのUPDATE文にまとめる方法①)
UPDATE Shohin
   SET hanbai_tanka = hanbai_tanka * 10,
       shiire_tanka = shiire_tanka / 2
 WHERE shohin_bunrui = 'キッチン用品';

-- 複数列の更新 (冗長な処理を1つのUPDATE文にまとめる方法②)
-- PostgreSQLとDB2でのみ使用可能。
UPDATE Shohin
   SET (hanbai_tanka, shiire_tanka) = (hanbai_tanka * 10, shiire_tanka / 2)
 WHERE shohin_bunrui = 'キッチン用品';
