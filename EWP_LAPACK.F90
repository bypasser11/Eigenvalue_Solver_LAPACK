
PROGRAM gaus

IMPLICIT NONE

#ifdef diag_inp
REAL(kind=4),DIMENSION(:), allocatable :: WORK, W

#endif
      INTEGER :: workmax
      INTEGER :: n_dim                                              ! Dimension
      INTEGER :: n_max                                              ! Index Max
      REAL(kind=4), DIMENSION(:)   , allocatable :: x               ! X Vector
      REAL(kind=4), DIMENSION(:)   , allocatable :: b               ! Right hand side vector
      REAL(kind=4), DIMENSION(:)   , allocatable :: b_old           ! Right hand side vector
      REAL(kind=4), DIMENSION(:)   , allocatable :: tmp             ! TMP
      REAL(kind=4), DIMENSION(:, :), allocatable :: a               ! Coefficient matrix
      REAL(kind=4), DIMENSION(:, :), allocatable :: a_old           ! Coefficient matrix

Interface
      SUBROUTINE DIAG_INP(N_DIM, N_MAX, B, A)
      IMPLICIT NONE

      !..glocal integer variables..
      INTEGER, INTENT(IN)                  :: n_dim
      INTEGER, INTENT(IN)                      :: n_max
      !..glocal real arrays..
      REAL, INTENT(INOUT)                     :: b(n_dim)
      REAL, INTENT(INOUT)                     :: a(n_dim, n_dim)
      END SUBROUTINE DIAG_INP
end Interface

Interface
subroutine eigenvalueprob(N_DIM,A,W,WORK,workmax,A_OLD)
      implicit none
      
      !Global variables
      
      INTEGER, INTENT(IN)      :: N_DIM, workmax
      REAL(kind=4), intent(out) :: WORK(workmax), W(N_DIM)
      REAL(kind=4), intent(inout) ::A(N_DIM,N_DIM),A_OLD(N_DIM,N_DIM)
      
end subroutine eigenvalueprob
end Interface

#ifdef diag_inp
      PRINT*,'Dimension of matrix :'
      READ ( 5,*) n_dim
      if(n_dim .lt. 4) then
            print*, 'A minimum dimension of n_dim > 3 is required.'
            stop
      end if
#endif

      allocate ( b(n_dim), b_old(n_dim), tmp(n_dim), x(n_dim) )
      allocate ( a(n_dim, n_dim), a_old(n_dim, n_dim) )

#ifdef diag_inp
      workmax = 5*N_DIM                               ! Minimum max(1,3*N-1) when JOBZ='V'
      allocate(WORK(workmax),W(n_dim))
#endif

      n_max = n_dim

#ifdef diag_inp
      CALL DIAG_INP(n_dim, n_max, b ,a)
#endif

      a_old = a
      b_old = b

#ifdef diag_inp
      CALL eigenvalueprob(N_DIM,A,W,WORK,workmax,A_OLD)
#endif

      deallocate ( b, b_old, tmp, x )
      deallocate ( a, a_old)
      
#ifdef diag_inp
      deallocate(WORK, W)
#endif
STOP
END PROGRAM gaus
