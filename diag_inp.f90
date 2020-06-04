
      SUBROUTINE DIAG_INP(NDIM, NMAX, B, A)

      IMPLICIT NONE
      CHARACTER(len = 16) :: STRG
      INTEGER             :: ISTRG
      INTEGER             :: I, J, NDIM, NMAX
      REAL(kind = 4)      :: mp
      REAL(kind = 4)      :: B(NDIM)
      REAL(kind = 4)      :: A(NDIM, NDIM)

      A = 0.0
      b = 0.0
      A( 1, 1) =  4.0
      A( 1, 2) = -1.0
      A( 1, 3) = -1.0
      A( 2, 1) = -1.0
      A( 2, 2) =  4.0
      A( 2, 3) = -1.0
      A( 2, 4) = -1.0
      b(1) = 2.0
      b(2) = 1.0
      do i = 3 , NMAX-2
         A(I,I  ) =  4.0
         A(I,I+1) = -1.0
         A(I,I-1) = -1.0
         A(I,I+2) = -1.0
         A(I,I-2) = -1.0
         b(i) = 0.0
      end do
      A(NMAX-1, NMAX  ) = -1.0
      A(NMAX-1, NMAX-1)   =  4.0
      A(NMAX-1, NMAX-2) = -1.0
      A(NMAX-1, NMAX-3) = -1.0
      A(NMAX, NMAX)   =  4.0
      A(NMAX, NMAX-1) = -1.0
      A(NMAX, NMAX-2) = -1.0
      b(NMAX-1) = 1.0
      b(NMAX) = 2.0
      STRG = '                '
       PRINT*,'A Matrix :'
       PRINT*,' '
       do i = 1, ndim
           write(*,*)(a(i,j),j=1,ndim)
       end do

      PRINT*,' '
      RETURN
      END SUBROUTINE DIAG_INP