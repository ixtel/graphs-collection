#include <assert.h>
#include <stdio.h>
#include <igraph.h>

int main(int argc, char *argv[])
{
  igraph_t g;
  igraph_real_t radius;
  igraph_integer_t diameter;
  igraph_integer_t girth;
  FILE *ifile;
  
  ifile = fopen("../Classic/Chvatal/chvatal.gml", "r");
  if (ifile == 0) {
    return 10;
  }
  
  igraph_read_graph_gml(&g, ifile);
  fclose(ifile);

  assert(igraph_vcount(&g) == 12);
  assert(igraph_ecount(&g) == 24);

  igraph_radius(&g, &radius, IGRAPH_ALL);
  assert(radius == 2);

  igraph_diameter(&g, &diameter, 0, 0, 0, IGRAPH_UNDIRECTED, 1);
  assert(diameter == 2);

  igraph_girth(&g, &girth, 0);
  assert(girth == 4);

  igraph_destroy(&g);
  
  return 0;
}
