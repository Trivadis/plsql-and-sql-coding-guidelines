# db* CODECOP Validators

db\* CODECOP supports custom validators. A validator must implement the `PLSQLCopValidator` Java interface and has to be a direct or indirect descendant of the `PLSQLValidator` class. Such a class can be used in the command line utility and the SQL Developer extension. 

For SonarQube a `ValidationConfig` is required. A config defines the validator with its rules and quality profile for SonarQube. See [GLPValidatorConfig](https://github.com/Trivadis/plsql-cop-validators/tree/main/src/main/java/com/trivadis/sonar/plugin/GLPValidatorConfig.java). The referenced XML files are generated based on the validator and the optional [sample guidelines](https://github.com/Trivadis/plsql-cop-validators/tree/main/src/main/resources/GLP/sample).

You may use these validators as is or amend/extend them to suit your needs.

## Provided Validators

The [db\* CODECOP Validators](https://github.com/Trivadis/plsql-cop-validators) project provides the following custom validators in the package `com.trivadis.tvdcc.validators`:

Class | Description 
----- | -----------
TrivadisPlsqlNaming | Checks [Naming Conventions](https://trivadis.github.io/plsql-and-sql-coding-guidelines/2-naming-conventions/naming-conventions/#naming-conventions-for-plsql) of the Trivadis PL/SQL & SQL Coding Guidelines
GLP | Checks naming of global and local variables and parameters 
SQLInjection | Looks for SQL injection vulnerabilities, e.g. unasserted parameters in dynamic SQL
Hint | Looks for unknown hints and invalid table references
OverrideTrivadisGuidelines | Extends TrivadisGuidelines3 and overrides check for [G-1050](../../4-language-usage/1-general/g-1050/).
TrivadisGuidelines3Plus | Combines the validators TrivadisPlsqlNaming, SQLInjection and OverrideTrivadisGuidelines. 
