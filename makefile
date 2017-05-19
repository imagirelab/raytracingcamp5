TARGET=a.out

CPP=g++
OPT=
INC=
LIB=

-include makefile.opt

.SUFFIXES:.cpp .c .o .h

SRC=$(shell ls *.cpp)
HED=$(shell ls *.h)
OBJ=$(SRC:.cpp=.o)

all: $(TARGET)
$(TARGET): $(OBJ)
	$(CPP) $(OPT) -o $(TARGET) $(OBJ) $(LIB)

.c.o:
	$(CPP) $(OPT) -c $< $(INC)
.cpp.o:
	$(CPP) $(OPT) -c $< $(INC)

depend:
	g++ -MM -MG $(SRC) >makefile.depend

clean:
	rm -f $(TARGET) $(TARGET).exe
	rm -f *.o *.obj
	rm -f *~ *.~*

tar:
	tar cvzf $(TARGET).tar.gz $(SRC) $(HED) makefile

-include makefile.depend
