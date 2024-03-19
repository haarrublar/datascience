-- get the counted age data greater than two after the aggregation function 
SELECT COUNT(age) FROM hello_sql.users HAVING COUNT(age) > 2;


/*
Difference between WHERE and HAVING.
WHERE: before the aggregation function 
HAVING: after the aggregation function
*/

-- This line cannot be executed because the "count(EmployeeID)" variable/column is not created in the table Orders. The WHERE statement occurs before the aggregation function (COUNT) occurs.
SELECT EmployeeID, COUNT(EmployeeID) AS Number FROM Orders 
WHERE COUNT(EmployeeID) >= 5
GROUP BY EmployeeID;

-- This line is executed. It grouped the data where the number of EmployeeID registered is greater than 7 per each EmployeeID
SELECT EmployeeID, COUNT(EmployeeID) AS Count FROM Orders 
GROUP BY EmployeeID
HAVING COUNT(EmployeeID) >= 7;