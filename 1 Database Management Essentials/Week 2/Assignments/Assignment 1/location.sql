CREATE TABLE Location (
	locno char(8) NOT NULL,
	facno char(8) NOT NULL,
	locname varchar(40) NOT NULL,
	CONSTRAINT LocationPk PRIMARY KEY(locno),
	CONSTRAINT LocationFk FOREIGN KEY(facno) REFERENCES Facility(facno)
);