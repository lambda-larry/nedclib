MODULE := nedcenc
SRC += $(wildcard $(MODULE)/*.cpp)

nedcenc/%: CPPFLAGS += -Inedcenc
nedcenc/%: CPPFLAGS += -Inedclib

BIN += $(BIN_DIR)/nedcenc
$(BIN_DIR)/nedcenc: $(LIB_DIR)/libnedclib.a
$(BIN_DIR)/nedcenc: $(filter nedcenc/%, $(SRC:.cpp=.o))
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@
