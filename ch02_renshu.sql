-- 2.1
SELECT shohin_mei, torokubi
  FROM Shohin
 WHERE torokubi >= '2009-04-28';

-- 2.2
SELECT *
      FROM Shohin
     WHERE shiire_tanka = NULL;
/*
 shohin_id | shohin_mei | shohin_bunrui | hanbai_tanka | shiire_tanka | torokubi
-----------+------------+---------------+--------------+--------------+----------
(0 rows)
*/

SELECT *
      FROM Shohin
     WHERE shiire_tanka <> NULL;
/*
 shohin_id | shohin_mei | shohin_bunrui | hanbai_tanka | shiire_tanka | torokubi
-----------+------------+---------------+--------------+--------------+----------
(0 rows)
*/

SELECT *
      FROM SHohin
     WHERE shohin_mei > NULL;
/*
 shohin_id | shohin_mei | shohin_bunrui | hanbai_tanka | shiire_tanka | torokubi
-----------+------------+---------------+--------------+--------------+----------
(0 rows)
*/

-- 2.3
SELECT shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 WHERE NOT hanbai_tanka - shiire_tanka < 500;

SELECT shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 WHERE shiire_tanka - hanbai_tanka <= -500;

-- 2.4
SELECT shohin_mei, shohin_bunrui,
       hanbai_tanka * 0.9 - shiire_tanka as rieki
  FROM Shohin
 WHERE
      (hanbai_tanka * 0.9 - shiire_tanka) > 100
      AND (   shohin_bunrui = '事務用品'
	   OR shohin_bunrui = 'キッチン用品');

