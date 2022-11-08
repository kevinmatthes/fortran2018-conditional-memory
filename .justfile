######################## GNU General Public License 2.0 ########################
##                                                                            ##
## Copyright (C) 2022 Kevin Matthes                                           ##
##                                                                            ##
## This program is free software; you can redistribute it and/or modify       ##
## it under the terms of the GNU General Public License as published by       ##
## the Free Software Foundation; either version 2 of the License, or          ##
## (at your option) any later version.                                        ##
##                                                                            ##
## This program is distributed in the hope that it will be useful,            ##
## but WITHOUT ANY WARRANTY; without even the implied warranty of             ##
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              ##
## GNU General Public License for more details.                               ##
##                                                                            ##
## You should have received a copy of the GNU General Public License along    ##
## with this program; if not, write to the Free Software Foundation, Inc.,    ##
## 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.                ##
##                                                                            ##
################################################################################

################################################################################
##
##  AUTHOR      Kevin Matthes
##  BRIEF       The recipes in order to compile the provided executable.
##  COPYRIGHT   GPL-2.0
##  DATE        2022
##  FILE        .justfile
##  NOTE        See `LICENSE' for full license.
##              See `README.md' for project details.
##
################################################################################

# Synonyms for the configured recipes.
alias a         := all
alias b         := library
alias build     := library
alias clr       := clear
alias d         := doxygen
alias l         := library
alias v         := valgrind
alias ver       := bump
alias version   := bump



# Compiler flags.
exe     := '-fPIE'
f18     := '-std=f2018'
flags   := '-Wall -Werror -Wextra -Wpedantic'
lib     := '-c -fPIC'

# Linker flags.
lflags  := '-L. -lf18cndmem'

# Settings for the supported language modes.
f18-exe := f18 + ' ' + exe + ' ' + flags
f18-lib := f18 + ' ' + lib + ' ' + flags
lnk-f18 := '-I. ' + lflags

# Targets.
library := 'libf18cndmem.a'

# Valgrind settings.
vflags  := '--leak-check=full --redzone-size=512 --show-leak-kinds=all'



# The default recipe to execute.
@default: all

# Execute all configured recipes.
@all: clear doxygen valgrind

# Increment the version numbers.
@bump part:
    bump2version {{part}}
    scriv collect

# Compile the procedures for the `character` type.
@character: interfaces
    just compile src/type_character.f08

# Remove build artifacts.
@clear:
    git clean -dfx

# Compile the given source file and add it to the library.
@compile source_file:
    gfortran {{f18-lib}} {{source_file}}
    ar rsv {{library}} *.o
    rm -rf *.o

# Create the required directories.
@directories:
    mkdir -p target/

# Create the Doxygen documentation for this project.
@doxygen:
    doxygen doxygen.cfg
    cd latex/ && latexmk -f -r ../.latexmkrc --silent refman
    cp latex/refman.pdf doxygen.pdf

# Create the library interfaces.
@interfaces:
    just compile src/lib.f08

# Compile the target library.
@library: character

# Compile and run a single unit test.
@test name: directories library
    gfortran {{f18-exe}} tests/test_{{name}}.f08 -o \
        target/test_{{name}} {{lnk-f18}}
    valgrind {{vflags}} target/test_{{name}}

# Analyse the memory management of the unit tests.
@valgrind:
    just test character

################################################################################
