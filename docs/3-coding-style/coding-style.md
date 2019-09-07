# Coding Style

## Formatting

### Rules

Rule | Description
:--: | -----------
1    | All code is written in lowercase.
2    | 3 space indention.
3    | One command per line.
4    | Keywords `loop`, `else`, `elseif`, `end if`, `when` on a new line.
5    | Commas in front of separated elements.
6    | Call parameters aligned, operators aligned, values aligned.
7    | SQL keywords are right aligned within a SQL command.
8    | Within a program unit only line comments `--` are used.
9    | Brackets are used when needed or when helpful to clarify a construct. 

### Example

```
procedure set_salary(in_employee_id IN employee.employee_id%type) is
   cursor c_employee(p_employee_id IN employee.employee_id%type) is 
      select last_name
            ,first_name
            ,salary
        from employee
       where employee_id = p_employee_id
    order by last_name
            ,first_name;

   r_employee     c_employee%rowtype;
   l_new_salary   employee.salary%type;
begin
   open  c_employee(p_employee_id => in_employee_id);
   fetch c_employee INTO r_employee;
   close c_employee;

   new_salary (in_employee_id => in_employee_id
              ,out_salary     => l_new_salary);

   -- Check whether salary has changed
   if r_employee.salary <> l_new_salary then
      update employee
         set salary = l_new_salary
       where employee_id = in_employee_id;
   end if;
end set_salary;
```

## Code Commenting

### Conventions

Inside a program unit only use the line commenting technique `--` unless you temporarly deactivate code sections for testing.

To comment the source code for later document generation, comments like `/** ... */` are used. Within these documentation comments, tags may be used to define the documentation structure.

Tools like ORACLE SQL Developer or PL/SQL Developer include documentation functionality based on a javadoc-like tagging. 

### Commenting Tags

Tag      | Meaning                                                 | Example
-------- | ------------------------------------------------------- | -------
`param`  | Description of a parameter.                             | `@param in_string input string`
`return` | Description of the return value of a function.          | `@return result of the calculation`
`throws` | Describe errors that may be raised by the program unit. | `@throws no_data_found`

### Example

This is an example using the documentation capabilities of SQL Developer. 

```
/**
Check whether we passed a valid sql name

@param   in_name  string to be checked
@return  in_name if the string represents a valid sql name
@throws  ORA-44003: invalid SQL name 

<b>Call Example:</b>
<pre>
   select tvdassert.valid_sql_name('TEST') from dual;
   SELECT tvdassert.valid_sql_name('123') from dual
</pre>
*/
```
