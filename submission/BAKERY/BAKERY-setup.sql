CREATE TABLE goods(
   Id          CHAR(30) PRIMARY KEY,
   Flavor      CHAR(30),
   Food        CHAR(30),
   Price       DOUBLE
);

CREATE TABLE customers(
   Id          INT PRIMARY KEY,
   LastName    CHAR(30),
   FirstName   CHAR(30)
);

CREATE TABLE receipts(
   ReceiptNumber  INT PRIMARY KEY,
   Date           DATE,
   CustomerId     INT REFERENCES customers
);

CREATE TABLE items(
   Receipt     INT,
   Ordinal     INT,
   Item        CHAR(30),
   FOREIGN KEY(Receipt) REFERENCES receipts(ReceiptNumber),
   FOREIGN KEY(Item) REFERENCES goods(Id)
);
