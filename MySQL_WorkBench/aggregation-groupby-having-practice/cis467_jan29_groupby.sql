-- summary queries and group by

USE ap;

-- how many invoices in invoices table
SELECT COUNT(*) FROM invoices;

SELECT COUNT(invoice_id) FROM invoices;
SELECT COUNT(invoice_id) AS number_of_invoices FROM invoices;

-- how many vendors in invoices table
SELECT COUNT(DISTINCT vendor_id) FROM invoices; -- remember to add "DISTINCT", will be on exam

-- how many invoices in invoices table
SELECT SUM(*) FROM invoices;

-- sum works with real values (eg. money) it does not count rows (id cannot be counted)
-- proovide tital value for all invoices
SELECT SUM(invoice_total) FROM invoices;

-- provide min, max, and avg for all invoices
SELECT MIN(invoice_total) AS invoice_min,
MAX(invoice_total) AS invoice_max,
AVG(invoice_total) AS invoice_avg FROM invoices;

-- provide min, max, and avg for all invoices, and round avg values to 2 decimal
SELECT MIN(invoice_total) AS invoice_min,
MAX(invoice_total) AS invoice_max,
ROUND(AVG(invoice_total),2) AS invoice_avg FROM invoices;

-- provide min, max, and avg for all invoices, and round avg values to 2 decimal
-- only for invoices with unpaid balance
SELECT MIN(invoice_total) AS invoice_min,
MAX(invoice_total) AS invoice_max, ROUND(AVG(invoice_total),2) AS invoice_avg FROM invoices
WHERE invoice_total-payment_total-credit_total >0;
-- show balances with balance due
SELECT *, invoice_total-payment_total-credit_total AS balance_due
FROM invoices
WHERE invoice_total-payment_total-credit_total >0;

-- show balances without balance due
SELECT *, invoice_total-payment_total-credit_total AS balance_due
FROM invoices
WHERE invoice_total-payment_total-credit_total =0;

-- group by

-- count of the number of invoices for each vendor
SELECT vendor_id, COUNT(*) AS number_of_invoices FROM invoices
GROUP BY vendor_id;

-- count of the number of invoices for each vendor and total value
-- of invoices for each vendor
SELECT vendor_id, COUNT(invoice_id) AS number_of_invoices,
SUM(invoice_total) AS value_of_invoices FROM invoices
GROUP BY vendor_id
ORDER BY value_of_invoices;

-- count of the number of invoices for each vendor and total value
-- of invoices for each vendor, show vendor with highest invoice_total
SELECT vendor_id, COUNT(invoice_id) AS number_of_invoices,
SUM(invoice_total) AS value_of_invoices FROM invoices
GROUP BY vendor_id
ORDER BY value_of_invoices DESC;

-- count of the number of invoices for each vendor and total value
-- of invoices for each vendor, show vendor with highest invoice_total
-- add vendor name with largest invoice_total
SELECT invoices.vendor_id, COUNT(invoice_id) AS number_of_invoices,
SUM(invoice_total) AS value_of_invoices , vendor_name
FROM invoices JOIN vendors ON invoices.vendor_id = vendors.vendor_id
GROUP BY vendor_id
ORDER BY value_of_invoices DESC;

-- count of the number of invoices for each vendor and total value
-- of invoices for each vendor, show vendor with highest invoice_total
-- add vendor name with largest invoice_total, show top 3 skip 4
SELECT invoices.vendor_id, COUNT(invoice_id) AS number_of_invoices,
SUM(invoice_total) AS value_of_invoices , vendor_name
FROM invoices JOIN vendors ON invoices.vendor_id = vendors.vendor_id
GROUP BY vendor_id
ORDER BY value_of_invoices DESC
LIMIT 3 OFFSET 4;

-- roll update
SELECT vendor_state, vendor_city, COUNT(*) AS number_of_vendors
FROM vendors
GROUP BY vendor_state, vendor_city;
-- without roll up group by works for latest group only in the order of groups


-- roll up, show number of vendors by state and city
SELECT vendor_state, vendor_city, COUNT(vendor_id) AS number_of_vendors
FROM vendors
GROUP BY vendor_state, vendor_city WITH ROLLUP;


-- Having condition 

-- count of the number of invoices for each vendor and total value
-- of invoices for each vendor where value_of_invoices > 100
SELECT vendor_id, COUNT(invoice_id) AS number_of_invoices,
SUM(invoice_total) AS value_of_invoices FROM invoices
GROUP BY vendor_id HAVING value_of_invoices > 100
ORDER BY value_of_invoices;
-- use WHERE and HAVING
SELECT vendor_id, COUNT(invoice_id) AS number_of_invoices,
SUM(invoice_total) AS value_of_invoices FROM invoices
WHERE MONTH(invoice_date) = 5 AND YEAR(invoice_date) = 2018
GROUP BY vendor_id
HAVING SUM(invoice_total) > 100
ORDER BY value_of_invoices;