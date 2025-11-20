-- Use the database you want, e.g. MySQL: CREATE DATABASE emp_payroll;
-- Then: USE emp_payroll;


-- Departments
CREATE TABLE departments (
dept_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
location VARCHAR(100)
);


-- Employees
CREATE TABLE employees (
emp_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
email VARCHAR(100) UNIQUE,
dept_id INT,
role VARCHAR(100),
join_date DATE,
is_active BOOLEAN DEFAULT TRUE,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


-- Salary records (one row per month per employee)
CREATE TABLE salary (
salary_id INT PRIMARY KEY AUTO_INCREMENT,
emp_id INT,
month YEAR(4),
basic DECIMAL(10,2),
hra DECIMAL(10,2),
allowances DECIMAL(10,2),
deductions DECIMAL(10,2),
net_pay DECIMAL(10,2),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);


-- Attendance (daily)
CREATE TABLE attendance (
att_id INT PRIMARY KEY AUTO_INCREMENT,
emp_id INT,
date DATE,
status CHAR(1) CHECK (status IN ('P','A','L')),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);