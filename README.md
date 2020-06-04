# Eigenvalue Solver using LAPACK
Eigenvalues and Eigenvector solver of a symmetrical Matrix

Requirements:
  -gfortran compiler
  
  -LAPACK Library
    - Installation of LAPACK Library please refer to : 
         http://www.netlib.org/lapack/index.html
   
   - Please install the LAPACK Library in your $HOME directory or you can change the LAPACK directory in the makefile
   
How-to-use:
  On terminal where the directory is in this folder, run :
  
    make -f EWP_LAPACK.mk
    
  After successful compile, run:
  
    ./EWP_LAPACK.exe
    
  To remove the object files and executable, run: 
  
    make -f EWP_LAPACK.mk


