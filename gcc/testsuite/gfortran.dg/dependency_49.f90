! { dg-do compile }
! { dg-options "-fdump-tree-original" }
! PR fortran/71902 - make sure that component references are followed
! for dependency analysis.
program main
  type foo
     character(len=:), allocatable :: x
  end type foo
  type(foo) :: a
  a%x = 'asdf'
  a%x = a%x(2:3)
  print *,a%x
end program main
! The temporary var appears three times: declaration, copy-in and copy-out
! { dg-final { scan-tree-dump-times "__var_1" 3 "original" } }
