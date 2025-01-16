CREATE TABLE Users
(
    userid INT NOT NULL
    ,Name VARCHAR(50)
    ,phoneNumber VARCHAR(20)
    ,passwords VARCHAR(255)
    ,PRIMARY KEY(userid)
);

CREATE TABLE BankCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,userid INT NOT NULL
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Address
(
    addrid INT NOT NULL
    ,userid INT NOT NULL
    ,streetaddr VARCHAR(100)
    ,postCode VARCHAR(12)
    ,PRIMARY KEY(addrid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
);

CREATE TABLE Product
(
    pid INT NOT NULL
    ,Name VARCHAR(100)
    ,price decimal(10,2)
    ,PRIMARY KEY(pid)
);

CREATE TABLE OrderItem
(
    itemid INT NOT NULL
    ,pid INT NOT NULL
    ,price decimal(10,2)
    ,PRIMARY KEY(itemid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Orders
(
    orderNumber INT NOT NULL
    ,paymentState VARCHAR(12)
    ,totalAmount decimal(10,2)
    ,PRIMARY KEY (orderNumber)
);


CREATE TABLE Reviews
(
     userid INT NOT NULL
    ,pid INT NOT NULL
    ,grade FLOAT
    ,PRIMARY KEY(userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Users(userid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Contain	
(
    orderNumber INT NOT NULL
    ,itemid INT NOT NULL
    ,quantity INT
    ,PRIMARY KEY (orderNumber,itemid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(itemid) REFERENCES OrderItem(itemid)
);

CREATE TABLE Payment
(
    orderNumber INT NOT NULL
    ,BankcardNumber VARCHAR(25) NOT NULL
    ,PRIMARY KEY(orderNumber,BankcardNumber)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(BankcardNumber) REFERENCES BankCard(cardNumber)
);

CREATE TABLE Deliver_To
(
    addrid INT NOT NULL
    ,orderNumber INT NOT NULL
    ,DateDelivered DATE
    ,PRIMARY KEY(addrid,orderNumber)
    ,FOREIGN KEY(addrid) REFERENCES Address(addrid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
);