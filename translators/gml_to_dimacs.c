#include <stdio.h>
#include <igraph.h>

int main(int argc, char *argv[])
{
  igraph_t g;
  FILE *ifile;
  FILE *ofile;
  igraph_vector_t v;
  
  igraph_vector_init(&v, 69);

  ifile = fopen("../Classic/Tutte/tutte.gml", "r");
  ofile = fopen("../Classic/Tutte/tutte.dimacs", "w");

  if (ifile == 0) {
    return 10;
  }

  if (ofile == 0) {
    return 10;
  }

  igraph_read_graph_gml(&g, ifile);
  igraph_write_graph_dimacs(&g, ofile, 0, 0, &v);

  fclose(ifile);
  fclose(ofile);

  igraph_vector_destroy(&v);
  igraph_destroy(&g);

  return 0;
}
