-- HAVING
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui
HAVING COUNT(*) = 2;

SELECT shohin_bunrui, AVG(hanbai_tanka)
  FROM Shohin
 GROUP BY shohin_bunrui
HAVING AVG(hanbai_tanka) >= 2500;

-- HAVING句にGROUP BY句に表れない列名を指定するとエラー。
SELECT shohin_bunrui, AVG(hanbai_tanka)
  FROM Shohin
 GROUP BY shohin_bunrui
HAVING shohin_mei = 'ボールペン';

-- WHERE句は行に対する条件を指定し、HAVING句はグループに対する条件を指定する。
-- 以下の2つのSQL文は同じ結果となるが、文意からWHERE句を使うほうがよい。
-- また、HAVING句はソート＆グループ化の後に実行されるため、WHERE句と比べてソート対象となる行数が多くなってしまう。
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui
HAVING shohin_bunrui = '衣服';

SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 WHERE shohin_bunrui = '衣服'
 GROUP BY shohin_bunrui;

