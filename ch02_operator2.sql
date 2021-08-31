-- NOT演算子
select shohin_mei, shohin_bunrui, hanbai_tanka from Shohin where hanbai_tanka >= 1000;

-- この2つのSQLは同じ意味
select shohin_mei, shohin_bunrui, hanbai_tanka from Shohin where not hanbai_tanka >= 1000;
select shohin_mei, shohin_bunrui, hanbai_tanka from Shohin where hanbai_tanka < 1000;


-- AND演算子
select shohin_mei, shiire_tanka from Shohin where shohin_bunrui = 'キッチン用品' and hanbai_tanka >= 3000;

-- OR演算子
select shohin_mei, shiire_tanka from Shohin where shohin_bunrui = 'キッチン用品' or hanbai_tanka >= 3000;

-- ()を使う
-- AND演算子のほうが優先されるため、意図しない結果となる。
select shohin_mei, shohin_bunrui, torokubi from Shohin where shohin_bunrui = '事務用品' and torokubi = '2009-09-11' or torokubi = '2009-09-20';

-- 演算子の優先順位を()で制御する。
select shohin_mei, shohin_bunrui, torokubi from Shohin where shohin_bunrui = '事務用品' and (torokubi = '2009-09-11' or torokubi = '2009-09-20');

