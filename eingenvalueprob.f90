subroutine eigenvalueprob(NDIM,A,W,WORK,workmax,A_OLD)
implicit none

!Global variables

INTEGER, INTENT(IN)      :: NDIM, workmax
REAL(kind=4), intent(out) :: WORK(workmax), W(NDIM)
REAL(kind=4), intent(inout) ::A(NDIM,NDIM),A_OLD(NDIM,NDIM)


!Local Variables
integer      :: LDA,LWORK, INFO, J, I
real(kind=4)     ::  eps
real(kind=4)     ::  slamch
CHARACTER    :: JOBZ,UPLO
REAL             ZERO
PARAMETER        ( ZERO = 0.0 )
real(kind=4)     :: cpu_sekunden, st0, ste

    external slamch
    external ssyev

    eps = slamch('e')
    print*,' relative machine precision epsilon          ',&
            ' eps      = ',eps

    JOBZ = 'V'
    UPLO = 'U'

    LDA = NDIM

    LWORK = workmax


    call cpu_time(st0)
!--------------------------------!

    CALL ssyev(JOBZ,UPLO,NDIM,A,LDA,W,WORK, LWORK, INFO)
!--------------------------------!    

    
    print*,' LAPACK INFO = ',info

    IF( INFO.GT.0 ) THEN
        WRITE(*,*)'The calculation was unsuccessfull.'
        STOP
     END IF

    print*,' '

!-------------------------!    
    PRINT*,' Eigenvalues :'
    PRINT*,' '
    DO J = 1, NDIM
          WRITE(*,*) W( J )
    END DO
    WRITE(*,*)

!-------------------------!
    WRITE(*,*) 'Eigenvectors:'
    WRITE(*,*) 'Columnwise saved'
   do i = 1, ndim
      write(*,*)(A(i,j),j=1,ndim)
   end do

    call cpu_time(ste)
    cpu_sekunden = (ste - st0)
    print*, ''
    print*,' CPU Time: ',cpu_sekunden

!---------------------------!




end subroutine eigenvalueprob