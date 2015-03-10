-- Jeff McGovern
-- jmcgover@calpoly.edu

ALTER TABLE wine DROP FOREIGN KEY wine_ibfk_2;
ALTER TABLE wine DROP Appellation;
ALTER TABLE wine DROP Name;

DELETE FROM wine WHERE Score < 97;
ALTER TABLE wine MODIFY Winery CHAR(14);

SELECT * FROM wine ORDER BY No;
UPDATE wine SET Price = Price * (1+(2015-Year)*(Score - 90)/100);


SELECT * FROM wine ORDER BY No;
