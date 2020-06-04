# Eigenvalue Solver using LAPACK
Eigenvalues and Eigenvector solver of a symmetrical Matrix using Subroutine "ssyev". For more information about the Subroutine please refer to this link: http://www.netlib.org/lapack/explore-html/d3/d88/group__real_s_yeigen_ga63d8d12aef8f2711d711d9e6bd833e46.html#ga63d8d12aef8f2711d711d9e6bd833e46

Requirements:
  -gfortran compiler
  
  -LAPACK Library
    - Installation of LAPACK Librry please refer to : 
         http://www.netlib.org/lapack/index.html
   
   - Please install the LAPACK Library in your $HOME directory or you can change the LAPACK directory in the makefile
   
How-to-use:
  On terminal where the directory is in this folder, run :
  
    make -f EWP_LAPACK.mk
    
  After successful compile, run:
  
    ./EWP_LAPACK.exe
    
  To remove the object files and executable, run: 
  
    make -f EWP_LAPACK.mk


