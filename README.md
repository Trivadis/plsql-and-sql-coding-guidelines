# Trivadis PL/SQL &amp; SQL Coding Guidelines

## Introduction

Trivadis published their guidelines for PL/SQL &amp; SQL in 2009 in the context of the DOAG conference in Nuremberg. Since then these guidelines have been continuously extended and improved. Now they are managed as a set of markdown files. This makes the guidelines more adaptable for individual application needs and simplifies the continous improvement.

## HTML format

HTML is the primary output format. [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) is used to generate static HTML files and [Mike](https://github.com/jimporter/mike) to publish version specific variants. The following sites are available:

* [Current version based on the main branch, snapshot version of the coming release](https://trivadis.github.io/plsql-and-sql-coding-guidelines/main/)
* [Latest Release](https://trivadis.github.io/plsql-and-sql-coding-guidelines/)
* Releases
   * [Version 4.2](https://trivadis.github.io/plsql-and-sql-coding-guidelines/v4.2/)
   * [Version 4.1](https://trivadis.github.io/plsql-and-sql-coding-guidelines/v4.1/)
   * [Version 4.0](https://trivadis.github.io/plsql-and-sql-coding-guidelines/v4.0/)
   * [Version 3.6](https://trivadis.github.io/plsql-and-sql-coding-guidelines/v3.6/)
   * [Version 3.5](https://trivadis.github.io/plsql-and-sql-coding-guidelines/v3.5/)
   * [Version 3.4](https://trivadis.github.io/plsql-and-sql-coding-guidelines/v3.4/)
   * [Version 3.3](https://trivadis.github.io/plsql-and-sql-coding-guidelines/v3.3/)

## PDF format

PDF is the secondary output format. [wkhtmltopdf](https://wkhtmltopdf.org/) is used to produce it. 

Starting with version 3.5 you may access the PDF document from the [appendix in the HTML site](https://trivadis.github.io/plsql-and-sql-coding-guidelines/9-appendix/appendix/). 

The PDF version is also accessible per version from [Releases](https://github.com/Trivadis/plsql-and-sql-coding-guidelines/releases).

## Releases

You find all releases and release information [here](https://github.com/trivadis/plsql-and-sql-coding-guidelines/releases).

## SonarCloud

The SQL code blocks in the Markdown files of this repository are automatically checked with db* CODECOP. The result is stored in [SonarCloud](https://sonarcloud.io/summary/new_code?id=Trivadis-plsql-and-sql-coding-guidelines). The idea is to follow our own guidelines, at least in the good examples.

## How to Build the HTML Site

1. Install Docker in your environment
   * [Install Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)
   * [Install Docker Desktop on Windows](https://docs.docker.com/docker-for-windows/install/)
   * [Install Docker Server on Linux](https://docs.docker.com/install/#server)
2. [Fork this respository](https://github.com/trivadis/plsql-and-sql-coding-guidelines/fork)
3. For Windows users only
   * Install [Git for Windows](https://gitforwindows.org/), it provides Git command line tools, a GUI and a Bash emulator
4. Check/change the version in [mkdocs.yml](mkdocs.yml)
5. Open a terminal window in the [tools](tools) folder 
   * Build/update the table in appendix B
     run `./genappendix.sh`.
   * Build/update the PDF file
     run `./genpdf.sh`.
   * Test the HTML site locally
     run `./serve.sh` and open [http://localhost:8000](http://localhost:8000)
   * Deploy HTML site
     run `./mike.sh deploy main`.
   * Set default version (HTML redirect)
     run `./mike.sh set-default main`.
6. `commit` changes and `push` all branches.

## Related Resources
* [DOAG PL/SQL Conventions](https://github.com/Doag/PL-SQL-Conventions)

## License

The Trivadis PL/SQL & SQL Coding Guidelines are licensed under the Apache License, Version 2.0. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>.
