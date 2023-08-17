CFLAGS := -std=c99 -Wall -pedantic

CXXFLAGS := -std=c++03 -pedantic -Wall -Wpedantic

BIN_DIR := build/bin
LIB_DIR := build/lib

default: all

BIN :=

SRC :=
MODULES := nedcenc nedclib nedcmake nevpk raw2bmp
include $(MODULES:%=%/module.mk)

OBJ := $(SRC:.cpp=.o)
DEP := $(OBJ:.o=.d)

include $(DEP)

all: $(BIN)

%.d: %.cpp
	$(CXX) $(CPPFLAGS) -MM -MG -MT '$(@:.d=.o) $@' $< -MF $@

(%): %;
%.a:
	$(AR) $(ARFLAGS) $@ $?

clean-all: clean clean-dep

clean:
	$(RM) $(OBJ) $(BIN) $(LIB)

clean-dep:
	$(RM) $(DEP)
