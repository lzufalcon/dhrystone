CC = gcc
CPPFLAGS += -DNUMBER_OF_RUNS=1000 -DNO_PROTOTYPES=1 -DHZ=100 -std=c11 -Wall -Wextra -pedantic
EXTRA_OBJS =
LDLIBS += -lm
OUT_DIR = .
OUT = $(OUT_DIR)/dhrystone

all: $(OUT_DIR) $(OUT)

$(OUT): $(OUT_DIR)/dhry_1.o $(OUT_DIR)/dhry_2.o $(EXTRA_OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o '$@' $^ $(LDLIBS)

$(OUT_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o '$@' $^

clean:
	rm -f '$(OUT_DIR)/'*.o '$(OUT_DIR)/dhrystone'

$(OUT_DIR):
	mkdir -p '$(OUT_DIR)'

.PHONY: all clean
