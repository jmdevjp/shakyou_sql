-- GROUP BY
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 GROUP BY shohin_bunrui;

-- 集約キーにNULLが含まれる場合。
SELECT shiire_tanka, COUNT(*)
  FROM Shohin
 GROUP BY shiire_tanka;

-- WHEREとGROUP BYの併用。
SELECT shiire_tanka, COUNT(*)
  FROM Shohin
 WHERE shohin_bunrui = '衣服'
 GROUP BY shiire_tanka;

-- SELECT句に集約キー以外の列名を書くとエラー。
SELECT shohin_mei, shiire_tanka, COUNT(*)
  FROM Shohin
 GROUP BY shiire_tanka;

-- 見つかった2行のうち、どちらのshohin_meiを表示すればよいか判断できないため。
-- shohin_mei | shiire_tanka | count
-- -----------+--------------+------
--         ???|          2800|     2

-- GROUP BYで列の別名は使えない。
-- SELECT句はGROUP BY句より後で実行されるため。
SELECT shohin_bunrui as sb, COUNT(*)
  FROM Shohin
 GROUP BY sb;

-- WHERE句に集約関数を書くとエラー。
SELECT shohin_bunrui, COUNT(*)
  FROM Shohin
 WHERE COUNT(*) = 2
 GROUP BY shohin_bunrui;

-- DISTINCTやGROUP BYで指定した列は重複が排除される。
-- 従って以下の2つのSQL文は同じ結果となる。
SELECT DISTINCT shohin_bunrui
  FROM Shohin;

SELECT shohin_bunrui
  FROM Shohin
 GROUP BY shohin_bunrui;
-- SELECT句でDISTINCTを使えば「選択結果から重複を除外したい」という意図を表し、
-- GROUP BY句なら「集約した結果を求めたい」という意図を表すため、
-- 目的に沿った使い方をすべき。
