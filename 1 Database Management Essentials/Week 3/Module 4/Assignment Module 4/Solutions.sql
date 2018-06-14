#Sol-1
Select DISTINCT city, state, zip
FROM customer;
#Sol-2
Select EmpName, Department, Phone, Email 
FROM employee
WHERE Phone like '3%';
#Sol-3
SELECT *
From resourcetbl
WHERE Rate BETWEEN 10 AND 20
ORDER BY Rate Asc;
#Sol-4
Select EventNo, DateAuth, Status
FROM eventrequest
WHERE Status IN ('Approved','Denied') AND DATE_FORMAT(DateAuth,'%M %Y') = 'July 2013';
#Sol-5
SELECT LocNo, LocName
FROM location INNER JOIN facility ON location.facno = facility.facno
WHERE facname = 'Basketball arena';
#Sol-6
SELECT PlanNo, COUNT(*) AS Num_Event_Lines, SUM(NumberFld) AS Num_Res_Assigned
FROM EventPlanLine
GROUP BY PlanNo;