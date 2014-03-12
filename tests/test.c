#include <assert.h>
#include <stdio.h>
#include <igraph.h>
#include <jansson.h>

int test(igraph_t *graph, json_t *data)
{
  json_t *vcount, *ecount, *girth, *diameter, *radius;
  igraph_real_t _radius;
  igraph_integer_t _diameter;
  igraph_integer_t _girth;

  // Get data from JSON object.
  vcount = json_object_get(data, "n_vertices");
  ecount = json_object_get(data, "n_edges");
  radius = json_object_get(data, "radius");
  diameter = json_object_get(data, "diameter");
  girth = json_object_get(data, "girth");

  // Use igraph to compute graph parameters.
  igraph_radius(graph, &_radius, IGRAPH_ALL);
  igraph_diameter(graph, &_diameter, 0, 0, 0, IGRAPH_UNDIRECTED, 1);
  igraph_girth(graph, &_girth, 0);

  // Test all computed parameters match data.
  assert(igraph_vcount(graph) == json_integer_value(vcount));
  assert(igraph_ecount(graph) == json_integer_value(ecount));
  assert(_radius == json_integer_value(radius));
  assert(_diameter == json_integer_value(diameter));
  assert(_girth == json_integer_value(girth));

  return 0;
}

int main(int argc, char *argv[])
{
  igraph_t g;
  FILE *ifile;
  json_t *json;
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

  test(&g, json);

  igraph_destroy(&g);

  return 0;
}
