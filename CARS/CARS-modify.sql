-- Jeff McGovern
-- jmcgover@calpoly.edu

DELETE FROM carData WHERE NOT ((year >= 1981 AND Accelerate >= 14 AND Accelerate <= 15) OR Weight > 4900);

SELECT * FROM carData ORDER BY Year, Id;

ALTER TABLE carData DROP MPG;
ALTER TABLE carData DROP Cylinders;
ALTER TABLE carData DROP Edispl;
ALTER TABLE carData DROP Horsepower;

DELETE FROM carData WHERE Weight > 2000 AND Weight < 3000;

SELECT * FROM carData ORDER BY Year, Id;
