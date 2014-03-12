#include <assert.h>
#include <stdio.h>
#include <igraph.h>
#include <jansson.h>

int main(int argc, char *argv[])
{
  igraph_t g;
  igraph_real_t _radius;
  igraph_integer_t _diameter;
  igraph_integer_t _girth;
  FILE *ifile;
  json_t *json;
  json_t *vcount, *ecount, *girth, *diameter, *radius;
  json_error_t error;

  
  ifile = fopen("../Classic/Chvatal/chvatal.gml", "r");
  if (ifile == 0) {
    return 10;
  }

  igraph_read_graph_gml(&g, ifile);

  json = json_load_file("../Classic/Chvatal/chvatal_properties.json", 0, &error);
  if(!json) {
       /* the error variable contains error information */
  }

  fclose(ifile);

  // Get data from JSON object.
  vcount = json_object_get(json, "n_vertices");
  ecount = json_object_get(json, "n_edges");
  radius = json_object_get(json, "radius");
  diameter = json_object_get(json, "diameter");
  girth = json_object_get(json, "girth");

  // Use igraph to compute graph parameters.
  igraph_radius(&g, &_radius, IGRAPH_ALL);
  igraph_diameter(&g, &_diameter, 0, 0, 0, IGRAPH_UNDIRECTED, 1);
  igraph_girth(&g, &_girth, 0);

  // Test all computed parametes match data.
  assert(igraph_vcount(&g) == json_integer_value(vcount));
  assert(igraph_ecount(&g) == json_integer_value(ecount));
  assert(_radius == json_integer_value(radius));
  assert(_diameter == json_integer_value(diameter));
  assert(_girth == json_integer_value(girth));

  igraph_destroy(&g);
  
  return 0;
}
