program Main

implicit none

real a(100)

a = 0.0



call out_of_bounds(a)

contains

subroutine out_of_bounds(array)
    real, intent(in) :: array(:)
    integer i

    do i = 1,size(array)+2
        print *, array(i)
    enddo
end subroutine
    
end program Main