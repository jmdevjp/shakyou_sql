-- 5.1
CREATE VIEW ViewRenshu5_1 (shohin_mei, hanbai_tanka, torokubi)
AS
SELECT shohin_mei, hanbai_tanka, torokubi
  FROM Shohin
 WHERE hanbai_tanka >= 1000 AND torokubi = '2009-09-20';

SELECT * FROM ViewRenshu5_1;

-- 5.2
-- 失敗する。
-- shohin_id や shohin_bunrui が指定できないためNOT NULL制約が満たせない。
INSERT INTO ViewRenshu5_1 VALUES ('ナイフ', 300, '2009-11-02');

-- 5.3
SELECT shohin_id,
       shohin_mei,
       shohin_bunrui,
       hanbai_tanka,
       (SELECT AVG(hanbai_tanka)
          FROM Shohin) AS hanbai_tanka_all
  FROM Shohin;

-- 5.4
CREATE VIEW AvgTankaByBunrui
AS
SELECT shohin_id,
       shohin_mei,
       shohin_bunrui,
       hanbai_tanka,
       (SELECT AVG(hanbai_tanka)
          FROM Shohin S2
         WHERE S1.shohin_bunrui = S2.shohin_bunrui
         GROUP BY S2.shohin_bunrui) AS avg_hanbai_tanka
  FROM Shohin AS S1;
