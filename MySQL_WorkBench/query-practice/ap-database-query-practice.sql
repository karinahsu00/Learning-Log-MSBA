SELECT * FROM ap.invoices;

-- make ap default database
USE ap;
-- select all rows and columns from vendors table
SELECT * FROM vendors;

-- select vendors from CA and only show vendor id, name, and state
SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE vendor_state = 'CA';

-- select vendors from CA and WI and only show vendor id, name, and state
SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE vendor_state = 'CA' OR vendor_state = 'WI';

-- select vendors from CA and Los Angeles and only show vendor id, name, city, and state
SELECT vendor_id, vendor_name, vendor_state, vendor_city
FROM vendors
WHERE vendor_state = 'CA' AND vendor_city = 'Los Angeles';

-- show invoices with total value >100
SELECT * FROM invoices
WHERE invoice_total >100
;

-- select vendors from CA and WI, and only show vendor id and name, and state
-- order by vendor id
SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE vendor_state = 'CA' OR vendor_state = 'WI'
ORDER BY vendor_id DESC;

-- select vendors from CA Los Angeles, and only show vendor id, name, state, and city
-- order by vendor id
SELECT vendor_id, vendor_name, vendor_state, vendor_city
FROM vendors
WHERE vendor_state = 'CA' AND vendor_city = 'Los Angeles'
ORDER BY vendor_id DESC;

-- select vendors from CA ,WI, NJ, and only show vendor id, name, state, and city
-- order by vendor id use a list
SELECT vendor_id, vendor_name, vendor_state, vendor_city
FROM vendors
WHERE vendor_state IN ('CA', 'WI','NJ')
ORDER BY vendor_id DESC; -- and works with different columns

-- select vendors NOT from CA ,WI, NJ, and only show vendor id, name, state, and city
-- order by vendor id use a list
SELECT vendor_id, vendor_name, vendor_state, vendor_city
FROM vendors
WHERE vendor_state NOT IN ('CA', 'WI','NJ')
ORDER BY vendor_id DESC; -- and works with different columns

-- show invoices with value more than 100
SELECT * FROM invoices
WHERE invoice_total > 100
;

-- show invoices from June 2018

SELECT * FROM invoices
WHERE invoice_date BETWEEN '2018-06-01' AND '2018-06-30';

SELECT * FROM invoices
WHERE invoice_date >= '2018-06-01' AND invoice_date <='2018-06-30';

SELECT * FROM invoices
WHERE invoice_date > '2018-06-01' AND invoice_date <'2018-06-30'; -- exclude 

-- limit and offset
-- rank invoices by total value show top 5 
SELECT * FROM invoices
ORDER BY invoice_total DESC
LIMIT 5;

-- rank invoices by total value show skip first top 5, show 6-12
SELECT * FROM invoices
ORDER BY invoice_total DESC
LIMIT 7 OFFSET 5;

-- JOIN
-- show invoices and total for vendor with the name United Parcel Service
SELECT * 
FROM invoices JOIN vendors
ON invoices.vendor_id = vendors.vendor_id
WHERE vendor_name = 'United Parcel Service' ;

-- show invoices and total for vendor with the name Federal Express Corporation
-- use nicknames, aliases
SELECT invoice_id, invoice_total, vendor_name
FROM invoices i JOIN vendors v
ON i.vendor_id = v.vendor_id
WHERE vendor_name = 'Federal Express Corporation' ;
