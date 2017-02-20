create database if not exists CustomerManager;
use CustomerManager;

create table if not exists Account(
	accountID integer(10) primary key not null auto_increment,
    email varchar(50),
    password varchar(50)	
);

create table if not exists CustomerInformation(
	accountID integer(10) primary key not null,
    firstName varchar(30),
    lastName varchar(30),
    address varchar(50),
    constraint fk_acount
		foreign key (accountID) references Account (accountID) on delete cascade
);


/* -------------  ------------------- */

create table if not exists OrderInfor(
	orderID integer primary key not null auto_increment,
    createDate timestamp default current_timestamp,
    shippedDate timestamp default '2000-01-01 00:00:00',
    shippingFee double
);
Create table if not exists Product(
	productID integer primary key not null auto_increment,
    productName varchar(40),
    productCode varchar(40),
    description varchar(50)
);
Create table if not exists InforProductOfOrder(
	quantity integer not null,
    price double not null,
    discount integer,
    orderID integer not null,
    productID integer not null,
    constraint fk_1
		foreign key (orderID) references OrderInfor (orderID) on delete cascade,
	constraint fk_2
		foreign key (productID) references Product (productID) on delete cascade
);

/* -------------  ------------------- */

insert into OrderInfor(shippingFee) values(10),(5),(3);
insert into Product(productName,productCode,description) values('Laptop1','PL-1','xxxx'),('Laptop2','PL-2','yyyyy'),('Laptop3','PL-3','zzzzzz');
insert into InforProductOfOrder(quantity,price,discount,orderID,productID) values(1,1000,5,1,1),(2,1000,5,1,2),(2,1000,5,2,2),(3,5000,10,2,3);

select * from OrderInfor;

select * from Product;

select * from InforProductOfOrder;

select * from OrderInfor join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID;
select * from OrderInfor left join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID;
select * from OrderInfor right join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID;
select * from OrderInfor inner join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID;

select * from OrderInfor left join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID
union all
select * from OrderInfor right join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID;

/* -------------  ------------------- */
--  delete from OrderInfor where OrderInfor.orderID =1;

select OrderInfor.orderID, InforProductOfOrder.price from OrderInfor left join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID;
select OrderInfor.orderID,count(OrderInfor.orderID) from OrderInfor left join InforProductOfOrder on OrderInfor.orderID =InforProductOfOrder.orderID group by OrderInfor.orderID;
