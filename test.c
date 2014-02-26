#include <assert.h>
#include <stdio.h>
#include <igraph.h>

int main(int argc, char *argv[])
{
  igraph_t g;
  FILE *ifile;
  
  ifile = fopen("Classic/Chvatal/chvatal.gml", "r");
  if (ifile == 0) {
    return 10;
  }
  
  igraph_read_graph_gml(&g, ifile);
  fclose(ifile);

  assert(igraph_vcount(&g) == 12);
  assert(igraph_ecount(&g) == 24);

  igraph_destroy(&g);
  
  return 0;
}
