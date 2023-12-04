program Main

    implicit none 

    integer flag, i
    real, allocatable :: a(:)
    allocate(a(10),STAT=flag) 

    ! do i = 1,10
    !     print *,a(i)
    ! enddo 

    !deallocate(a)
contains

end program Main