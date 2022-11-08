<!---------------------- GNU General Public License 2.0 ------------------------
--                                                                            --
-- Copyright (C) 2022 Kevin Matthes                                           --
--                                                                            --
-- This program is free software; you can redistribute it and/or modify       --
-- it under the terms of the GNU General Public License as published by       --
-- the Free Software Foundation; either version 2 of the License, or          --
-- (at your option) any later version.                                        --
--                                                                            --
-- This program is distributed in the hope that it will be useful,            --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of             --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              --
-- GNU General Public License for more details.                               --
--                                                                            --
-- You should have received a copy of the GNU General Public License along    --
-- with this program; if not, write to the Free Software Foundation, Inc.,    --
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.                --
--                                                                            --
------------------------------------------------------------------------------->

<!------------------------------------------------------------------------------
--
--  AUTHOR      Kevin Matthes
--  BRIEF       Important information regarding this project.
--  COPYRIGHT   GPL-2.0
--  DATE        2022
--  FILE        README.md
--  NOTE        See `LICENSE' for full license.
--
------------------------------------------------------------------------------->

# fortran2018-conditional-memory

## Summary

A Fortran 2018 library for conditional (de-)allocation of allocatable objects of
intrinsic types.

1. [License](#license)
2. [Software Requirements](#software-requirements)
3. [Description](#description)
4. [Build](#build)

## License

This project's license is **GPL-2.0** (as of June 1991).  The whole license text
can be found in `LICENSE` in the main directory of this repository.  The brief
version is as follows:

> Copyright (C) 2022 Kevin Matthes
>
> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation; either version 2 of the License, or
> (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License along
> with this program; if not, write to the Free Software Foundation, Inc.,
> 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

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
provides will take care about this check.  All those subroutines are exposed
with the generic interface `cnddel` which is an abbreviation of
"**C**o**nd**itional **De**a**l**location".  At the moment, the following types
are supported:

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

If the compilation of both the library and its documentation is wished, the
following instructions can be executed.

```bash
just
just a
just all
```

<!----------------------------------------------------------------------------->
