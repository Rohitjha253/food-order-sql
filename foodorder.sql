DROP DATABASE IF EXISTS `food_delivery`;
CREATE DATABASE `food_delivery`;
USE `food_delivery`;

create table `restaurants`(
`restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`address` varchar(50) NOT NULL,
`city` varchar(50) NOT NULL,
Primary Key(`restaurant_id`)
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `restaurants` VALUES(1,'Oudh 1950','Naktala','Kolkata');
INSERT INTO `restaurants` VALUES(2,'Aminia','Azadgarh','Kolkata');
INSERT INTO `restaurants` VALUES(3,'Dada Boudi Biryani','Barrackpore','Kolkata');
INSERT INTO `restaurants` VALUES(4,'Zaikebaaz','Naktala','Kolkata');




create table `customers`(
`customer_id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`email` varchar(50) NOT NULL,
`phone` varchar(50) DEFAULT NULL,
`address` varchar(50) NOT NULL,
`city` varchar(50) NOT NULL,
Primary Key(`customer_id`)
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `customers` VALUES(1,'Rohit Jha','abc@gmail.com','1234567890','22/1B RAIPUR ROAD','Kolkata');
INSERT INTO `customers` VALUES(2,'Harsha','harsha@gmail.com','99999999','Behala','Kolkata');
INSERT INTO `customers` VALUES(3,'Rohan','rohan@gmail.com','11111111','Thane','Mumbai');


create table `menu`(
`menu_id` int(11) NOT NULL AUTO_INCREMENT,
`restaurant_id` int(11) NOT NULL,
`name` varchar(50) NOT NULL,
`price` int(11) NOT NULL,
Primary Key(`menu_id`),
 CONSTRAINT FK_MENUORDER FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`restaurant_id`) ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `menu` VALUES(1,1,'chicken gulati kebab',350);
INSERT INTO `menu` VALUES(2,1,'chicken Biryani',400);
INSERT INTO `menu` VALUES(3,2,'Mutton Roll',100);
INSERT INTO `menu` VALUES(4,2,'chicken Butter Masala',300);
INSERT INTO `menu` VALUES(5,3,'chilli chicken',200);
INSERT INTO `menu` VALUES(6,3,'Mutton Biryani',400);




create table `order`(
`order_id` int(11) NOT NULL AUTO_INCREMENT,
`restaurant_id` int(11) NOT NULL,
`customer_id` int(11) NOT NULL,
`menu_id` int(11) NOT NULL,
Primary Key(`order_id`),
 CONSTRAINT FK_RESTRO FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`restaurant_id`) ON UPDATE CASCADE,
 CONSTRAINT FK_CUST FOREIGN KEY (`customer_id`) REFERENCES `customers`(`customer_id`) ON UPDATE CASCADE,
 CONSTRAINT FK_MENU FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`) ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `order` VALUES(1,1,1,2);
INSERT INTO `order` VALUES(2,2,2,4);
INSERT INTO `order` VALUES(3,3,3,6);


select * from restaurants where address='NAKTALA';

select *
from menu m
join restaurants r
on m.restaurant_id=r.restaurant_id
where m.restaurant_id=1;

INSERT INTO `order` VALUES(4,1,2,1);
INSERT INTO `order` VALUES(5,2,2,4);

select c.customer_id,c.name,c.email,c.phone,c.address,c.city,m.restaurant_id,m.name,m.price
from customers c
join `order` o
on o.customer_id=c.customer_id
join menu m
on m.menu_id=o.menu_id
where c.customer_id=3;

