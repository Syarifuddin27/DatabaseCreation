-- INN 1
SELECT
   ro.roomName,
   ro.RoomId,
   COUNT(re.Code) AS `Reservations`
   FROM
      reservations re,
      rooms ro
   WHERE re.Room = ro.RoomId
   GROUP BY
      re.Room
   HAVING
      COUNT(re.Code) = (
         SELECT
            MIN(Reservations) AS `Lowest`
            FROM (
               SELECT
                  ro.roomName,
                  COUNT(re.Code) AS `Reservations`
                  FROM
                     reservations re,
                     rooms ro
                  WHERE re.Room = ro.RoomId
                  GROUP BY
                     re.Room
                 ) ResCtTab
         )
;
-- INN 2
SELECT
   ro.roomName,
   ro.RoomId,
   SUM(DATEDIFF(re.CheckOut, re.CheckIn)) as `Days Occupied`
   FROM
      reservations re,
      rooms ro
   WHERE  re.Room = ro.RoomId
      AND re.Room IN (
      SELECT
         ro.RoomId
         FROM
            reservations re,
            rooms ro
         WHERE re.Room = ro.RoomId
         GROUP BY
            re.Room
         HAVING
            COUNT(re.Code) = (
               SELECT
                  MAX(Reservations) AS `Highest`
                  FROM (
                     SELECT
                        ro.roomName,
                        COUNT(re.Code) AS `Reservations`
                        FROM
                           reservations re,
                           rooms ro
                        WHERE re.Room = ro.RoomId
                        GROUP BY
                           re.Room
                       ) ResCtTab
               )
      )
;
-- INN 3
SELECT
   ro.roomName,
   re.CheckIn,
   re.CheckOut,
   re.LastName,
   re.Rate,
   DATEDIFF(re.CheckOut, re.Checkin) * re.Rate AS `Paid`
   FROM
      reservations re,
      rooms ro
   WHERE  re.Room = ro.RoomId
      AND DATEDIFF(re.CheckOut, re.Checkin) * re.Rate = (
      SELECT
         MAX(DATEDIFF(re.CheckOut, re.Checkin) * re.Rate) AS `MostExpensive`
         FROM
            reservations re,
            rooms ro
         WHERE  re.Room = ro.RoomId
      )
;

-- INN 4
SELECT
   roomName,
   CheckIn,
   CheckOut,
   LastName,
   Rate,
   Cost
   FROM(
      SELECT
         re.Room,
         MAX(DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate) as `MostExp`
         FROM
            reservations re,
            rooms ro
         WHERE  re.Room = ro.RoomId
         GROUP BY
            re.Room
         ) MostExpTable,
         (

      SELECT
         re.Room,
         ro.roomName,
         re.CheckIn,
         re.CheckOut,
         re.LastName,
         re.Rate,
         DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate as `Cost`
         FROM
            reservations re,
            rooms ro
         WHERE  re.Room = ro.RoomId
         ) AllCostTable
   WHERE  MostExpTable.Room = AllCostTable.Room
      AND MostExpTable.MostExp = AllCostTable.Cost
   ORDER BY
      Cost DESC
;
-- INN 5
SELECT
   MONTHNAME(re.CheckIn),
   SUM(DATEDIFF(re.CheckOut, re.CheckIn)* re.Rate) as `Revenue`
   FROM
      reservations re
   GROUP BY
      MONTHNAME(re.CheckIn)
   HAVING SUM(DATEDIFF(re.CheckOut, re.CheckIn)* re.Rate) = (
         SELECT
            MAX(Revenue)
            FROM (
               SELECT
                  MONTHNAME(re.CheckIn),
                  SUM(DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate) as `Revenue`
                  FROM
                     reservations re
                  GROUP BY
                     MONTHNAME(re.CheckIn)
                  ) RevenueTable
         )
;
-- INN 6
SELECT 
   ro.roomName,
   ro.RoomId,
   CASE WHEN ro.RoomId in (
         SELECT
            re.Room
            FROM
               reservations re
            WHERE  re.CheckIn <= '2010-10-22'
               AND re.CheckOut > '2010-10-22'
      )
      THEN 'Occupied'
      ELSE 'Empty'
   END AS `Status`
   FROM
      rooms ro
;
-- INN 7
SELECT
   ro.roomName,
   COUNT(re.Code) as `Res at Highest`
   FROM(
      SELECT
         re.Room,
         MAX(re.Rate) AS `MaxRate`
         FROM
            reservations re
         GROUP BY
            re.Room
        ) MaxRateTable,
      reservations re,
      rooms ro
   WHERE  re.Rate = MaxRate
      AND re.Room = MaxRateTable.Room
      AND re.Room = ro.RoomId
   GROUP BY
      re.Room
   ORDER BY
      `Res at Highest`
;
