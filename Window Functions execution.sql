show databases;
use employee;
desc work;
insert into work (name,age,department,salary)
values
('Ram',23,'Finance',40000),
('Deep',25,'Sales',30000),
('Ronit',28,'Sales',50000),
('Dinesh',25,'Finance',40000),
('Prakash',28,'Finance','34000'),
('Rani',22,'Admin',90000),
('Priya',23,'Marketing',45000),
('Shailesh',24,'Marketing',50000),
('Shraddha',29,'Advertising',34000),
('Leo',29,'Advertising',45000),
('Farida',22,'Admin',50000);

select * from work;
SELECT 
    name, department,
    age, 
    ROUND(AVG(age) OVER (PARTITION BY department), 2) AS "Average age" 
FROM 
    work;

select name, age,department,salary,
avg(salary) over(partition by department) as 'Average salary in a departmnet' from work;

select name,
sum(salary) over (order by department rows between unbounded preceding and unbounded following) as 'total salary' from work;

select name, age, salary,
rank() over (order by salary) as 'ranking age',
dense_rank() over (order by salary) as 'dense_ranking age'
 from work;
 
 select name, department,salary,
 first_value(salary) over (partition by department order by department) as 'first value'
 from work;

select salary,
lead(salary) over (order by salary) as 'subsequent salary',
lag(salary) over (order by salary) as 'lag salary' from work;