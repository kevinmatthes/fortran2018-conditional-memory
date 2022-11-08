!!!!!!!!!!!!!!!!!!!!!!!! GNU General Public License 2.0 !!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                            !!
!! Copyright (C) 2022 Kevin Matthes                                           !!
!!                                                                            !!
!! This program is free software; you can redistribute it and/or modify       !!
!! it under the terms of the GNU General Public License as published by       !!
!! the Free Software Foundation; either version 2 of the License, or          !!
!! (at your option) any later version.                                        !!
!!                                                                            !!
!! This program is distributed in the hope that it will be useful,            !!
!! but WITHOUT ANY WARRANTY; without even the implied warranty of             !!
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              !!
!! GNU General Public License for more details.                               !!
!!                                                                            !!
!! You should have received a copy of the GNU General Public License along    !!
!! with this program; if not, write to the Free Software Foundation, Inc.,    !!
!! 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.                !!
!!                                                                            !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \file test_character.f08
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!
!> \author      Kevin Matthes
!> \copyright   GPL-2.0
!> \date        2022
!> \note        See `LICENSE' for full license.
!>              See `README.md' for project details.
!>
!> \brief   A set of simple tests for the `character` type (default).
!> \return  Whether this test succeeds.
!>
!> This unit test will check whether
!>
!> * an unallocated allocatable object can be deallocated.
!> * an unallocated allocatable object can be allocated and receive a constant.
!> * an allocated allocatable object can receive another constant by conditional
!>   reallocation.
!> * an allocated allocatable object can be deallocated.
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

program test_character
    use, non_intrinsic :: libf18cndmem, only: cndall
    use, non_intrinsic :: libf18cndmem, only: cnddel
implicit none
    character (:), allocatable  :: object
    character (*), parameter    :: constant                                    &
                                =  'constant'
    character (*), parameter    :: error_allocated                             &
                                =  'Allocatable object should not be allocated!'
    character (*), parameter    :: error_not_allocated                         &
                                =  'Allocatable object should be allocated!'
    character (*), parameter    :: error_wrong_value                           &
                                =  'Allocatable object does not have the expect&
                                   &ed value!'
    character (*), parameter    :: hello                                       &
                                =  'Hello'
    character (*), parameter    :: world                                       &
                                =  ', World!'
    intrinsic                   :: allocated

    if (allocated (object)) then
        error stop error_allocated
    else
        call cnddel (object)
    end if

    if (allocated (object)) then
        error stop error_allocated
    else
        call cndall (object, constant)
    end if

    if (.not. allocated (object)) then
        error stop error_not_allocated
    else
        if (object /= constant) then
            error stop error_wrong_value
        end if
    end if

    call cndall (object, hello)

    if (.not. allocated (object)) then
        error stop error_not_allocated
    else
        if (object // world /= hello // world) then
            error stop error_wrong_value
        end if
    end if

    if (.not. allocated (object)) then
        error stop error_not_allocated
    else
        call cnddel (object)
    end if

    if (allocated (object)) then
        error stop error_allocated
    end if
end program test_character

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
