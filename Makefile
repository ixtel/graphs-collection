CC=gcc
CFLAGS=-I/usr/include/igraph -ligraph

test: test.c
	$(CC) $(CFLAGS) -o test test.c
