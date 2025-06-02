select Education_Level,avg(Income) as AVERAGE from employee where Employment_Status='Full-time' group by Education_Level;
select * from employee order by Income desc limit 5;
select Occupation,count(*) as Count from employee where Number_of_Dependents >2 and Homeownership_Status='own' group by Occupation;
select * from employee where Location='Urban' and Income > (select avg(Income) from employee);
select Employment_Status,Gender,count(Gender) as Count from employee group by  Employment_Status,Gender;
select Location,Occupation,sum(Income) as Total,avg(Income) 
as Average from employee group by Location,Occupation order by Location;
select Type_of_Housing ,avg(Household_size) as Average_Householdsize from employee group by Type_of_Housing;
select Marital_Status,min(Work_Experience)as Minimum_experience,max(Work_Experience)as Maximum_Experience,avg(Work_Experience) as Average_Experience from employee group by Marital_Status;
select Education_Level,Income,rank() over (partition by Education_Level order by Income desc) as Ranks from employee;
select Occupation,AVG(Income) AS Avg_Income from employee group by Occupation order by Avg_Income desc limit 3;
select Income,Gender,sum(Income) over (partition by Gender order by Income) as Cumulative_Income from employee;
WITH income_ranked AS (
 SELECT Income,ROW_NUMBER() OVER (ORDER BY Income) AS rn,COUNT(*) OVER () AS total_count FROM employee),
		median_income AS (SELECT AVG(Income) AS median FROM income_ranked WHERE rn IN (FLOOR((total_count + 1) / 2),FLOOR((total_count + 2) / 2)))
SELECT * FROM employee WHERE Income > (SELECT median FROM median_income);


