# Appendix 

## A - Mapping new guidelines to prior versions

Old Id  | New Id | Text | Severity | Change-ability | Efficiency | Maintain-ability | Portability | Reliability | Reusability | Security | Testability
:-----: | :-----:| ---- | :------: | :------------: | :--------: | :--------------: | :---------: | :---------: | :---------: | :------: | :---------:
1 | 1010 | Try to label your sub blocks. | Minor |  |  | &#10008; |  |  |  |  | 
2 | 1020 | Always have a matching loop or block label. | Minor |  |  | &#10008; |  |  |  |  | 
3 | 1030 | Avoid defining variables that are not used. | Minor |  | &#10008; | &#10008; |  |  |  |  | 
4 | 1040 | Avoid dead code. | Minor |  |  | &#10008; |  |  |  |  | 
5 | 1050 | Avoid using literals in your code. | Minor | &#10008; |  |  |  |  |  |  | 
6 | 1060 | Avoid storing ROWIDs or UROWIDs in database tables. | Major |  |  |  |  | &#10008; |  |  | 
7 | 1070 | Avoid nesting comment blocks. | Minor |  |  | &#10008; |  |  |  |  | 
8 | 2110 | Try to use anchored declarations for variables, constants and types. | Major |  |  | &#10008; |  | &#10008; |  |  | 
9 | 2120 | Try to have a single location to define your types. | Minor | &#10008; |  |  |  |  |  |  | 
10 | 2130 | Try to use subtypes for constructs used often in your code. | Minor | &#10008; |  |  |  |  |  |  | 
11 | 2140 | Never initialize variables with NULL. | Minor |  |  | &#10008; |  |  |  |  | 
12 | 2150 | Avoid comparisons with NULL value, consider using IS [NOT] NULL.  | Blocker |  |  |  | &#10008; | &#10008; |  |  | 
13 | 2160 | Avoid initializing variables using functions in the declaration section. | Critical |  |  |  |  | &#10008; |  |  | 
14 | 2170 | Never overload variables. | Major |  |  |  |  | &#10008; |  |  | 
15 | 2180 | Never use quoted identifiers.  | Major |  |  | &#10008; |  |  |  |  | 
16 | 2185 | Avoid using overly short names for explicitly or implicitly declared identifiers.  | Minor |  |  | &#10008; |  |  |  |  | 
17 | 2190 | Avoid the use of ROWID or UROWID. | Major |  |  |  | &#10008; | &#10008; |  |  | 
18 | 2210 | Avoid declaring NUMBER variables or subtypes with no precision.  | Minor |  | &#10008; |  |  |  |  |  | 
19 | 2220 | Try to use PLS_INTEGER instead of NUMBER for arithmetic operations with integer values.  | Minor |  | &#10008; |  |  |  |  |  | 
n/a | 2230 | Try to use SIMPLE_INTEGER datatype when appropriate.  | Minor |  | &#10008; |  |  |  |  |  | 
20 | 2310 | Avoid using CHAR data type. | Major |  |  |  |  | &#10008; |  |  | 
21 | 2320 | Avoid using VARCHAR data type. | Major |  |  |  | &#10008; |  |  |  | 
22 | 2330 | Never use zero-length strings to substitute NULL. | Major |  |  |  | &#10008; |  |  |  | 
23 | 2340 | Always define your VARCHAR2 variables using CHAR SEMANTIC (if not defined anchored). | Minor |  |  |  |  | &#10008; |  |  | 
24 | 2410 | Try to use boolean data type for values with dual meaning. | Minor |  |  | &#10008; |  |  |  |  | 
25 | 2510 | Avoid using the LONG and LONG RAW data types. | Major |  |  |  | &#10008; |  |  |  | 
26 | 3110 | Always specify the target columns when coding an insert statement. | Major |  |  | &#10008; |  | &#10008; |  |  | 
27 | 3120 | Always use table aliases when your SQL statement involves more than one source. | Major |  |  | &#10008; |  |  |  |  | 
28 | 3130 | Try to use ANSI SQL-92 join syntax. | Minor |  |  | &#10008; | &#10008; |  |  |  | 
29 | 3140 | Try to use anchored records as targets for your cursors. | Major |  |  | &#10008; |  | &#10008; |  |  | 
n/a | 3150 | Try to use identity columns for surrogate keys. | Minor |  |  | &#10008; |  | &#10008; |  |  | 
n/a | 3160 | Avoid virtual columns to be visible. | Major |  |  | &#10008; |  | &#10008; |  |  | 
n/a | 3170 | Always use DEFAULT ON NULL declarations to assign default values to table columns if you refuse to store NULL values. | Major |  |  |  |  | &#10008; |  |  | 
n/a | 3180 | Always specify column names instead of positional references in ORDER BY clauses. | Major | &#10008; |  |  |  | &#10008; |  |  | 
n/a | 3190 | Avoid using NATURAL JOIN. | Major | &#10008; |  |  |  | &#10008; |  |  | 
30 | 3210 | Always use BULK OPERATIONS (BULK COLLECT, FORALL) whenever you have to execute a DML statement more than 4 times. | Major |  | &#10008; |  |  |  |  |  | 
31 | 4110 | Always use %NOTFOUND instead of NOT %FOUND to check whether a cursor returned data. | Minor |  |  | &#10008; |  |  |  |  | 
32 | 4120 | Avoid using %NOTFOUND directly after the FETCH when working with BULK OPERATIONS and LIMIT clause.  | Critical |  |  |  |  | &#10008; |  |  | 
33 | 4130 | Always close locally opened cursors. | Major |  | &#10008; |  |  | &#10008; |  |  | 
34 | 4140 | Avoid executing any statements between a SQL operation and the usage of an implicit cursor attribute. | Major |  |  |  |  | &#10008; |  |  | 
35 | 4210 | Try to use CASE rather than an IF statement with multiple ELSIF paths. | Major |  |  | &#10008; |  |  |  |  | &#10008;
36 | 4220 | Try to use CASE rather than DECODE. | Minor |  |  | &#10008; | &#10008; |  |  |  | 
37 | 4230 | Always use COALESCE instead of NVL, if parameter 2 of the NVL function is a function call or a SELECT statement. | Critical |  | &#10008; |  |  | &#10008; |  |  | 
38 | 4240 | Always use CASE instead of NVL2 if parameter 2 or 3 of NVL2 is either a function call or a SELECT statement. | Critical |  | &#10008; |  |  | &#10008; |  |  | 
39 | 4310 | Never use GOTO statements in your code. | Major |  |  | &#10008; |  |  |  |  | &#10008;
40 | 4320 | Always label your loops. | Minor |  |  | &#10008; |  |  |  |  | 
41 | 4330 | Always use a CURSOR FOR loop to process the complete cursor results unless you are using bulk operations. | Minor |  |  | &#10008; |  |  |  |  | 
42 | 4340 | Always use a NUMERIC FOR loop to process a dense array. | Minor |  |  | &#10008; |  |  |  |  | 
43 | 4350 | Always use 1 as lower and COUNT() as upper bound when looping through a dense array.  | Major |  |  |  |  | &#10008; |  |  | 
44 | 4360 | Always use a WHILE loop to process a loose array. | Minor |  | &#10008; |  |  |  |  |  | 
45 | 4370 | Avoid using EXIT to stop loop processing unless you are in a basic loop. | Major |  |  | &#10008; |  |  |  |  | 
46 | 4375 | Always use EXIT WHEN instead of an IF statement to exit from a loop. | Minor |  |  | &#10008; |  |  |  |  | 
47 | 4380 | Try to label your EXIT WHEN statements. | Minor |  |  | &#10008; |  |  |  |  | 
48 | 4385 | Never use a cursor for loop to check whether a cursor returns data. | Major |  | &#10008; |  |  |  |  |  | 
49 | 4390 | Avoid use of unreferenced FOR loop indexes. | Major |  | &#10008; |  |  |  |  |  | 
50 | 4395 | Avoid hard-coded upper or lower bound values with FOR loops.  | Minor | &#10008; |  | &#10008; |  |  |  |  | 
n/a | 5010 | Try to use a error/logging framework for your application. | Critical |  |  |  |  | &#10008; | &#10008; |  | &#10008;
51 | 5020 | Never handle unnamed exceptions using the error number. | Critical |  |  | &#10008; |  |  |  |  | 
52 | 5030 | Never assign predefined exception names to user defined exceptions. | Blocker |  |  |  |  | &#10008; |  |  | &#10008;
53 | 5040 | Avoid use of WHEN OTHERS clause in an exception section without any other specific handlers. | Major |  |  |  |  | &#10008; |  |  | 
54 | n/a | Avoid use of EXCEPTION_INIT pragma for a  20nnn error. | Major |  |  |  |  | &#10008; |  |  | 
55 | 5050 | Avoid use of the RAISE_APPLICATION_ERROR built-in procedure with a hard-coded  20nnn error number or hard-coded message.  | Major | &#10008; |  | &#10008; |  |  |  |  | 
56 | 5060 | Avoid unhandled exceptions | Major |  |  |  |  | &#10008; |  |  | 
57 | 5070 | Avoid using Oracle predefined exceptions | Critical |  |  |  |  | &#10008; |  |  | 
58 | 6010 | Always use a character variable to execute dynamic SQL. | Major |  |  | &#10008; |  |  |  |  | &#10008;
59 | 6020 | Try to use output bind arguments in the RETURNING INTO clause of dynamic DML statements rather than the USING clause.  | Minor |  |  | &#10008; |  |  |  |  | 
60 | 7110 | Try to use named notation when calling program units. | Major | &#10008; |  | &#10008; |  |  |  |  | 
61 | 7120 | Always add the name of the program unit to its end keyword. | Minor |  |  | &#10008; |  |  |  |  | 
62 | 7130 | Always use parameters or pull in definitions rather than referencing external variables in a local program unit. | Major |  |  | &#10008; |  | &#10008; |  |  | &#10008;
63 | 7140 | Always ensure that locally defined procedures or functions are referenced. | Major |  |  | &#10008; |  | &#10008; |  |  | 
64 | 7150 | Try to remove unused parameters. | Minor |  | &#10008; | &#10008; |  |  |  |  | 
65 | 7210 | Try to keep your packages small. Include only few procedures and functions that are used in the same context. | Minor |  | &#10008; | &#10008; |  |  |  |  | 
66 | 7220 | Always use forward declaration for private functions and procedures. | Minor | &#10008; |  |  |  |  |  |  | 
67 | 7230 | Avoid declaring global variables public. | Major |  |  |  |  | &#10008; |  |  | 
68 | 7240 | Avoid using an IN OUT parameter as IN or OUT only. | Major |  | &#10008; | &#10008; |  |  |  |  | 
69 | 7310 | Avoid standalone procedures – put your procedures in packages. | Minor |  |  | &#10008; |  |  |  |  | 
70 | 7320 | Avoid using RETURN statements in a PROCEDURE. | Major |  |  | &#10008; |  |  |  |  | &#10008;
71 | 7410 | Avoid standalone functions – put your functions in packages. | Minor |  |  | &#10008; |  |  |  |  | 
73 | 7420 | Always make the RETURN statement the last statement of your function. | Major |  |  | &#10008; |  |  |  |  | 
72 | 7430 | Try to use no more than one RETURN statement within a function.  | Major |  |  | &#10008; |  |  |  |  | &#10008;
74 | 7440 | Never use OUT parameters to return values from a function. | Major |  |  |  |  |  | &#10008; |  | 
75 | 7450 | Never return a NULL value from a BOOLEAN function. | Major |  |  |  |  | &#10008; |  |  | &#10008;
n/a | 7460 | Try to define your packaged/standalone function to be deterministic if appropriate. | Major |  | &#10008; |  |  |  |  |  | 
76 | 7510 | Always prefix ORACLE supplied packages with owner schema name. | Major |  |  |  |  |  |  | &#10008; | 
77 | 7710 | Avoid cascading triggers. | Major |  |  | &#10008; |  |  |  |  | &#10008;
n/a | 7810 | Do not use SQL inside PL/SQL to read sequence numbers (or SYSDATE) | Major |  | &#10008; | &#10008; |  |  |  |  | 
78 | 8110 | Never use SELECT COUNT(*) if you are only interested in the existence of a row. | Major |  | &#10008; |  |  |  |  |  | 
n/a | 8120 | Never check existence of a row to decide whether to create it or not. | Major |  | &#10008; |  |  | &#10008; |  |  | 
79 | 8210 | Always use synonyms when accessing objects of another application schema. | Major | &#10008; |  | &#10008; |  |  |  |  | 
n/a | 8310 | Always validate input parameter size by assigning the parameter to a size limited variable in the declaration section of program unit. | Minor |  |  | &#10008; |  | &#10008; | &#10008; |  | &#10008;
n/a | 8410 | Always use application locks to ensure a program unit only running once at a given time. | Minor |  | &#10008; |  |  | &#10008; |  |  | 
n/a | 8510 | Always use dbms_application_info to track program process transiently | Minor |  | &#10008; |  |  | &#10008; |  |  | 
