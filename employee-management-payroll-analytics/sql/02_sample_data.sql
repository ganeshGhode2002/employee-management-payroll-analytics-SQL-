-- Departments
INSERT INTO departments (name, location) VALUES
('Engineering','Mumbai'),
('HR','Navi Mumbai'),
('Finance','Mumbai'),
('QA','Pune');

-- Employees
INSERT INTO employees (first_name,last_name,email,dept_id,role,join_date,is_active) VALUES
('Rahul','Patil','rahul.patil@example.com',1,'Software Engineer','2023-02-15',true),
('Sneha','Desai','sneha.desai@example.com',1,'Senior Engineer','2022-07-10',true),
('Amit','Kumar','amit.kumar@example.com',2,'HR Executive','2021-01-05',true),
('Priya','Shah','priya.shah@example.com',3,'Finance Analyst','2024-03-20',true),
('Vikram','Joshi','vikram.joshi@example.com',4,'QA Engineer','2023-09-01',true),
('Karan','Mehta','karan.mehta@example.com',1,'DevOps Engineer','2020-11-11',true);

-- Salary (month as YEAR integer like 2025)
INSERT INTO salary (emp_id, month, basic, hra, allowances, deductions, net_pay) VALUES
(1,2025,40000,8000,2000,1500,46500),
(2,2025,60000,12000,4000,2500,73500),
(3,2025,30000,6000,1000,1000,36000),
(4,2025,45000,9000,1500,2000,51500),
(5,2025,35000,7000,1200,1200,42000),
(6,2025,55000,11000,3000,2000,67000);

-- Attendance (simulate 10 days for simplicity)
INSERT INTO attendance (emp_id, date, status) VALUES
(1,'2025-11-01','P'),(1,'2025-11-02','P'),(1,'2025-11-03','A'),(1,'2025-11-04','P'),(1,'2025-11-05','P'),
(2,'2025-11-01','P'),(2,'2025-11-02','P'),(2,'2025-11-03','P'),(2,'2025-11-04','P'),(2,'2025-11-05','P'),
(3,'2025-11-01','A'),(3,'2025-11-02','P'),(3,'2025-11-03','P'),(3,'2025-11-04','L'),(3,'2025-11-05','P'),
(4,'2025-11-01','P'),(4,'2025-11-02','A'),(4,'2025-11-03','P'),(4,'2025-11-04','P'),(4,'2025-11-05','P'),
(5,'2025-11-01','P'),(5,'2025-11-02','P'),(5,'2025-11-03','A'),(5,'2025-11-04','P'),(5,'2025-11-05','P'),
(6,'2025-11-01','P'),(6,'2025-11-02','P'),(6,'2025-11-03','P'),(6,'2025-11-04','P'),(6,'2025-11-05','P');
