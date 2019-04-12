CC 		= g++
LIBS 	=
CFLAGS= -Wall -std=c++11 -Wextra -Werror
SRC		=	src
SOURCES	:=$(wildcard $(SRC)/*.cpp)
OBJS		:= $(SOURCES:$(SRC)/%.cpp=obj/%.o)
CLIB =-L/home/compphys/wuma8935/custemlib/lib64/ -L.
CINC =-I/home/compphys/wuma8935/custemlib/include/
LIBNAME	=libtools.a

$(LIBNAME): $(OBJS)
	ar rcs $@ $(OBJS)

.PHONY:test
test: $(OBJS) $(LIBNAME)
	$(CC) $(CLIB) $(CINC) test/mainTest.cpp -lgtest -ltools -lgmock -Wall -std=c++11 -pthread -o runTest
	./runTest

obj/%.o: $(SRC)/%.cpp | obj
	$(CC) $(CFLAGS) -c $< -o $@

obj:
	mkdir -p $@

clean:
	rm -r obj/ ${LIBNAME}
