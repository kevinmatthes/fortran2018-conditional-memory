.. --------------------- GNU General Public License 3.0 --------------------- ..
..                                                                            ..
.. Copyright (C) 2022 Kevin Matthes                                           ..
..                                                                            ..
.. This program is free software: you can redistribute it and/or modify       ..
.. it under the terms of the GNU General Public License as published by       ..
.. the Free Software Foundation, either version 3 of the License, or          ..
.. (at your option) any later version.                                        ..
..                                                                            ..
.. This program is distributed in the hope that it will be useful,            ..
.. but WITHOUT ANY WARRANTY; without even the implied warranty of             ..
.. MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              ..
.. GNU General Public License for more details.                               ..
..                                                                            ..
.. You should have received a copy of the GNU General Public License          ..
.. along with this program.  If not, see <https://www.gnu.org/licenses/>.     ..
..                                                                            ..
.. -------------------------------------------------------------------------- ..

.. -------------------------------------------------------------------------- ..
..
..  AUTHOR      Kevin Matthes
..  BRIEF       The development history of this project.
..  COPYRIGHT   GPL-3.0
..  DATE        2022
..  FILE        CHANGELOG.rst
..  NOTE        See `LICENSE' for full license.
..              See `README.md' for project details.
..
.. -------------------------------------------------------------------------- ..

.. -------------------------------------------------------------------------- ..
..
.. _changelog.d: changelog.d/
.. _Keep a Changelog: https://keepachangelog.com/en/1.0.0/
.. _Scriv: https://github.com/nedbat/scriv
..
.. -------------------------------------------------------------------------- ..

Changelog
=========

All notable changes to this project are documented in this file.  The format is
based on `Keep a Changelog`_ and optimised for maintenance with `Scriv`_.

Unreleased
----------

All pending changelog entries are stored in `changelog.d`_.

.. scriv-insert-here

.. _changelog-0.0.1:

0.0.1 — 2022-11-14
------------------

Added
.....

- license:  GPL-3.0

- GitHub Issue Form:  bug report

- bump2version settings

- create CITATION.cff

- Dependabot:  GitHub Action setup

- GitHub Action:  CFF validation

- define library utility subroutine for conditional allocation and assignment
  of an allocatable object of type standard ``character``

- define library utility subroutine for conditional deallocation of an
  allocatable object of type standard ``character``

- define submodule for procedures associated with the standard ``character``
  intrinsic type

- Dependabot:  pip setup

- GitHub Action:  version increment check

- GitHub Action:  unit tests

- create ``.gitmodules``

- Dependabot:  Git submodule setup

- submodule:  literature

- build routine:  Just

- create this CHANGELOG

- create Scriv artifact storage

- Scriv settings

- create ``.gitignore``

- create library source file

- Doxygen:  Fortran setup

- Latexmk settings

- unit test:  conditional allocation (type ``character``, default)

- unit test:  conditional deallocation (type ``character``, default)

- unit test:  library version

- create repository README

- create this repository

- use GitHub Action for Python 3 dependency installation instead of command
  line instructions

.. -------------------------------------------------------------------------- ..
