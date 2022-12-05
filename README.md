## T-SQL Data cleaning 
This project explores data cleaning using microsoft T-SQL. Requires a table that has the data and a data dictionary . The Data Dictionary(Appendix A and ../datadictionaries) includes a record for every field in tha main table that needs to be cleaned. This repo contains only 4 types of cleaning available for any piece of data and can be adopted to include other things: Currently only the following are included. Possible Values check, Required check, Numeric Range check, and Logic check. A query will be generated and inserted into the queries table ( check structure under SQL- Queries, quaries_table.sql ) for any validation that fails.
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

1. Field Name	Description 
2. DVARNAME	Field name in the CRF table
3. DDESCRIP	Question # and description from table
4. DFORM	Name of table/CRF
DFORM2	Name of second table/CRF when doing a cross-table logic check.
DORDER	Incremental number beginning at 1 to list fields in desired order.
DVARTYPE	Variable type for data checking.
1 = Numeric
2 = String
3 = Date
DPOSVAL	List of possible values for field separated by a comma.  In the case of strings, each value should be enclosed with single quotes.
DREQUIRED	Indicates whether a field is required or not.
0 = not required
1 = required
DLOWBD	Lower bound number for numeric range check.  DLOWBD and DUPPBD must both be filled to do a range check.  i.e. one cannot be blank.
DUPPBD	Upper bound number for numeric range check.  DLOWBD and DUPPBD must both be filled to do a range check.  i.e. one cannot be blank.
DOTHCHK1	Logic check #1
DCHK1MSG	Message for logic check #1
DOTHCHK2	Logic check #2
DCHK2MSG	Message for logic check #2
DOTHCHK3	Logic check #3
DCHK3MSG	Message for logic check #3
DOTHCHK4	Logic check #4
DCHK4MSG	Message for logic check #4
