MODULE := nevpk
SRC += $(wildcard $(MODULE)/*.cpp)

nevpk/%: CPPFLAGS += -Inevpk
nevpk/%: CPPFLAGS += -Inedclib

BIN += $(BIN_DIR)/nevpk
$(BIN_DIR)/nevpk: $(LIB_DIR)/libnedclib.a
$(BIN_DIR)/nevpk: $(filter nevpk/%, $(SRC:.cpp=.o))
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@
