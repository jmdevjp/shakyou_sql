-- 相関クエリ
SELECT shohin_bunrui, shohin_mei, hanbai_tanka
  FROM Shohin AS S1
 WHERE hanbai_tanka > (SELECT AVG(hanbai_tanka)
                         FROM Shohin AS S2
                        WHERE S1.shohin_bunrui = S2.shohin_bunrui
                        GROUP BY shohin_bunrui);

-- 相関名のスコープ
-- エラー。クエリからサブクエリで定義したS2は参照できない。
/*
SELECT shohin_bunrui, shohin_mei, hanbai_tanka
  FROM Shohin AS S1
 WHERE S1.shohin_bunrui = S2.shohin_bunrui
   AND hanbai_tanka > (SELECT AVG(hanbai_tanka)
                         FROM Shohin AS S2
                        GROUP BY shohin_bunrui);
*/
