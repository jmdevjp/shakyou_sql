-- 列を指定して表示する。
select shohin_id, shohin_mei, shiire_tanka from Shohin;

-- *ですべての列を指定する。
select * from Shohin;
select shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi from Shohin;

-- 別名で列を表示する。
select shohin_id as id, shohin_mei as namae, shiire_tanka as tanka from Shohin;

-- 日本語の列名で表示する。
select shohin_id as "商品ID", shohin_mei as "商品名", shiire_tanka as "仕入単価" from Shohin;

-- 定数を出力する。
select '商品' as mojiretsu, 38 as kazu, '2009-02-24' as hizuke, shohin_id, shohin_mei from Shohin;

-- 指定した列の重複を除く。
select distinct shohin_bunrui from Shohin;

-- 指定した列の重複を除く。
select distinct shiire_tanka from Shohin;

-- 指定した複数の列の重複を除く。
select distinct shohin_bunrui, torokubi from Shohin;

-- where句を使って取得する行を絞る。
select shohin_mei, shohin_bunrui from Shohin where shohin_bunrui = '衣服';

-- where句に使った列を表示しなくてもよい。
select shohin_mei from Shohin where shohin_bunrui = '衣服';


-- from句の前にwhere句を書くとエラー。
select shohin_mei, shohin_bunrui where shohin_bunrui = '衣服' from Shohin;
/*
実行結果

ERROR:  syntax error at or near "from"
LINE 1: ...n_mei, shohin_bunrui where shohin_bunrui = '衣服' from Shohi...
*/

