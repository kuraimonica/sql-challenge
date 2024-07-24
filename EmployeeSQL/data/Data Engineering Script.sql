-- Design the Table Schema by examining the csv files to determine their column and relationships.

-- Create Employees Table
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_title_id CHAR(5),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Create Departments Table
DROP TABLE Departments;
	
CREATE TABLE Departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL UNIQUE
);

-- Create Department Employees Table
CREATE TABLE Dept_emp (
    emp_no INT,
    dept_no CHAR(4),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- Create Department Managers Table
CREATE TABLE Dept_managers (
    dept_no CHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Create Salaries Table
CREATE TABLE Salaries (
    emp_no INT,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- Create Titles Table
CREATE TABLE Titles (
    title_id CHAR(5) NOT NULL,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY (title_id)
   
);
-- Checking if tables important successfully
-- Show data from Departments Table
SELECT * FROM Departments LIMIT 10;

-- Show data from Employees Table
SELECT * FROM Employees LIMIT 10;

-- Show data from Dept_employee Table
SELECT * FROM Dept_emp LIMIT 10;

-- Show data from Dept Managers Table
SELECT * FROM Dept_managers LIMIT 10;

-- Show data from Salaries Table
SELECT * FROM salaries LIMIT 10;

-- Show data from Titles Table
SELECT * FROM salaries LIMIT 10;

ALTER TABLE Employees
ADD CONSTRAINT fk_emp_title_id
FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id);