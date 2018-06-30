# Naming Conventions

## General Guidelines

1. Never use names with a leading numeric character.
2. Always choose meaningful and specific names.
3. Avoid using abbreviations unless the full name is excessively long.
4. Avoid long abbreviations. Abbreviations should be shorter than 5 characters.
5. Any abbreviations must be widely known and accepted. 
6. Create a glossary with all accepted abbreviations.
7. Never use ORACLE keywords as names. A list of ORACLEs keywords may be found in the dictionary view `V$RESERVED_WORDS`.
8. Avoid adding redundant or meaningless prefixes and suffixes to identifiers.<br/>Example: `CREATE TABLE emp_table`.
9. Always use one spoken language (e.g. English, German, French) for all objects in your application.
10. Always use the same names for elements with the same meaning.

## Naming Conventions for PL/SQL

In general, ORACLE is not case sensitive with names. A variable named personname is equal to one named PersonName, as well as to one named PERSONNAME. Some products (e.g. TMDA by Trivadis, APEX, OWB) put each name within double quotes (`“`) so ORACLE will treat these names to be case sensitive. Using case sensitive variable names force developers to use double quotes for each reference to the variable. Our recommendation is to write all names in lowercase and to avoid double quoted identifiers.

A widely used convention is to follow a `{prefix}variablecontent{suffix}` pattern.

The following table shows a possible set of naming conventions. 

Identifier                   | Prefix | Suffix  | Example
---------------------------- | ------ | ------- | --------
Global Variable              | `g_`   |         | `g_version`
Local Variable               | `l_`   |         | `l_version`
Cursor                       | `c_`   |         | `c_employees`
Record                       | `r_`   |         | `r_employee`
Array / Table                | `t_`   |         | `t_employees`
Object                       | `o_`   |         | `o_employee`
Cursor Parameter             | `p_`   |         | `p_empno`
In Parameter                 | `in_`  |         | `in_empno`
Out Parameter                | `out_` |         | `out_ename`
In/Out Parameter             | `io_`  |         | `io_employee`
Record Type Definitions      | `r_`   | `_type` | `r_employee_type`
Array/Table Type Definitions | `t_`   | `_type` | `t_employees_type`
Exception                    | `e_`   |         | `e_employee_exists`
Constants                    | `co_`  |         | `co_empno`
Subtypes                     |        | `_type` | `big_string_type`

## Database Object Naming Conventions

Never enclose object names (table names, column names, etc.) in double quotes to enforce mixed case or lower case object names in the data dictionary.

### Collection Type

A collection type should include the name of the collected objects in their name. Furthermore, they should have the suffix `_ct` to identify it as a collection.

Optionally prefixed by a project abbreviation.

Examples:

* `employees_ct`
* `orders_ct`

### Column

Singular name of what is stored in the column (unless the column data type is a collection, in this case you use plural names)

Add a comment to the database dictionary for every column.

### DML / Instead of Trigger

Choose a naming convention that includes:

either

* the name of the object the trigger is added to,
* any of the triggering events:
    * `_br_iud` for Before Row on Insert, Update and Delete
    * `_io_id` for Instead of Insert and Delete

or

* the name of the object the trigger is added to,
* the activity done by the trigger,
* the suffix `_trg`

Examples:

* `employees_br_iud`
* `orders_audit_trg`
* `orders_journal_trg`

### Foreign Key Constraint

Table abbreviation followed by referenced table abbreviation followed by a `_fk` and an optional number suffix.

Examples:

* `empl_dept_fk`
* `sct_icmd_ic_fk1`

### Function

Name is built from a verb followed by a noun in general. Nevertheless, it is not sensible to call a function `get_...` as a function always gets something.

The name of the function should answer the question “What is the outcome of the function?”

Optionally prefixed by a project abbreviation.

Example: `employee_by_id`

If more than one function provides the same outcome, you have to be more specific with the name.

### Index

Indexes serving a constraint (primary, unique or foreign key) are named accordingly. 

Other indexes should have the name of the table and columns (or their purpose) in their name and should also have `_idx` as a suffix.

### Object Type

The name of an object type is built by its content (singular) followed by a `_ot` suffix.

Optionally prefixed by a project abbreviation.

Example: `employee_ot`

### Package

Name is built from the content that is contained within the package.

Optionally prefixed by a project abbreviation.

Examples:

* `employees_api` - API for the employee table
* `logging_up` - Utilities including logging support

### Primary Key Constraint

Table name or table abbreviation followed by the suffix `_pk`.

Examples:

* `employees_pk`
* `departments_pk`
* `sct_contracts_pk`

### Procedure

Name is built from a verb followed by a noun. The name of the procedure should answer the question “What is done?” 

Procedures and functions are often named with underscores between words because some editors write all letters in uppercase in the object tree, so it is difficult to read them.

Optionally prefixed by a project abbreviation.

Examples:

* `calculate_salary`
* `set_hiredate`
* `check_order_state`

### Sequence

Name is built from the table name (or its abbreviation) the sequence serves as primary key generator and the suffix `_seq` or the purpose of the sequence followed by a `_seq`.

Optionally prefixed by a project abbreviation.

Examples:

* `employees_seq`
* `order_number_seq`

### Synonym

Synonyms should be used to address an object in a foreign schema rather than to rename an object. Therefore, synonyms should share the name with the referenced object.

### System Trigger

Name of the event the trigger is based on.

* Activity done by the trigger
* Suffix `_trg`

Examples:

* `ddl_audit_trg`
* `logon_trg`

### Table

Plural name of what is contained in the table (unless the table is designed to always hold one row only – then you should use a singular name)

Add a comment to the database dictionary for every table and every column in the table.

Optionally prefixed by a project abbreviation.

Examples:

* `employees`
* `departments`
* `sct_contracts`
* `sct_contract_lines`
* `sct_incentive_modules`

### Temporary Table (Global Temporary Table)

Naming as described for tables.

Optionally suffixed by `_tmp`

Optionally prefixed by a project abbreviation.

Examples:

* `employees_tmp`
* `contracts_tmp`

### Unique Key Constraint

Table name or table abbreviation followed by the role of the unique key constraint, a `_uk` and an optional number suffix.

Examples:

* `employees_name_uk`
* `departments_deptno_uk`
* `sct_contracts_uk`
* `sct_coli_uk`
* `sct_icmd_uk1`

### View

Plural name of what is contained in the view.
Optionally suffixed by an indicator identifying the object as a view (mostly used, when a 1:1 view layer lies above the table layer)

Add a comment to the database dictionary for every view and every column.

Optionally prefixed by a project abbreviation.

Examples:

* `active_orders`
* `orders_v` - a view to the orders table
