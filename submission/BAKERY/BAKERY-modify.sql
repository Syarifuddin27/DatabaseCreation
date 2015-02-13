-- Jeff McGovern
-- jmcgover@calpoly.edu

ALTER TABLE items 
   DROP FOREIGN KEY `ItemReference`;

DELETE FROM goods 
   WHERE Food != "Cake";

UPDATE goods 
   SET Price=Price*1.20    
   WHERE Flavor="Strawberry" OR Flavor="Lemon";
UPDATE goods 
   SET Price=Price-2       
   WHERE Flavor="Chocolate"  OR Flavor="Napoleon";
UPDATE goods 
   SET Price=Price*(1-.10) 
   WHERE NOT 
      (Flavor="Strawberry" OR Flavor="Lemon" OR Flavor="Chocolate"  OR Flavor="Napoleon");

SELECT * FROM goods 
   ORDER BY Id;
