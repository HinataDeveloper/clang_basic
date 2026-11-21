# Makefile for C practice inside the Rust project.
# Place this file in the project root (next to Cargo.toml).
#
# Usage:
#   make              build every src/*.c into bin/
#   make run          build and run bin/main
#   make run NAME=foo build and run bin/foo (from src/foo.c)
#   make clean        remove built binaries only (never touches src)

CC      := gcc
CFLAGS  := -Wall -Wextra -g -fsanitize=address,undefined
NAME    ?= main

SRC_DIR := src
BIN_DIR := bin

SRCS := $(wildcard $(SRC_DIR)/*.c)
BINS := $(patsubst $(SRC_DIR)/%.c,$(BIN_DIR)/%,$(SRCS))

.PHONY: all run clean

all: $(BINS)

$(BIN_DIR)/%: $(SRC_DIR)/%.c | $(BIN_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(BIN_DIR):
	mkdir -p $@

run: $(BIN_DIR)/$(NAME)
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo ""
	@./$(BIN_DIR)/$(NAME)
#	@echo ""
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

clean:
	rm -f $(BINS)
