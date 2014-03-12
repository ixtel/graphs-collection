CC=gcc
CFLAGS=-I/usr/local/include/igraph\
	   -L/usr/local/lib\
	   -ligraph\
	   -ljansson

test: test.c
	$(CC) $(CFLAGS) -o test test.c
