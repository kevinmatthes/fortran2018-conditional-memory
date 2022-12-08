<!---------------------- GNU General Public License 3.0 ------------------------
--                                                                            --
-- Copyright (C) 2022 Kevin Matthes                                           --
--                                                                            --
-- This program is free software: you can redistribute it and/or modify       --
-- it under the terms of the GNU General Public License as published by       --
-- the Free Software Foundation, either version 3 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              --
-- GNU General Public License for more details.                               --
--                                                                            --
-- You should have received a copy of the GNU General Public License          --
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.     --
--                                                                            --
------------------------------------------------------------------------------->

<!------------------------------------------------------------------------------
--
--  AUTHOR      Kevin Matthes
--  BRIEF       Important information regarding this project.
--  COPYRIGHT   GPL-3.0
--  DATE        2022
--  FILE        README.md
--  NOTE        See `LICENSE' for full license.
--
------------------------------------------------------------------------------->

# fortran2018-conditional-memory

## Summary

[![](https://bors.tech/images/badge_small.svg)](https://app.bors.tech/repositories/57832)
[![](https://github.com/kevinmatthes/fortran2018-conditional-memory/workflows/bump2version/badge.svg)](https://github.com/kevinmatthes/fortran2018-conditional-memory/workflows/bump2version)
[![](https://github.com/kevinmatthes/fortran2018-conditional-memory/workflows/cffconvert/badge.svg)](https://github.com/kevinmatthes/fortran2018-conditional-memory/workflows/cffconvert)
[![](https://github.com/kevinmatthes/fortran2018-conditional-memory/workflows/valgrind/badge.svg)](https://github.com/kevinmatthes/fortran2018-conditional-memory/workflows/valgrind)
[![](https://img.shields.io/github/license/kevinmatthes/fortran2018-conditional-memory)](https://github.com/kevinmatthes/fortran2018-conditional-memory)

A Fortran 2018 library for conditional (de-)allocation of allocatable objects of
intrinsic types.

1. [License](#license)
2. [Software Requirements](#software-requirements)
3. [Description](#description)
4. [Build](#build)

## License

[![](https://img.shields.io/github/license/kevinmatthes/fortran2018-conditional-memory)](https://github.com/kevinmatthes/fortran2018-conditional-memory)

This project's license is **GPL-3.0**.  The whole license text can be found in
`LICENSE` in the main directory of this repository.  The brief version is as
follows:

> Copyright (C) 2022 Kevin Matthes
>
> This program is free software: you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation, either version 3 of the License, or
> (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License
> along with this program.  If not, see <https://www.gnu.org/licenses/>.

## Software Requirements

| Requirement       | Type          | Role                                  |
|:------------------|:-------------:|:--------------------------------------|
| bump2version      | Python CLI    | automatic version increment           |
| Doxygen           | application   | source code documentation             |
| GFortran          | application   | Fortran 2018 compiler                 |
| Git               | application   | build artifact removal                |
| Just              | Rust binary   | execution of the build instructions   |
| Latexmk           | application   | LaTeX compilation of Doxygen manual   |
| Scriv             | Python CLI    | changelog management                  |
| TeX Live (full)   | package       | LaTeX environment for Doxygen manual  |
| Valgrind          | application   | memory leak detection                 |

This library is written in Fortran 2018 such that its build requires a compiler
supporting this standard.  This project relies on **GFortran** therefore.

The library build is organised with **Just**.  The corresponding `.justfile`
does not only take care for the compilation of the library but also for its
documentation and testing.

The documentation is generated by **Doxygen**.  The configured output formats
are listed in the following.

* HTML
* LaTeX
* UNIX manual pages

In order to finalise the LaTeX documentation, an appropriate LaTeX distribution
is required.  A *full* installation of **TeX Live** is recommended.  This
project employs **Latexmk** as LaTeX build manager for the manual finalisation.

There are unit tests for the library logic written in plain Fortran 2018 without
requiring any further libraries.  When running the tests, **Valgrind** will
analyse their memory management.

In order to simplify the maintenance, **bump2version** as well as **Scriv** are
used to automate the release generation.  Scriv will compile the changelog on
release after all version numbers were incremented by bump2version.

Build artifacts are prevented from begin committed by the `.gitignore` this
repository contains.  It furthermore controls which files are going to be
removed by `git clean`.  Thus, it is the simplest solution to employ **Git** for
the removal of build artifacts.

## Description

This repository provides the source code for a library named `libf18cndmem.a`.
The purpose of this library is the conditional allocation and deallocation of
allocatable objects of Fortran intrinsic types.  It is written in Free Form
Fortran 2018.

As the deallocation of an allocatable object which is not already allocated will
result in a runtime error, it needs to be checked whether the object to
deallocate is allocated at all.  The deallocation subroutines this library
provides will take care about both this check and the deallocation, if required.
All those subroutines are exposed with the generic interface `cnddel` which is
an abbreviation of "***C***o***nd***itional ***De***a***l***location".  At the
moment, the following types are supported:

* `character` (default)

Fortran 2018 has automatic reallocation features which allow for a convenient
and comprehensive coding style.  Under certain circumstances, it might not be
obvious if an allocatable object is already allocated such that the automatic
reallocation on intrinsic assignment could be processed.  Then, it need to be
tested whether there is already a memory region allocated for the respective
object.  If not so, an according amount of memory needs to be allocated before
the assignment can be performed.  This library provides a counterpart to the
conditional deallocation, named `cndall`, to check whether some memory was
already allocated and to assign the intended object to the target object.  The
name `cndall` is an abbreviation of "***C***o***nd***itional ***All***ocation".
At the moment, the following types are supported:

* `character` (default)

## Build

The build routine is organised by Just and defined in the `.justfile` in the
repository root.  To build the library, one of the following instructions can
be executed.

```bash
just b
just build
just l
just library
```

In addition, an automatic source code documentation with Doxygen is configured.
One of the following commands will invoke the compilation.

```bash
just d
just doxygen
```

The correctness of this library is ensured by a set of unit tests.  They are
furthermore analysed for their memory management by Valgrind.  By calling for
the Valgrind analysis, the unit tests are executed implicitly.  This can be
done with one of the following commands.

```bash
just v
just valgrind
```

If the compilation of both the library and its documentation is wished, the
following instructions can be executed.  This will also run all unit tests.

```bash
just
just a
just all
```

<!----------------------------------------------------------------------------->
