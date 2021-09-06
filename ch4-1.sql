CREATE TABLE ShohinIns
(shohin_id     CHAR(4)      NOT NULL,
 shohin_mei    VARCHAR(100) NOT NULL,
 shohin_bunrui VARCHAR(32)  NOT NULL,
 hanbai_tanka  INTEGER      DEFAULT 0,
 shiire_tanka  INTEGER      ,
 torokubi      DATE         ,
 PRIMARY KEY (shohin_id));

INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');

-- 複数行INSERT (Oracle以外)
INSERT INTO ShohinIns VALUES
('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11'),
('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL),
('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');

-- 複数行INSERT (Oracle)
/*
INSERT ALL
INTO ShohinIns VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11')
INTO ShohinIns VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL)
INTO ShohinIns VALUES ('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20')
SELECT * FROM DUAL;
*/

-- テーブルの全列に対してINSERTを行う場合、列リストは省略できる。
INSERT INTO ShohinIns VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');

-- NULLを挿入。
INSERT INTO ShohinIns VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20');
-- NOT NULL制約がついている列にNULLを指定するとエラー。
/*
INSERT INTO ShohinIns VALUES (NULL, 'フォーク', 'キッチン用品', 500, 300, '2009-09-20');
*/

-- 明示的にデフォルト値を挿入する。
INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
VALUES ('0007', 'おろしがね', 'キッチン用品', DEFAULT, 790, '2009-04-28');

-- 暗黙的にデフォルト値を挿入する。
INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui              , shiire_tanka, torokubi)
VALUES ('0007', 'おろしがね', 'キッチン用品'         , 790, '2009-04-28');

-- デフォルト値が設定されていない場合はNULLが入る。
INSERT INTO ShohinIns (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka              , torokubi)
VALUES ('0008', 'ボールペン', '事務用品', 100         , '2009-11-11');

-- shohin_mei列(NOT NULL制約)を省略するとエラー。
/*
INSERT INTO ShohinIns (shohin_id            , shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
VALUES ('0009'             , '事務用品', 1000, 500, '2009-12-12');
*/

-- テーブルからテーブルへコピー。
CREATE TABLE ShohinCopy
(shohin_id     CHAR(4)      NOT NULL,
 shohin_mei    VARCHAR(100) NOT NULL,
 shohin_bunrui VARCHAR(32)  NOT NULL,
 hanbai_tanka  INTEGER      ,
 shiire_tanka  INTEGER      ,
 torokubi      DATE         ,
 PRIMARY KEY (shohin_id));

INSERT INTO ShohinCopy (shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi)
SELECT shohin_id, shohin_mei, shohin_bunrui, hanbai_tanka, shiire_tanka, torokubi
  FROM Shohin;

-- 他のテーブルのデータを集約して挿入するINSERT...SELECT文。
CREATE TABLE ShohinBunrui
(shohin_bunrui VARCHAR(32) NOT NULL,
 sum_hanbai_tanka INTEGER,
 sum_shiire_tanka INTEGER,
 PRIMARY KEY (shohin_bunrui));

INSERT INTO ShohinBunrui (shohin_bunrui, sum_hanbai_tanka, sum_shiire_tanka)
SELECT shohin_bunrui, SUM(hanbai_tanka), SUM(shiire_tanka)
  FROM Shohin
 GROUP BY shohin_bunrui;
