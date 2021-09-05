-- 3.1
-- - GROUP BY句がWHERE句より先にある
-- - GROUP BY句で使っていない列名がSELECT句にある
-- - 計算不可能な列が集約関数SUMに指定されている
SELECT shohin_id, SUM(shohin_mei)
  FROM Shohin
 GROUP BY shohin_bunrui
 WHERE torokubi > '2009-09-01';

-- 3.2
SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
  FROM Shohin
 GROUP BY shohin_bunrui
HAVING SUM(hanbai_tanka) > SUM(shiire_tanka) * 1.5;

-- 3.3
SELECT *
  FROM Shohin
 ORDER BY torokubi DESC, hanbai_tanka;
