-- 算術演算子
select shohin_mei, hanbai_tanka, hanbai_tanka * 2 as "hanbai_tanka_x2"from Shohin;

-- 比較演算子
select shohin_mei, shohin_bunrui from Shohin where hanbai_tanka = 500;
select shohin_mei, shohin_bunrui from Shohin where hanbai_tanka <> 500;
select shohin_mei, shohin_bunrui, hanbai_tanka from Shohin where hanbai_tanka >= 1000;
select shohin_mei, shohin_bunrui, torokubi from Shohin where torokubi < '2009-09-27';

select shohin_mei, hanbai_tanka, shiire_tanka from Shohin where hanbai_tanka - shiire_tanka >= 500;

-- 文字型に対する比較演算。
create table Chars (chr char(3) not null, primary key (chr));
begin transaction;
insert into Chars values('1');
insert into Chars values('2');
insert into Chars values('3');
insert into Chars values('10');
insert into Chars values('11');
insert into Chars values('222');
commit;

select chr from Chars where chr > '2';
drop table Chars;

-- NULLに対する比較演算
select shohin_mei, shiire_tanka from Shohin where shiire_tanka = 2800;
select shohin_mei, shiire_tanka from Shohin where shiire_tanka <> 2800;
select shohin_mei, shiire_tanka from Shohin where shiire_tanka = NULL;
select shohin_mei, shiire_tanka from Shohin where shiire_tanka is null;
select shohin_mei, shiire_tanka from Shohin where shiire_tanka is not null;



