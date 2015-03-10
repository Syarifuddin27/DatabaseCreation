-- Jeff McGovern
-- jmcgover@calpoly.edu

-- INN 1
SELECT
   ro.roomName,
   SUM(res.Rate * DATEDIFF(res.CheckOut, res.CheckIn)) AS `Total Revenue`,
   AVG(res.Rate * DATEDIFF(res.CheckOut, res.CheckIn)) AS "Average Revenue"
   FROM
      reservations res,
      rooms ro
   WHERE ro.RoomId = res.Room
      && res.CheckIn >= "2010-09-01"
      && res.CheckIn <= "2010-11-31"
   GROUP BY
      ro.roomName
   ORDER BY
      `Total Revenue` DESC
;
-- INN 2
SELECT
   COUNT(CheckIn) AS "Friday Checkins",
   SUM(Rate * DATEDIFF(CheckOut, CheckIn)) AS "Total Revenue"
   FROM
      reservations res
   WHERE
      DAYNAME(CheckIn) = "Friday"
;
-- INN 3
SELECT
   DAYNAME(CheckIn),
   COUNT(CheckIn) AS "Number of Reservations",
   SUM(Rate * DATEDIFF(CheckOut, CheckIn)) AS "Total Revenue"
   FROM
      reservations res
   GROUP BY
      DAYNAME(CheckIn)
   ORDER BY
      (DAYOFWEEK(CheckIn) + 5) % 7
;
-- INN 4
SELECT
   ro.roomName,
   ABS(MAX(ro.basePrice - res.Rate)) AS `MaxMarkup`,
   ABS(MIN(ro.basePrice - res.Rate)) AS "Min Markup"
   FROM
      reservations res,
      rooms ro
   WHERE ro.RoomId = res.Room
   GROUP BY 
      roomName
   ORDER BY 
      `MaxMarkup` DESC
;
-- INN 5
SELECT
   ro.roomName,
   SUM(
      DATEDIFF( 
      IF(CheckOut > "2010-12-31", "2010-12-31", CheckOut) , 
      IF(CheckIn < "2010-01-01", "2010-01-01", CheckIn) )
   ) AS Days 
   FROM
      reservations res,
      rooms ro
   WHERE ro.RoomId = res.Room
      && ((res.CheckIn >= "2010-01-01"
      && res.CheckIn <= "2010-12-31")
      || (res.CheckOut >= "2010-01-01"
      && res.CheckOut <= "2010-12-31"))
   GROUP BY
      ro.roomName
   ORDER BY
      Days DESC
;
