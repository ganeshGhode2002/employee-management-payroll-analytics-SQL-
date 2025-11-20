-- 1) Total employees per department
-- 9) Employees with low attendance (<75%) in Nov 2025
WITH att AS (
SELECT e.emp_id, SUM(CASE WHEN a.status='P' THEN 1 ELSE 0 END) AS pres,
COUNT(a.att_id) AS tot
FROM employees e
LEFT JOIN attendance a ON e.emp_id = a.emp_id AND DATE_FORMAT(a.date,'%Y-%m')='2025-11'
GROUP BY e.emp_id
)
SELECT e.emp_id, CONCAT(e.first_name,' ',e.last_name) AS name, ROUND(100.0*att.pres/att.tot,2) AS att_percent
FROM att JOIN employees e ON e.emp_id = att.emp_id
WHERE att.tot>0 AND (100.0*att.pres/att.tot) < 75;


-- 10) Payroll summary: total payroll cost for month 2025
SELECT SUM(net_pay) AS total_payroll FROM salary WHERE month=2025;


-- 11) Top 3 highest paid employees
SELECT e.emp_id, CONCAT(e.first_name,' ',e.last_name) AS name, s.net_pay
FROM salary s JOIN employees e ON s.emp_id = e.emp_id
WHERE s.month=2025
ORDER BY s.net_pay DESC LIMIT 3;


-- 12) Employees without salary record for month 2025
SELECT e.emp_id, CONCAT(e.first_name,' ',e.last_name) AS name
FROM employees e
LEFT JOIN salary s ON e.emp_id = s.emp_id AND s.month=2025
WHERE s.salary_id IS NULL;


-- 13) Total deductions per department for month 2025
SELECT d.name, SUM(s.deductions) AS total_deductions
FROM salary s
JOIN employees e ON s.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
WHERE s.month=2025
GROUP BY d.dept_id, d.name;


-- 14) Give annual CTC estimate per employee (simple: net_pay * 12)
SELECT e.emp_id, CONCAT(e.first_name,' ',e.last_name) AS name, s.net_pay, (s.net_pay*12) AS annual_ctc
FROM salary s JOIN employees e ON s.emp_id = e.emp_id
WHERE s.month=2025;


-- 15) Search employees by role keyword
SELECT emp_id, CONCAT(first_name,' ',last_name) AS name, role FROM employees WHERE role LIKE '%Engineer%';


-- 16) Promote: Update role for an employee (example)
-- UPDATE employees SET role='Senior Software Engineer' WHERE emp_id=1;


-- 17) Add a salary record (example)
-- INSERT INTO salary (emp_id, month, basic, hra, allowances, deductions, net_pay) VALUES (1,2025,42000,8400,2200,1500,52100);


-- 18) Remove inactive employees (example)
-- DELETE FROM employees WHERE is_active = false;


-- 19) Find employees with same last name (possible duplicates)
SELECT last_name, COUNT(*) AS cnt FROM employees GROUP BY last_name HAVING COUNT(*)>1;


-- 20) Complex: Department wise average attendance percent for Nov 2025
WITH emp_month_att AS (
SELECT e.emp_id, e.dept_id,
SUM(CASE WHEN a.status='P' THEN 1 ELSE 0 END) AS pres,
COUNT(a.att_id) AS tot
FROM employees e
LEFT JOIN attendance a ON e.emp_id = a.emp_id AND DATE_FORMAT(a.date,'%Y-%m')='2025-11'
GROUP BY e.emp_id
)
SELECT d.name,
ROUND(AVG(100.0 * emp_month_att.pres/NULLIF(emp_month_att.tot,0)),2) AS avg_att_percent
FROM departments d
LEFT JOIN emp_month_att ON d.dept_id = emp_month_att.dept_id
GROUP BY d.dept_id, d.name;