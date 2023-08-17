MODULE := nedclib
SRC += $(wildcard $(MODULE)/*.cpp)
SRC += $(wildcard $(MODULE)/*/*.cpp)

nedclib/%: CPPFLAGS += -Inedclib

LIB += $(LIB_DIR)/libnedclib.a
$(LIB_DIR)/libnedclib.a: $(filter nedclib/%, $(SRC:.cpp=.o))
