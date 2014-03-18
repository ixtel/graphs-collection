#include <assert.h>
#include <stdio.h>
#include <igraph.h>
#include <jansson.h>
#include "CUnit/Basic.h"

static FILE* i_file = NULL;
static json_t *json = NULL;
static igraph_t g;
static json_t *vcount, *ecount, *girth, *diameter, *radius;
static igraph_real_t _radius;
static igraph_integer_t _diameter;
static igraph_integer_t _girth;

int get_parameter_data() {
  // Get data from JSON object.
  vcount = json_object_get(json, "n_vertices");
  ecount = json_object_get(json, "n_edges");
  radius = json_object_get(json, "radius");
  diameter = json_object_get(json, "diameter");
  girth = json_object_get(json, "girth");
  return 0;
}

int compute_distance_parameters() {
  // Use igraph to compute graph parameters.
  igraph_radius(&g, &_radius, IGRAPH_ALL);
  igraph_diameter(&g, &_diameter, 0, 0, 0, IGRAPH_UNDIRECTED, 1);
  igraph_girth(&g, &_girth, 0);
  return 0;
}

int init_suite_chvatal(void)
{
 json_error_t error;
 if (NULL == (i_file = fopen("../src/Classic/Chvatal/chvatal.gml", "r")) ||
   (NULL == (json = json_load_file("../src/Classic/Chvatal/chvatal_properties.json", 0, &error)))) {
  return -1;
 }

 else {
  igraph_read_graph_gml(&g, i_file);
  get_parameter_data();
  compute_distance_parameters();
  return 0;
 }
}

int clean_suite_chvatal(void)
{
 if (0 != fclose(i_file)) {
  return -1;
 }
 else {
  igraph_destroy(&g);
  i_file = NULL;
  return 0;
 }
}

int init_suite_desargues(void)
{
 json_error_t error;
 if (NULL == (i_file = fopen("../src/Classic/Desargues/desargues.gml", "r")) ||
   (NULL == (json = json_load_file("../src/Classic/Desargues/desargues_properties.json", 0, &error)))) {
  return -1;
 }

 else {
  igraph_read_graph_gml(&g, i_file);
  get_parameter_data();
  compute_distance_parameters();
  return 0;
 }
}

int clean_suite_desargues(void)
{
 if (0 != fclose(i_file)) {
  return -1;
 }
 else {
  igraph_destroy(&g);
  i_file = NULL;
  return 0;
 }
}

int init_suite_frucht(void)
{
 json_error_t error;
 if (NULL == (i_file = fopen("../src/Classic/Frucht/frucht.gml", "r")) ||
   (NULL == (json = json_load_file("../src/Classic/Frucht/frucht_properties.json", 0, &error)))) {
  return -1;
 }

 else {
  igraph_read_graph_gml(&g, i_file);
  get_parameter_data();
  compute_distance_parameters();
  return 0;
 }
}

int clean_suite_frucht(void)
{
 if (0 != fclose(i_file)) {
  return -1;
 }
 else {
  igraph_destroy(&g);
  i_file = NULL;
  return 0;
 }
}

void test_basic_parameters(void)
{
 CU_ASSERT_EQUAL(igraph_vcount(&g), json_integer_value(vcount));
 CU_ASSERT_EQUAL(igraph_ecount(&g), json_integer_value(ecount));
}

void test_distances(void)
{
 CU_ASSERT_EQUAL(_radius, json_integer_value(radius));
 CU_ASSERT_EQUAL(_diameter, json_integer_value(diameter));
 CU_ASSERT_EQUAL(_girth, json_integer_value(girth));
}

int main(int argc, char *argv[])
{
 CU_pSuite pSuite_chvatal = NULL;
 CU_pSuite pSuite_desargues = NULL;
 CU_pSuite pSuite_frucht = NULL;

 /* initialize the CUnit test registry */
 if (CUE_SUCCESS != CU_initialize_registry())
  return CU_get_error();

 /* add a suite to the registry */
 pSuite_chvatal = CU_add_suite("Chvatal Graph", init_suite_chvatal, clean_suite_chvatal);
 pSuite_desargues = CU_add_suite("Desargues Graph", init_suite_desargues, clean_suite_desargues);
 pSuite_frucht = CU_add_suite("Frucht Graph", init_suite_frucht, clean_suite_frucht);
 if (NULL == pSuite_chvatal ||
   NULL == pSuite_desargues ||
   NULL == pSuite_frucht) {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the suite */
 if ((NULL == CU_add_test(pSuite_chvatal, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_chvatal, "Test distance paramters.", test_distances)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the suite */
 if ((NULL == CU_add_test(pSuite_desargues, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_desargues, "Test distance paramters.", test_distances)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the suite */
 if ((NULL == CU_add_test(pSuite_frucht, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_frucht, "Test distance paramters.", test_distances)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* Run all tests using the CUnit Basic interface */
 CU_basic_set_mode(CU_BRM_VERBOSE);
 CU_curses_run_tests();
 CU_cleanup_registry();
 return CU_get_error();
}
