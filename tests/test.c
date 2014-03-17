#include <assert.h>
#include <stdio.h>
#include <igraph.h>
#include <jansson.h>
#include "CUnit/Basic.h"

static FILE* i_file = NULL;
static json_t *json;
static igraph_t g;

int init_suite1(void)
{
  json_error_t error;
  if (NULL == (i_file = fopen("../src/Classic/Chvatal/chvatal.gml", "r")) ||
     (NULL == (json = json_load_file("../src/Classic/Chvatal/chvatal_properties.json", 0, &error)))) {
     return -1;
  }
  else {
     return 0;
  }

}

int clean_suite1(void)
{
  if (0 != fclose(i_file)) {
    return -1;
  }
  else {
     i_file = NULL;
     return 0;
  }
}

void test_chvatal(void)
{
  igraph_read_graph_gml(&g, i_file);

  json_t *vcount, *ecount, *girth, *diameter, *radius;
  igraph_real_t _radius;
  igraph_integer_t _diameter;
  igraph_integer_t _girth;

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

  // Test all computed parameters match data.
  assert(igraph_vcount(&g) == json_integer_value(vcount));
  assert(igraph_ecount(&g) == json_integer_value(ecount));
  assert(_radius == json_integer_value(radius));
  assert(_diameter == json_integer_value(diameter));
  assert(_girth == json_integer_value(girth));

  igraph_destroy(&g);
}

void test_tutte(void)
{
}

int main(int argc, char *argv[])
{
  CU_pSuite pSuite = NULL;

  /* initialize the CUnit test registry */
  if (CUE_SUCCESS != CU_initialize_registry())
     return CU_get_error();

  /* add a suite to the registry */
  pSuite = CU_add_suite("Suite_1", init_suite1, clean_suite1);
  if (NULL == pSuite) {
     CU_cleanup_registry();
     return CU_get_error();
  }

  /* add the tests to the suite */
  if ((NULL == CU_add_test(pSuite, "Test of Chvatal graph", test_chvatal)) ||
      (NULL == CU_add_test(pSuite, "Test of Tutte graph", test_tutte)))
  {
     CU_cleanup_registry();
     return CU_get_error();
  }

  /* Run all tests using the CUnit Basic interface */
  CU_basic_set_mode(CU_BRM_VERBOSE);
  CU_basic_run_tests();
  CU_cleanup_registry();
  return CU_get_error();
}
