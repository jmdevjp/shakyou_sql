-- ORDER BY
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 ORDER BY hanbai_tanka;

-- ORDER BY (降順)
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 ORDER BY hanbai_tanka DESC;

-- 複数のソートキー
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 ORDER BY hanbai_tanka, shohin_id;

-- NULLを含む列でソート (先頭か末尾にまとめられる)
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 ORDER BY shiire_tanka;

-- ソートキーに別名を使う
SELECT shohin_id AS id, shohin_mei, hanbai_tanka AS ht, shiire_tanka
  FROM Shohin
 ORDER BY ht, id;

-- SELECT句に含まれていない列もORDER BY句に指定できる。
SELECT shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 ORDER BY shohin_id;

-- 集約関数も使える。
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui
 ORDER BY COUNT(*);

-- ORDER BY句では列番号を指定できるが、使ってはいけない。
SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 ORDER BY hanbai_tanka DESC, shohin_id;

SELECT shohin_id, shohin_mei, hanbai_tanka, shiire_tanka
  FROM Shohin
 ORDER BY 3 DESC, 1;
