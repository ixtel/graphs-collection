CC=gcc
CFLAGS=-I/usr/local/include/igraph\
	   -L/usr/local/lib\
	   -ligraph\
	   -ljansson\
	   -lcunit

test: test.c
	$(CC) $(CFLAGS) -o test test.c
