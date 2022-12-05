## T-SQL Data cleaning 
This project explores data cleaning using microsoft T-SQL. Requires a table that has the data and a data dictionary . The Data Dictionary(Appendix A and ../datadictionaries) includes a record for every field in tha main table that needs to be cleaned. This repo currently contains only 4 types of cleaning available for any piece of data and can be adopted to include other things. Included are the following. Possible Values check, Required check, Numeric Range check, and Logic check. A query will be generated and inserted into the queries table ( check structure under SQL- Queries, queries_table.sql ) for any validation that fails.
Below is an explanation for each check. 
### Possible Values check. 
This is a list of all possible values for a given field.  If the value does not appear in the list, 
### Required check.
This is a check to ensure that if a field is required, it contains data.  A query will be generated if the field is required but does not contain data.
### Numeric Range check.
If a field can have a range of numbers, this check verifies if the data is within that range. If not, it’s flagged as not clean.
### Logic check
The logic check is used to verify logic, such as if a field is a specific value, another field must also be a value.  If the data meets all its criteria, it is marked clean by the stored procedure.  If the data does not complete all its criteria, a query will be generated and remain marked as dirty until its fixed.


Appendix A:  Sample Data Dictionary

![Capture](https://user-images.githubusercontent.com/112645280/205678770-43428f19-dd6d-4873-8a0e-a51c0fcf0422.JPG)