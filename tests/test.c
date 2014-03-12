#include <assert.h>
#include <stdio.h>
#include <igraph.h>
#include <jansson.h>

// Given a graph and a properties JSON object, check that all
// of the properties are satisfied by the graph.
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

// Given a file containing a graph (in GML format) and a JSON
// properties object, test that all properties hold for the graph
// contained in the file.
int check_properties(FILE *graph_file, json_t *properties) {
  igraph_t g;
  igraph_read_graph_gml(&g, graph_file);
  test(&g, properties);
  igraph_destroy(&g);
}

int main(int argc, char *argv[])
{
  FILE *ifile;
  json_t *json;
  json_error_t error;

  // Open a graph file in GML format.
  ifile = fopen("../Classic/Chvatal/chvatal.gml", "r");
  if (ifile == 0) {
    return 10;
  }

  // Load a JSON file.
  json = json_load_file("../Classic/Chvatal/chvatal_properties.json", 0, &error);
  if(!json) {
       /* the error variable contains error information */
  }

  // Check graph properties.
  check_properties(ifile, json);

  // Cleanup.
  fclose(ifile);

  return 0;
}
