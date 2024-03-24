include config.mk

all: lib/libminmea.a
example: bin/example
test: bin/tests

bin/example: obj/example.o lib/libminmea.a | bin
	cc $(LDFLAGS) -Llib -lminmea $< -o $@

bin/tests: obj/tests.o lib/libminmea.a | bin
	cc $(LDFLAGS) -Llib -lminmea -lcheck $< -o $@

lib/libminmea.a: obj/minmea.o | lib
	ar $(ARFLAGS) $@ $^

obj/%.o: src/%.c | obj
	cc $(CFLAGS) -c $< -o $@

bin obj lib:
	mkdir -p $@

clean:
	rm -rf bin obj lib

.PHONY: all example test clean
