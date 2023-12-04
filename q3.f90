program Tensor

    implicit none 

    integer, parameter :: sp = selected_real_kind(6, 37)

    integer N, err, i
    character(len=32) Nin, method
    real(sp), allocatable :: T(:,:,:)

    if (command_argument_count() /= 2) then
        print *, 'Wrong number of required arguments :('
        call exit(0)
    endif

    call get_command_argument(1, Nin)
    read(Nin,*) N

    allocate(T(N,N,N), STAT=err)
    if (err /= 0) then
        print *, 'Something went wrong while allocating the tensor :('
        call exit(0)
    else 
        print *, 'Tensor allocated successfully :)'
    endif

    T = reshape((/ (i, i = N**3,1,-1)/), (/N, N, N/))

    print *, T(1,1,1)
    print *, T(1,N,N)

    print *, builtinsum(T)
    print *, blocksum(T)

    deallocate(T)

contains

    function builtinsum(T) result(res)
        real(sp), intent(in) :: T(:,:,:)
        real(sp) :: res
        res = sum(T)
    end function

    function blocksum(T) result(res)
        real(sp), intent(in) :: T(:,:,:)
        real(sp) :: res
        res = sum(sum(sum(T,1),1),1)
    end function

end program Tensor