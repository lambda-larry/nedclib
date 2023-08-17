MODULE := nedcmake
SRC += $(wildcard $(MODULE)/*.cpp)

nedcmake/%: CPPFLAGS += -Inedcmake
nedcmake/%: CPPFLAGS += -Inedclib

BIN += $(BIN_DIR)/nedcmake
$(BIN_DIR)/nedcmake: $(LIB_DIR)/libnedclib.a
$(BIN_DIR)/nedcmake: $(filter nedcmake/%, $(SRC:.cpp=.o))
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@
