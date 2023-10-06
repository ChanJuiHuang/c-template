.PHONY: all clean

CC=gcc
CFLAGS=-std=c11 -Wall -Wextra

C_FILES=$(shell find src -type f -name "*.c")
OBJECTS=$(patsubst %.c,%.o,$(C_FILES))
BIN_DIR=bin
EXECUABLE=$(BIN_DIR)/main

all: $(EXECUABLE)

run: $(EXECUABLE)
	./$(EXECUABLE)

$(EXECUABLE): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(EXECUABLE) $^

%.o: %.c
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

debug: CFLAGS+=-g
debug: $(OBJECTS)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/$@-main $^

clean:
	rm -rf $(OBJECTS) $(BIN_DIR)/*
