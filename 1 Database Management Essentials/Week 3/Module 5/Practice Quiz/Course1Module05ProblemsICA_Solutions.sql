#Sol-1
SELECT EventNo, DateHeld, Customer.CustNo, CustName,
               Facility.FacNo, FacName
  FROM EventRequest, Customer, Facility
  WHERE City = 'Boulder' AND DateHeld BETWEEN '2013-01-01' AND '2013-12-31'
        AND EventRequest.CustNo = Customer.CustNo 
        AND EventRequest.FacNo = Facility.FacNo;
#Sol-2
SELECT Customer.CustNo, CustName, EventNo, 
               DateHeld, Facility.FacNo, FacName, EstCost/EstAudience AS AudCost
  FROM EventRequest, Customer, Facility
  WHERE DateHeld BETWEEN '2013-01-01' AND '2013-12-31' AND EstCost/EstAudience < 0.2
        AND EventRequest.CustNo = Customer.CustNo 
        AND EventRequest.FacNo = Facility.FacNo;
#Sol-3
SELECT Customer.CustNo, CustName, SUM(EstCost) AS TotEstCost
  FROM EventRequest, Customer
  WHERE Status = 'Approved'
        AND EventRequest.CustNo = Customer.CustNo
  GROUP BY Customer.CustNo, CustName;
#Sol-4
INSERT INTO Customer 
  (CustNo, CustName, Address, Internal, Contact, Phone, City, State, Zip)
VALUES ('C106', 'Natalie Portman', 'Park Street', 'Y', 'Self', '7203460',
               'Los Angeles', 'CO', '80204');
#Sol-5
SET SQL_SAFE_UPDATES = 0;
UPDATE Resourcetbl 
  SET Rate = Rate * 1.1 
  WHERE ResName = 'nurse';
SET SQL_SAFE_UPDATES = 1;
#Sol-6
DELETE FROM Customer
  WHERE CustNo = 'C106';
