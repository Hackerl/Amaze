SET SESSION time_zone = "+8:00";
ALTER DATABASE CHARACTER SET "utf8";

DROP TABLE IF EXISTS Powert;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS commodity;
DROP TABLE IF EXISTS typename;
DROP TABLE IF EXISTS Buyitem;

CREATE TABLE Powert (
    powerid INT NOT NULL,
    powername VARCHAR(12) NOT NULL,
    PRIMARY KEY(powerid)
);

CREATE TABLE user (
    username VARCHAR(20) NOT NULL PRIMARY KEY,
    pwd VARCHAR(50) NOT NULL,
    powerid INT REFERENCES Powert(powerid)
);

CREATE TABLE commodity (
    commodityId INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    commodityName VARCHAR(50) NOT NULL,
    price double(6,2) NOT NULL,
    agio double(6,2) NOT NULL,
    picture VARCHAR(300) NOT NULL,
    cType INT REFERENCES typename(typeID)
);

CREATE TABLE typename (
    typeID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    commodityTypeName VARCHAR(50) NOT NULL,
    typepicture VARCHAR(300) NOT NULL
);

CREATE TABLE Buyitem (
    typeID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    buycommodityId INT NOT NULL REFERENCES commodity(commodityId),
    buyitunm INT DEFAULT 1,
    username VARCHAR(20) NOT NULL REFERENCES user(username),
    buyData VARCHAR(500) NOT NULL,
    time DATETIME NOT NULL
);
