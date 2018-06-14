CREATE TABLE Customer (
	custno char(8) NOT NULL,
	custname varchar(40) NOT NULL,
	address varchar(50) NOT NULL,
	Internal char(1) NOT NULL,
	contact varchar(40) NOT NULL,
	phone varchar(12) NOT NULL,
	city varchar(20) NOT NULL,
	state varchar(20) NOT NULL,
	zip varchar(10) NOT NULL,
	CONSTRAINT CustomerPk PRIMARY KEY(custno)
);