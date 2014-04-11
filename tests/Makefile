CC=gcc
CFLAGS=-I/usr/local/include/igraph\
	   -L/usr/local/lib\
	   -ligraph\
	   -ljansson\
	   -lcunit

check: test
	./test

test: test.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f test
