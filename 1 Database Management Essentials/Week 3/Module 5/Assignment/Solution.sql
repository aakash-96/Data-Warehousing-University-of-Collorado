#Sol-1
Select eventrequest.EventNo,DateHeld AS Event_Date, Count(*) AS CountOfEventPlans
FROM eventrequest INNER JOIN eventplan ON eventrequest.EventNo = eventplan.EventNo
WHERE workdate BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY eventrequest.EventNo HAVING COUNT(*) > 1;
#Sol-2
SELECT PlanNo, eventplan.EventNo, WorkDate, Activity
FROM eventrequest,eventplan,facility
WHERE eventplan.EventNo = eventrequest.EventNo AND eventrequest.facNo = facility.facNo AND facility.facname = 'basketball arena'
AND eventplan.WorkDate BETWEEN '2013-12-01' AND '2013-12-31';
#Sol-3
SELECT eventrequest.EventNo,eventrequest.DateHeld, eventrequest.Status, eventrequest.EstCost
FROM eventrequest, eventplan, facility
WHERE eventrequest.facNo = facility.facNo AND eventrequest.EventNo = eventplan.EventNo
AND facility.facname = 'basketball arena' AND eventrequest.DateHeld BETWEEN '2013-10-01' AND '2013-12-31'
AND eventplan.EmpNo IN (SELECT employee.EmpNo FROM employee WHERE employee.EmpName = 'Mary Manager');
#Sol-4
SELECT epl.PlanNo, epl.LineNo, Resourcetbl.ResName, epl.Numberfld AS Num_Of_Res, location.locName, epl.TimeStart,epl.TimeEnd
FROM EventPlanLine AS epl, Resourcetbl, location, eventplan
WHERE epl.ResNo = Resourcetbl.ResNo AND epl.locNo = location.locNo AND epl.PlanNo = eventplan.PlanNo
AND eventplan.Activity = 'Operation' AND eventplan.WorkDate BETWEEN '2013-10-01' AND '2013-12-31'
AND location.facNo IN (SELECT facility.facNo FROM facility WHERE facility.facname = 'basketball arena')
#-------------------------------------------------Databse Modification Problems----------------------------------------------
#Sol-1
INSERT INTO facility(facno,facname) VALUES (F104,'Swimming Pool');
#Sol-2
INSERT INTO location(LocNo,facno,locname) VALUES ('L107','F104','Door');
#Sol-3
INSERT INTO location(LocNo,facno,locname) VALUES ('L108','F104','Locker Room');
#Sol-4
UPDATE location SET locname = 'Gate' WHERE locname = 'Door' AND facNo = 'F104';
#Sol-5
Delete FROM location WHERE locname='Locker room' AND facNo = 'F104';