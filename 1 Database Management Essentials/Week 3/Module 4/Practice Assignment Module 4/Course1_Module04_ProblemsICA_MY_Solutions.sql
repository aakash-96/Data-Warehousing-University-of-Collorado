#Sol-1
SELECT CustNo, CustName, Phone, City FROM Customer;
#Sol-2
SELECT CustNo, CustName, Phone, City FROM Customer WHERE State = 'CO';
#Sol-3
SELECT * FROM EventRequest WHERE EstCost > 4000 ORDER BY DateHeld;
#Sol-4
SELECT EventNo, DateHeld, Status, EstAudience FROM EventRequest WHERE (Status = 'Approved' AND EstAudience > 9000) OR (Status = 'Pending' AND EstAudience > 7000);
#Sol-5
SELECT EventNo, DateHeld, Customer.CustNo, CustName FROM EventRequest, Customer WHERE City = 'Boulder' AND DateHeld BETWEEN '2013-12-01'AND '2013-12-31' AND EventRequest.CustNo = Customer.CustNo;
#Sol-6
SELECT PlanNo, AVG(NumberFld) AS AvgNumResources FROM EventPlanLine WHERE LocNo = 'L100' GROUP BY PlanNo;
#Sol-7
SELECT PlanNo, AVG(NumberFld) AS AvgNumResources, COUNT(*) AS NumEventLines FROM EventPlanLine WHERE LocNo = 'L100' GROUP BY PlanNo HAVING COUNT(*) > 1;
