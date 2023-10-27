create database Test2;

use Test2;

CREATE TABLE `user` (
  `username` varchar(20) unique NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `phone` decimal(10,0) DEFAULT NULL,
  `isAdmin` bit default 0,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE vehicle_management.vehicle (
  `vehicleId` int NOT NULL AUTO_INCREMENT,
  `vehicleNumber` varchar(16) NOT NULL DEFAULT '000000',
  `vehicleType` varchar(16) NOT NULL ,
  `seats` int DEFAULT '4',
  `vehicleRent` int ,
  `vehicleImage`  varchar(255) NOT NULL ,
  `isRented` bit default 0,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

CREATE TABLE `vehicleToUser` (
  `username` varchar(20) NOT NULL ,
  `vehicleId` int NOT NULL ,
  PRIMARY KEY (`username`, `vehicleId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;


INSERT INTO test2.`user` (username,password,fname,phone,isAdmin) VALUES
	 ('admin','admin','Admin',123456789,1),
	 ('amit','12345','amit',123456789,0);

	 
	 INSERT INTO vehicle_management.vehicle
 (vehicleNumber,vehicleType,seats,vehicleRent,vehicleImage,isRented) values
	('OEBF5', 'Bus', 50, 500, '../resources/Pictures/car1.jpg', 0),
	 ('YBJM4I', 'Car', 4, 1000, '../resources/Pictures/bus2.jpg', 0),
	 ('FGMMG', 'Bike', 50, 500, '../resources/Pictures/bike1.jpg', 0),
	 ('JTOLH', 'Truck', 4, 1000, '../resources/Pictures/truck1.jpg', 0),
	 ('OMBF5', 'Bus', 50,500,'../resources/Pictures/car2.jpg', 0),
	 ('Y45RI', 'Car', 4, 1000, '../resources/Pictures/bus2.jpg', 0),
	('TUNGI', 'Bike', 50, 500, '../resources/Pictures/car2.jpg', 0),
	 ('WSXDC', 'Truck', 4, 1000, '../resources/Pictures/bus2.jpg', 0);
