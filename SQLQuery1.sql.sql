--  Query for question 1a

SELECT p.Name, p.Id
FROM  Property AS p INNER JOIN
         OwnerProperty AS op ON p.Id = op.PropertyId
WHERE (op.OwnerId = 1426)


-- Query for question for 1b

SELECT p.Id, p.Name, pf.CurrentHomeValue
FROM  PropertyFinance AS pf INNER JOIN
         Property AS p ON pf.PropertyId = p.Id
WHERE (pf.PropertyId = 5597) OR
         (pf.PropertyId = 5637) OR
         (pf.PropertyId = 5638)


--Query for queston C-1
SELECT prp.PropertyId, p.name, format((tp.startdate),'yyyy-mm-dd') as startdate,format((tp.enddate),'yyyy-mm-dd') as enddate,prp.amount,prp.FrequencyType,
						CASE WHEN prp.frequencytype = 1 THEN DATEDIFF(Week, tp.StartDate, tp.EndDate) * prp.amount
                      WHEN prp.frequencytype = 2 THEN (DATEDIFF(Week, tp.StartDate, tp.EndDate)/2) * prp.amount
					  WHEN prp.frequencytype = 3 THEN (DATEDIFF(WEEK, tp.StartDate, tp.EndDate)/4) * prp.amount ELSE '' END AS totalpaymentamount
FROM  propertyrentalpayment prp
join TenantProperty  tp on  prp.propertyid = tp.propertyid
join property p on prp.propertyid = p.id 
join OwnerProperty op on op.PropertyId = prp.PropertyId
	where  op.OwnerId = 1426  
	order by PropertyId;


--Query for question C-2
SELECT prp.PropertyId, p.name, format((tp.startdate),'yyyy-mm-dd') as tenantstartdate,format((tp.enddate),'yyyy-mm-dd') as tenantenddate,prp.amount,prp.FrequencyType,                              
						CASE WHEN prp.frequencytype = 1 THEN ((DATEDIFF(Week, tp.StartDate, tp.EndDate) * prp.amount)/pf.currenthomevalue*100)
                      WHEN prp.frequencytype = 2 THEN (((DATEDIFF(Week, tp.StartDate, tp.EndDate)/2) * prp.amount)/pf.currenthomevalue*100)
					  WHEN prp.frequencytype = 3 THEN (((DATEDIFF(WEEK, tp.StartDate, tp.EndDate)/4) * prp.amount)/pf.currenthomevalue*100) ELSE '' END  as yield
FROM  propertyrentalpayment prp
join TenantProperty  tp on  prp.propertyid = tp.propertyid
join property p on prp.propertyid = p.id 
join OwnerProperty op on op.PropertyId = prp.PropertyId
join PropertyFinance pf on pf.PropertyId = prp.PropertyId
	where  op.OwnerId = 1426 
	order by PropertyId;


-- Query for question D
SELECT j.Id, j.JobDescription, j.PropertyId, j.OwnerId, js.Status
FROM  Job AS j INNER JOIN
         JobStatus AS js ON j.JobStatusId = js.Id
WHERE (j.JobStatusId = 1)


-- Query for question 1e 

select p.name, pr.firstname, pr.lastname, prp.amount, trt.name as paymentfrequencies
from property p
join PropertyRentalPayment prp on p.id = prp.PropertyId
join OwnerProperty op on  p.id = op.propertyid
join TenantProperty tp on p.id =tp.PropertyId
join person pr on tp.TenantId = pr.Id
join TargetRentType trt on trt.id = p.TargetRentTypeId
where op.ownerid = 1426 ; 





































