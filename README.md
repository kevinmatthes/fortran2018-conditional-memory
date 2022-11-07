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

<!----------------------------------------------------------------------------->
