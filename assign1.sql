-- create a table user and employee
CREATE TABLE user (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT NOT NULL
);

CREATE TABLE employee (
  userid INTEGER NOT NULL,
  employee_number INTEGER NOT NULL,
  employee_phone TEXT NOT NULL,
  employee_salary INTEGER NOT NULL,
  FOREIGN KEY (userid) REFERENCES user(id)
);

-- Insert fake data to these tables. do the same for  50 times
INSERT INTO user VALUES (1, 'name1', 'email1', '+91-123');
INSERT INTO employee VALUES (1, 1, '+91-123', 100);
INSERT INTO user VALUES (2, 'cop1', 'email2', '+91-1234');
INSERT INTO employee VALUES (2, 2, '+91-1234', 200);

-- Get 10 latest rows 
SELECT * FROM user limit 10;

-- Get rows where the name has "cop" in them
SELECT * FROM user where name like '%cop%';

--Get phone  of user which employee_number has value 1
SELECT u.phone FROM user u inner join employee e 
where u.id = e.userid and e.employee_number=1;


--Update employee_number value 1 email column
update user set email = 'newemail'
where id = (select userid from employee where employee_number=1);

--Get employees which have the highest employee_salary.
select * from employee where employee_salary = (select Max(employee_salary) from employee);


--Delete one row query
DELETE FROM employee where userid = 1;
DELETE FROM user where id = 1;

