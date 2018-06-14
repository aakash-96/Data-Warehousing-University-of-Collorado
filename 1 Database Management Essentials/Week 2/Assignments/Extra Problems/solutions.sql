CREATE TABLE Customer
(
  CustNo CHAR(10) not null,
  CustFirstName varchar(20) not null,
  CustLastName varchar(30) not null,
  CustCity varchar(30),
  CustState CHAR(5),
  CustZip CHAR(10),
  CustBal DECIMAL(10,2),
  CONSTRAINT CustomerPK PRIMARY KEY (CustNo)
);

CREATE TABLE Employee
(
  EmpNo CHAR(8) NOT NULL,
  EmpFirstName varchar(20) NOT NULL,
  EmpLastName  varchar(30)	NOT NULL,
  EmpPhone     CHAR(15),
  EmpEmail     varchar(50) not null,
  CONSTRAINT EmployeePK PRIMARY KEY (EmpNo),
  CONSTRAINT UniqueEmpEmail UNIQUE (EmpEmail),
  CONSTRAINT UniqueEmpPhone UNIQUE (EmpPhone)
);

CREATE TABLE OrderTbl
(
  OrdNo CHAR(8) not null,
  OrdDate DATE not null,
  CustNo CHAR(8) not null,
  EmpNo CHAR(8),
  CONSTRAINT OrderTblPK PRIMARY KEY (OrdNo),
  CONSTRAINT CustNoFK FOREIGN KEY (CustNo) REFERENCES Customer (CustNo),
  CONSTRAINT EmpNoFK FOREIGN KEY (EmpNo) REFERENCES Employee (EmpNo)
);