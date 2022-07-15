# Coding Style

## Formatting

### Rules

Rule | Description
:--: | -----------
1    | Keywords and names are written in lowercase[^2].
2    | 3 space indention[^3].
3    | One command per line.
4    | Keywords `loop`, `else`, `elsif`, `end if`, `when` on a new line.
5    | Commas in front of separated elements.
6    | Call parameters aligned, operators aligned, values aligned.
7    | SQL keywords are right aligned within a SQL command.
8    | Within a program unit only line comments `--` are used.
9    | Brackets are used when needed or when helpful to clarify a construct. 

### Example

``` sql
procedure set_salary(in_employee_id in employees.employee_id%type) is
   cursor c_employees(p_employee_id in employees.employee_id%type) is
      select last_name
            ,first_name
            ,salary
        from employees
       where employee_id = p_employee_id
       order by last_name
            ,first_name;

   r_employee   c_employees%rowtype;
   l_new_salary employees.salary%type;
begin
   open c_employees(p_employee_id => in_employee_id);
   fetch c_employees into r_employee;
   close c_employees;

   new_salary(in_employee_id => in_employee_id
             ,out_salary     => l_new_salary);

   -- Check whether salary has changed
   if r_employee.salary <> l_new_salary then
      update employees
         set salary = l_new_salary
       where employee_id = in_employee_id;
   end if;
end set_salary;
```

## Code Commenting

### Conventions

Inside a program unit only use the line commenting technique `--` unless you temporarly deactivate code sections for testing.

To comment the source code for later document generation, comments like `/** ... */` are used. Within these documentation comments, tags may be used to define the documentation structure.

Tools like Oracle SQL Developer or PL/SQL Developer include documentation functionality based on a javadoc-like tagging. 

### Commenting Tags

Tag      | Meaning                                                 | Example
-------- | ------------------------------------------------------- | -------
`param`  | Description of a parameter.                             | `@param in_string input string`
`return` | Description of the return value of a function.          | `@return result of the calculation`
`throws` | Describe errors that may be raised by the program unit. | `@throws NO_DATA_FOUND`

### Example

This is an example using the documentation capabilities of SQL Developer. 

``` sql
/**
Check whether we passed a valid sql name

@param   in_name  string to be checked
@return  in_name if the string represents a valid sql name
@throws  ORA-44003: invalid SQL name 

<b>Call Example:</b>
<pre>
   select TVDAssert.valid_sql_name('TEST') from dual;
   select TVDAssert.valid_sql_name('123') from dual
</pre>
*/
```

[^2]: 
    It used to be good practice to use uppercase keywords and lowercase names to help visualize code structure. 
    But practically all editors support more or less advanced color highlighting of code, similar to the examples in these guidelines. 
    Hence as of version 4.0 we are now recommending all lowercase, as this is easier and faster for the brain to process. 
    You may choose to prefer the old rule - however, it is important to always be consistent, like for example keywords always in uppercase and names always in lowercase.

[^3]: 
    Tabs are not used because the indentation depends on the editor configuration. 
    We want to ensure that the code looks the same, independent of the editor used. 
    Hence, no tabs. But why not use 8 spaces? That's the traditional value for a tab. 
    When writing a package function the code in the body has an indentation of 3. 
    That's 24 characters as a starting point for the code. We think it's too much. 
    Especially if we try to keep a line below 100 or 80 characters. Other good options 
    would be 2 or 4 spaces. We settled for 3 spaces as a compromise. 
    The indentation is still good visible, but does not use too much space.
