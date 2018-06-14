CREATE TABLE Employee
(
  EmpNo varchar(8) NOT NULL,
  EmpName varchar(30) NOT NULL,
  Department varchar(30) NOT NULL,
  Email varchar(30) NOT NULL,
  Phone varchar(6) NOT NULL,
  CONSTRAINT EmployeePk PRIMARY KEY (EmpNo)
);

#############################Resourcetbl###############################
CREATE TABLE ResourceTbl
(
  ResNo char(8) NOT NULL,
  ResName varchar(25) NOT NULL,
  Rate decimal(8,2) NOT NULL CHECK (Rate > 0),
  CONSTRAINT ResourceTblPk PRIMARY KEY (ResNo)
);
#Check doesn't work in MYSQL. So using delimiter

#############Insert Trigger###############
delimiter //
Create Trigger before_resourcetbl_insert before INSERT ON resourcetbl
FOR EACH ROW
BEGIN
  if(new.Rate < 0) then
    SIGNAL SQLSTATE '45000' SET Message_Text = 'Rate value can not be negative!!';
  end if;
END//
delimiter ;

###########Update Trigger##########3#
delimiter //
Create Trigger before_resourcetbl_update before UPDATE ON resourcetbl
FOR EACH ROW
BEGIN
  if(new.Rate < 0) then
    SET new.Rate = Old.Rate;
    SIGNAL SQLSTATE '45000' SET Message_Text = 'Rate value can not be negative!!';
  end if;
END//
delimiter ;


#################################################EventRequest#########################################
CREATE TABLE EventRequest
(
  EventNo char(8) NOT NULL,
  DateHeld date NOT NULL,
  DateReq date NOT NULL,
  FacNo char(8) NOT NULL,
  CustNo char(8) NOT NULL,
  DateAuth date,
  Status varchar(10) NOT NULL,
  EstCost decimal(8,2) NOT NULL,
  EstAudience int(8)  NOT NULL,
  BudNo char(8),
  CONSTRAINT EventRequestPk PRIMARY KEY (EventNo),
  CONSTRAINT Check_Status CHECK (Status in ('Pending','Denied','Approved')),
  CONSTRAINT EventRequest_CustNo_Fk FOREIGN KEY (CustNo) REFERENCES Customer(CustNo),
  CONSTRAINT EventRequest_FacNo_Fk FOREIGN KEY (FacNo) REFERENCES Facility(FacNo)
);

#############Insert Trigger###############
delimiter //
Create Trigger before_EventRequest_insert before INSERT ON EventRequest
FOR EACH ROW
BEGIN
  if(new.Status NOT IN ('Pending','Denied','Approved')) then
    SIGNAL SQLSTATE '45000' SET Message_Text = 'Status can be Pending,Denied or Approved';
  end if;
END//
delimiter ;

###########Update Trigger##########3#
delimiter //
Create Trigger before_EventRequest_update before UPDATE ON EventRequest
FOR EACH ROW
BEGIN
  if(new.Status NOT IN ('Pending','Denied','Approved')) then
    SET new.Status = Old.Status;
    SIGNAL SQLSTATE '45000' SET Message_Text = 'Status can be Pending,Denied or Approved';
  end if;
END//
delimiter ;

###############################################EventPlan#####################################################
CREATE TABLE EventPlan
(
  PlanNo char(8) NOT NULL,
  EventNo char(8) NOT NULL,
  WorkDate date NOT NULL,
  Notes varchar(20),
  Activity varchar(15) NOT NULL,
  EmpNo char(8),
  CONSTRAINT EventPlanPk PRIMARY KEY (PlanNo),
  CONSTRAINT EventPlan_EmpNo_Fk FOREIGN KEY (EmpNo) REFERENCES Employee(EmpNo),
  CONSTRAINT EventPlan_EventNo_Fk FOREIGN KEY (EventNo) REFERENCES EventRequest(EventNo)
);

###############################################EventPlanLine##################################################
CREATE TABLE EventPlanLine
(
  PlanNo char(8) NOT NULL,
  LineNo int(4) NOT NULL,
  TimeStart date NOT NULL,
  TimeEnd date NOT NULL,
  NumberFld int(4) NOT NULL,
  LocNo char(8) NOT NULL,
  ResNo char(8) NOT NULL,
  CONSTRAINT EventPlanLinePk PRIMARY KEY (PlanNo, LineNo),
  CONSTRAINT Check_StartDate_Before_EndDate CHECK (TimeEnd > TimeStart),
  CONSTRAINT EventPlanLine_LocNo_Fk FOREIGN KEY (LocNo) REFERENCES Location(LocNo),
  CONSTRAINT EventPlanLine_ResNo_Fk FOREIGN KEY (ResNo) REFERENCES ResourceTbl(ResNo),
  CONSTRAINT EventPlanLine_PlanNo_Fk FOREIGN KEY (PlanNo) REFERENCES EventPlan(PlanNo)
);

#############Insert Trigger###############
delimiter //
Create Trigger before_EventPlanLine_insert before INSERT ON EventPlanLine
FOR EACH ROW
BEGIN
  if(new.TimeStart > new.TimeEnd) then
    SIGNAL SQLSTATE '45000' SET Message_Text = 'Start Date should be before End Date!!';
  end if;
END//
delimiter ;

###########Update Trigger##########3#
delimiter //
Create Trigger before_EventPlanLine_update before UPDATE ON EventPlanLine
FOR EACH ROW
BEGIN
  if(new.TimeStart > new.TimeEnd) then
    SET new.TimeStart = Old.TimeStart;
    SET new.TimeEnd = Old.TimeEnd;
    SIGNAL SQLSTATE '45000' SET Message_Text = 'Start Date should be before End Date!!';
  end if;
END//
delimiter ;