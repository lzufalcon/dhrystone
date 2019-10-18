CC = gcc
CPPFLAGS += -DNUMBER_OF_RUNS=1000 -DNO_PROTOTYPES=1 -DHZ=100 -std=c11 -Wall -Wextra -pedantic
LDLIBS += -lm
OUT_DIR = .
OUT = $(OUT_DIR)/dhrystone

all: mkdir $(OUT)

$(OUT): $(OUT_DIR)/dhry_1.o $(OUT_DIR)/dhry_2.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o '$@' $^ $(LDLIBS)

$(OUT_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o '$@' $^

clean:
	rm -f '$(OUT_DIR)/'*.o '$(OUT_DIR)/dhrystone'

mkdir:
	mkdir -p '$(OUT_DIR)'

.PHONY: all clean mkdir
