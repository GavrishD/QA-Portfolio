# Hillel Auto IT — QA Testing Project

## Project Overview

Hillel Auto IT is a web application for managing cars and fuel expenses.

This project was completed as part of my QA training and demonstrates practical experience in manual web application testing, test documentation, API testing, and database testing.

## Testing Activities

During the project, I performed:

- Functional testing
- Regression testing
- UI testing
- Validation testing
- Bug reporting
- Test execution
- API testing
- Database testing

## Tools

- Jira
- TestCaseLab
- Postman
- MySQL
- MySQL Workbench
- Chrome DevTools

## Project Structure

### Test Documentation

Contains testing documentation created and used during the project:

- [Test Plan](Test-Documentation/Hillel_Auto_IT_Test_Plan.pdf)
- [Regression Test Run](Test-Documentation/Hillel_Auto_IT_Regression_Test_Run.pdf)

### Bug Reports

Documented defects found during application testing with steps to reproduce, expected and actual results, severity, priority, and supporting evidence.

- [Bug Reports](Hillel_Auto_IT_Bug_Reports.pdf)

### API Testing

API testing was performed using Postman.

The project includes:

- Postman collection
- API testing results
- Positive and negative API checks
- Validation of response status codes and returned data

During API testing, a potential inconsistency was identified in the Update Expense method, where the `totalCost` value returned in the response differed from the value sent in the request.

- [API Testing Results](API-Testing/Hillel_Auto_IT_API_Testing_Results.pdf)
- [Postman Collection](API-Testing/Hillel_Auto_IT_API_Testing.postman_collection.json)

### Database Testing

Database queries were created and executed using MySQL and MySQL Workbench.

The SQL work includes:

- Data filtering and sorting
- Aggregate functions
- JOIN operations
- GROUP BY and HAVING
- Subqueries
- Working with related application data

A separate README inside the `Database-Testing` folder provides additional details about the SQL queries.

- [SQL Queries](Database-Testing/Hillel_Auto_IT_Database_Testing.sql)
- [Database Testing Overview](Database-Testing/README.md)

## Skills Demonstrated

This project demonstrates practical experience with:

- Creating and executing test documentation
- Identifying and documenting software defects
- Testing REST API endpoints
- Working with Postman collections
- Querying relational databases with SQL
- Analyzing application data using JOINs, aggregations, and subqueries
