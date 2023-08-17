MODULE := raw2bmp
SRC += $(wildcard $(MODULE)/*.cpp)

raw2bmp/%: CPPFLAGS += -Iraw2bmp
raw2bmp/%: CPPFLAGS += -Inedclib

BIN += $(BIN_DIR)/raw2bmp
$(BIN_DIR)/raw2bmp: $(LIB_DIR)/libnedclib.a
$(BIN_DIR)/raw2bmp: $(filter raw2bmp/%, $(SRC:.cpp=.o))
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@


