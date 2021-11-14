DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);
use employees;
INSERT INTO department
    (name)
VALUES
    ('Operations'),
    ('Sales'),
    ('Quality Assurance'),
    ('Executive');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('Regional Manager', 62000, 1),
    ('Salesman', 70000, 2),
    ('Customer Service', 37000, 3),
    ('Accountant', 40000, 1),
    ('Receptionist', 30000, 3),
    ('CEO', 325000, 4),
    ('Owner', 1500000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Michael', 'Scott', 4, 1),
    ('Jim', 'Halpert', 2, 1),
    ('Kevin', 'Malone', 4, 1),
    ('Pam', 'Beasley', 5, 1),
    ('Dwight', 'Schrute', 2, 1),
    ('David', 'Wallace', 6, 1),
    ('Robert', 'Dunder', 7, 1),
    ('Kelly', 'Kapoor', 3, 1);