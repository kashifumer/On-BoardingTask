--  Query for question 1a

SELECT p.Name, p.Id
FROM  Property AS p INNER JOIN
         OwnerProperty AS op ON p.Id = op.PropertyId
WHERE (op.OwnerId = 1426)


-- Query for question for 1b

SELECT PropertyId, CurrentHomeValue
FROM  PropertyFinance
WHERE (PropertyId = 5597) OR
         (PropertyId = 5637) OR
         (PropertyId = 5638)


-- Query for queston C-1
SELECT PropertyId, CASE WHEN PaymentFrequencyId = 1 THEN DATEDIFF(Week, StartDate, EndDate) * PaymentAmount WHEN PaymentFrequencyId = 2 THEN (DATEDIFF(Week, StartDate, EndDate) * 2) * PaymentAmount WHEN PaymentFrequencyId = 3 THEN (DATEDIFF(WEEK, StartDate, EndDate) * 3) * PaymentAmount ELSE '' END AS totalpaymentamount
FROM  TenantProperty
WHERE (PropertyId = 5597) OR
         (PropertyId = 5637) OR
         (PropertyId = 5638)



-- Query for question C-2

SELECT PropertyId, Yield
FROM  PropertyFinance
WHERE (PropertyId = 5597) OR
         (PropertyId = 5637) OR
         (PropertyId = 5638)


-- Query for question d
SELECT Id, ProviderId, PropertyId, OwnerId, PaymentAmount, JobStartDate, JobEndDate, JobDescription, JobStatusId, UpdatedBy, CreatedOn, CreatedBy, UpdatedOn, MaxBudget, PercentDone, Note, AcceptedQuote, OwnerUpdate, ServiceUpdate, JobRequestId
FROM  Job
WHERE (JobStatusId = 1)


-- Query for question 1e 
-- Property 5597

SELECT p.Name, pr.FirstName, pr.LastName, tp.PaymentAmount * 1 AS weeklypayment, tp.PaymentAmount * 1 * 2 AS fortnightlypayment, tp.PaymentAmount * 1 * 4 AS monthlypayment
FROM  Property AS p INNER JOIN
         TenantProperty AS tp ON p.Id = tp.PropertyId INNER JOIN
         Person AS pr ON tp.TenantId = pr.Id
WHERE (tp.PropertyId = 5597)

--Property 5637
SELECT p.Name, pr.FirstName, pr.LastName, tp.PaymentAmount * 2 AS weeklypayment, tp.PaymentAmount * 2 * 2 AS fortnightlypayment, tp.PaymentAmount * 2 * 4 AS monthlypayment
FROM  Property AS p INNER JOIN
         TenantProperty AS tp ON p.Id = tp.PropertyId INNER JOIN
         Person AS pr ON tp.TenantId = pr.Id
WHERE (tp.PropertyId = 5637)

-- Property 5638
SELECT p.Name, pr.FirstName, pr.LastName, tp.PaymentAmount * 3 AS weeklypayment, tp.PaymentAmount * 3 * 2 AS fortnightlypayment, tp.PaymentAmount * 3 * 4 AS monthlypayment
FROM  Property AS p INNER JOIN
         TenantProperty AS tp ON p.Id = tp.PropertyId INNER JOIN
         Person AS pr ON tp.TenantId = pr.Id
WHERE (tp.PropertyId = 5638)










