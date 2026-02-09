-- HAVING condition
-- Having is applied to groups as additional filtering after groups
-- are  formed
-- count of the number of invoices for each vendor and total value 
-- of invoices for each vendor, where value_of_invoices>100
SELECT * FROM invoices;

SELECT vendor_id,COUNT(invoice_id) AS number_of_invoices,
SUM(invoice_total) AS value_of_invoices 
FROM invoices
GROUP BY vendor_id 
ORDER BY SUM(invoice_total) DESC;


SELECT * FROM vendors;

-- count vendors by each state
SELECT vendor_state, COUNT(vendor_id) AS number_of_vendors
FROM vendors
GROUP BY vendor_state;

-- count vendors by each state where states are in list WI, DC, CA
-- choose WHERE or HAVING
SELECT vendor_state, COUNT(vendor_id) AS number_of_vendors
FROM vendors
WHERE vendor_state IN ('WI', 'DC', 'CA')
GROUP BY vendor_state;
-- use HAVING - it is weak function applied after group by only
SELECT vendor_state, COUNT(vendor_id) AS number_of_vendors
FROM vendors
GROUP BY vendor_state
HAVING vendor_state IN ('WI', 'DC', 'CA');

-- count vendors by each state and show counts >30
SELECT vendor_state, COUNT(vendor_id) AS number_of_vendors
FROM vendors
GROUP BY vendor_state
HAVING COUNT(vendor_id)>30
;

-- subqueries
-- in SELECT part

SELECT AVG(invoice_total) FROM invoices;

-- show invoices with value more than average for all invoices

SELECT * FROM invoices 
WHERE invoice_total> (SELECT AVG(invoice_total) FROM invoices);

-- IS NULL
SELECT * FROM invoices;

-- subquery giving a list
-- show Invoices from vendors from states CA, WI
SELECT * FROM invoices WHERE vendor_id IN
(SELECT vendor_id FROM vendors WHERE vendor_state IN ("WI", "CA"));






-- use WHERE and HAVING
SELECT vendor_id,COUNT(invoice_id) AS numberOfInvoices,
SUM(invoice_total) AS value_of_invoices FROM invoices
WHERE MONTH(invoice_date)=5 AND YEAR(invoice_date)=2018
GROUP BY vendor_id 
HAVING SUM(invoice_total) >100
ORDER BY value_of_invoices;

SELECT vendor_state FROM (SELECT vendor_state, COUNT(vendor_id) AS number_of_vendors
FROM vendors
GROUP BY vendor_state) AS temp_table1;
