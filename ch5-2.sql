-- サブクエリ
SELECT shohin_bunrui, cnt_shohin
  FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
          FROM Shohin
        GROUP BY shohin_bunrui) AS ShohinSum;

-- サブクエリ(階層を増やす)
SELECT shohin_bunrui, cnt_shohin
  FROM (SELECT *
          FROM (SELECT shohin_bunrui, COUNT(*) AS cnt_shohin
                  FROM Shohin
                 GROUP BY shohin_bunrui) AS ShohinSum
         WHERE cnt_shohin = 4) AS ShohinSum2;

-- スカラ・サブクエリ
-- 「全体の平均の販売単価より販売単価が高い商品だけを検索する。」場合、
-- AVG関数をWHERE句で使おうとしても使えない。
/*
SELECT shohin_id, shohin_mei, hanbai_tanka
  FROM Shohin
 WHERE hanbai_tanka > AVG(hanbai_tanka);
*/

-- WHERE句にスカラ・サブクエリの結果(=値)を指定するため合法。
SELECT shohin_id, shohin_mei, hanbai_tanka
  FROM Shohin
 WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
                       FROM Shohin);

-- SELECT句に書くサブクエリ
SELECT shohin_id,
       shohin_mei,
       hanbai_tanka,
       (SELECT AVG(hanbai_tanka)
          FROM Shohin) AS avg_tanka
  FROM Shohin;

-- HAVING句に書くサブクエリ 
SELECT shohin_bunrui, AVG(hanbai_tanka)
  FROM Shohin
 GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) > (SELECT AVG(hanbai_tanka)
                              FROM Shohin);

-- スカラ・サブクエリではないのでSELECT句に書けない。
-- (複数行を返すサブクエリになっている)
/*
SELECT shohin_id,
       shohin_mei,
       hanbai_tanka,
       (SELECT AVG(hanbai_tanka)
          FROM Shohin
         GROUP BY shohin_bunrui) AS avg_tanka
  FROM Shohin;
*/
