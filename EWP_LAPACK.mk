# GNU FORTRAN90 Compiler :
 CF=gfortran
FFLAGS=-g -Wall -fbounds-check -Ddiag_inp

SRC=EWP_LAPACK.F90 diag_inp.f90 eingenvalueprob.f90
OBJ=EWP_LAPACK.o diag_inp.o eingenvalueprob.o
#
LIB=${HOME}/lapack-3.9.0/liblapack.a ${HOME}/lapack-3.9.0/librefblas.a
#
fn=EWP_LAPACK

${fn}.exe: $(LIB) $(OBJ)
	@echo "${fn}.F90 wird compiliert --> Objectdatei :"
	$(CF) ${FFLAGS} -o ${fn}.exe $(OBJ) $(LIB)

clean:
	rm $(OBJ) ${fn}.exe

${fn}.o : ${fn}.F90 
	@echo "${fn}.F90 wird compiliert --> Objectdatei :"
	$(CF) ${FFLAGS} -c ${fn}.F90

diag_inp.o : diag_inp.f90 
	@echo "diag_inp.f90 wird compiliert --> Objectdatei :"
	$(CF) ${FFLAGS} -c diag_inp.f90

eingenvalueprob.o : eingenvalueprob.f90 
	@echo "eingenvalueprob.f90 wird compiliert --> Objectdatei :"
	$(CF) ${FFLAGS} -c eingenvalueprob.f90

