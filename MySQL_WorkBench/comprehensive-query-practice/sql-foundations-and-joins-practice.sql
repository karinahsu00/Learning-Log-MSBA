SELECT * FROM ap.invoices;

-- make ap default database
USE ap;
-- select all rows and columns from vendors table
SELECT * FROM vendors;

-- select vendors from CA and only show vendor id and name, and state 
SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE vendor_state = 'CA';

-- select vendors from CA and only show vendor id and name, and state
-- order by vendor id 
SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE vendor_state = 'CA' 
ORDER BY vendor_id DESC;

-- select vendors from CA , WI, NJ and only show vendor id and name, and state
-- order by vendor id 
SELECT vendor_id, vendor_name, vendor_state,vendor_city
FROM vendors
WHERE vendor_state = 'CA' AND vendor_city = 'Los Angeles'
ORDER BY vendor_id DESC;-- and works with different columns 

-- select vendors from CA , WI, NJ and only show vendor id and name, and state
-- order by vendor id 
SELECT vendor_id, vendor_name, vendor_state,vendor_city
FROM vendors
WHERE vendor_state = 'CA' OR vendor_state = 'WI' OR vendor_state = 'NJ'
ORDER BY vendor_id DESC;-- and works with different columns 

-- select vendors from CA , WI, NJ and only show vendor id and name, and state
-- order by vendor id use a list 
SELECT vendor_id, vendor_name, vendor_state,vendor_city
FROM vendors
WHERE vendor_state IN ('CA','WI','NJ') 
ORDER BY vendor_id DESC;-- and works with different columns 

-- select vendors NOT from CA , WI, NJ and only show vendor id and name, and state
-- order by vendor id use a list 
SELECT vendor_id, vendor_name, vendor_state,vendor_city
FROM vendors
WHERE vendor_state NOT IN ('CA','WI','NJ') 
ORDER BY vendor_state DESC, vendor_id ;-- and works with different columns


-- select vendors from CA and WI and only show vendor id and name, 
-- and state 
SELECT vendor_id, vendor_name, vendor_state
FROM vendors
WHERE vendor_state = 'CA' OR vendor_state = 'WI';

-- select vendors from CA and los angeles and only show vendor id and name, 
-- and state 
SELECT vendor_id, vendor_name, vendor_state, vendor_city
FROM vendors
WHERE vendor_state = 'CA' AND vendor_city = 'Los Angeles';

-- show invoices with total value >100

SELECT * FROM invoices; 

-- show invoices with value more than 100
SELECT * FROM invoices
WHERE invoice_total >=100
;
-- show invoices from june 2018

SELECT * FROM invoices
WHERE invoice_date BETWEEN '2018-06-01' AND '2018-06-30';

SELECT * FROM invoices
WHERE invoice_date > '2018-06-01' AND invoice_date <'2018-06-30';-- exclude end points

-- limit and offset
-- rank invoices by total value show top 5 
SELECT * FROM invoices
ORDER BY  invoice_total DESC
LIMIT 5; 

-- rank invoices by total value show  skip first 5, show 6-12
SELECT * FROM invoices
ORDER BY  invoice_total DESC
LIMIT 7 OFFSET 5; 

-- JOIN
-- show invoices and total for vendor with the name Federal Express Corporation
SELECT invoice_id,invoice_total,vendor_name 
FROM invoices JOIN vendors
ON invoices.vendor_id = vendors.vendor_id
WHERE vendor_name = 'Federal Express Corporation'; 

-- show invoices and total for vendor with the name Federal Express Corporation
-- use nicknames, aliases
SELECT invoice_id,invoice_total,vendor_name 
FROM invoices i JOIN vendors v
ON i.vendor_id = v.vendor_id
WHERE v.vendor_name = 'Federal Express Corporation'; 

SELECT * FROM ex.employees;
use ex;
-- inner join
-- left join
select *
FROM employees e LEFT  JOIN departments d
ON e.department_number = d.department_number;

-- left and right join using union, show all departments even without employees
select *
FROM employees e   JOIN departments d
ON e.department_number = d.department_number;
-- use union for full outer join 
select *
FROM employees e  LEFT JOIN departments d
ON e.department_number = d.department_number
UNION 
select *
FROM employees e  RIGHT JOIN departments d
ON e.department_number = d.department_number;

select *
FROM employees e  LEFT JOIN departments d
ON e.department_number = d.department_number
UNION ALL
select *
FROM employees e  RIGHT JOIN departments d
ON e.department_number = d.department_number;




-- regular expressions
-- LIKE operator
USE university;
SELECT * FROM students;
-- show students whose name starts with K
SELECT * FROM students
WHERE studentLastName LIKE ('k%'); 

-- show students whose name starts with K and ends with y
SELECT * FROM students
WHERE studentLastName LIKE ('k%')
AND studentLastName LIKE ('%y');

-- show students whose name has K anywhere in the last name
SELECT * FROM students
WHERE studentLastName LIKE ('%k%');

-- regexp
-- show students whose name has K anywhere in the last name
SELECT * FROM students
WHERE studentLastName REGEXP ('k');

-- show students whose name has K at the begining last name
SELECT * FROM students
WHERE studentLastName REGEXP ('^k');

-- show students whose name has K at the end last name
SELECT * FROM students
WHERE studentLastName REGEXP ('k$');

-- show students whose name has au
SELECT * FROM students
WHERE studentLastName REGEXP ('[au]');

-- show students whose LAST name starts with p or g
SELECT * FROM students
WHERE studentLastName REGEXP ('^[pg]');

-- show students whose LAST name ends with n or e
SELECT * FROM students
WHERE studentLastName REGEXP ('[ne]$');

-- DATE OPERATIONS
use ap;

SELECT * FROM invoices;
-- show invoices in May 2018
SELECT * FROM invoices
WHERE YEAR(invoice_date)=2018 AND MONTH(invoice_date)=5;

-- show invoices in 21st May 2018
SELECT * FROM invoices
WHERE YEAR(invoice_date)=2018 AND MONTH(invoice_date)=5
AND DAY(invoice_date)=21;

