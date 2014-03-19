#include <assert.h>
#include <stdio.h>
#include <igraph.h>
#include <jansson.h>
#include "CUnit/Basic.h"

static FILE* i_file = NULL;
static json_t *json = NULL;
static json_t *vcount_e, *ecount_e, *girth_e, *diameter_e, *maxdegree_e, *radius_e;
static igraph_t g;
static igraph_real_t radius;
static igraph_integer_t diameter, girth, maxdegree;

int get_parameter_data() {
 // Get data from JSON object.
 vcount_e = json_object_get(json, "n_vertices");
 ecount_e = json_object_get(json, "n_edges");
 radius_e = json_object_get(json, "radius");
 diameter_e = json_object_get(json, "diameter");
 girth_e = json_object_get(json, "girth");
 maxdegree_e = json_object_get(json, "maxdegree");
 return 0;
}

int compute_degree_parameters() {
 // Use igraph to compute degree parameters.
 igraph_maxdegree(&g, &maxdegree, igraph_vss_all(), IGRAPH_ALL, IGRAPH_NO_LOOPS);
 return 0;
}

int compute_distance_parameters() {
 // Use igraph to compute graph parameters.
 igraph_radius(&g, &radius, IGRAPH_ALL);
 igraph_diameter(&g, &diameter, 0, 0, 0, IGRAPH_UNDIRECTED, 1);
 igraph_girth(&g, &girth, 0);
 return 0;
}

int compute_all_parameters() {
 compute_degree_parameters();
 compute_distance_parameters();
 return 0;
}

// Chvatal Test Suite

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
  compute_all_parameters();
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

// Desargues Test Suite

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
  compute_all_parameters();
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

// Frucht Test Suite

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
  compute_all_parameters();
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

// Heawood Test Suite

int init_suite_heawood(void)
{
 json_error_t error;
 if (NULL == (i_file = fopen("../src/Classic/Heawood/heawood.gml", "r")) ||
   (NULL == (json = json_load_file("../src/Classic/Heawood/heawood_properties.json", 0, &error)))) {
  return -1;
 }

 else {
  igraph_read_graph_gml(&g, i_file);
  get_parameter_data();
  compute_all_parameters();
  return 0;
 }
}

int clean_suite_heawood(void)
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

// Petersen Test Suite

int init_suite_petersen(void)
{
 json_error_t error;
 if (NULL == (i_file = fopen("../src/Classic/Petersen/petersen.gml", "r")) ||
   (NULL == (json = json_load_file("../src/Classic/Petersen/petersen_properties.json", 0, &error)))) {
  return -1;
 }

 else {
  igraph_read_graph_gml(&g, i_file);
  get_parameter_data();
  compute_all_parameters();
  return 0;
 }
}

int clean_suite_petersen(void)
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

// Tutte Test Suite

int init_suite_tutte(void)
{
 json_error_t error;
 if (NULL == (i_file = fopen("../src/Classic/Tutte/tutte.gml", "r")) ||
   (NULL == (json = json_load_file("../src/Classic/Tutte/tutte_properties.json", 0, &error)))) {
  return -1;
 }

 else {
  igraph_read_graph_gml(&g, i_file);
  get_parameter_data();
  compute_all_parameters();
  return 0;
 }
}

int clean_suite_tutte(void)
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

// Test Functions

void test_basic_parameters(void)
{
 CU_ASSERT_EQUAL(igraph_vcount(&g), json_integer_value(vcount_e));
 CU_ASSERT_EQUAL(igraph_ecount(&g), json_integer_value(ecount_e));
}

void test_degree_parameters(void)
{
 CU_ASSERT_EQUAL(maxdegree, json_integer_value(maxdegree_e));
}

void test_distance_parameters(void)
{
 CU_ASSERT_EQUAL(radius, json_integer_value(radius_e));
 CU_ASSERT_EQUAL(diameter, json_integer_value(diameter_e));
 CU_ASSERT_EQUAL(girth, json_integer_value(girth_e));
}

int main(int argc, char *argv[])
{
 CU_pSuite pSuite_chvatal = NULL;
 CU_pSuite pSuite_desargues = NULL;
 CU_pSuite pSuite_frucht = NULL;
 CU_pSuite pSuite_heawood = NULL;
 CU_pSuite pSuite_petersen = NULL;
 CU_pSuite pSuite_tutte = NULL;

 /* initialize the CUnit test registry */
 if (CUE_SUCCESS != CU_initialize_registry())
  return CU_get_error();

 /* add a suite to the registry */
 pSuite_chvatal = CU_add_suite("Chvatal Graph", init_suite_chvatal, clean_suite_chvatal);
 pSuite_desargues = CU_add_suite("Desargues Graph", init_suite_desargues, clean_suite_desargues);
 pSuite_frucht = CU_add_suite("Frucht Graph", init_suite_frucht, clean_suite_frucht);
 pSuite_heawood = CU_add_suite("Heawood Graph", init_suite_heawood, clean_suite_heawood);
 pSuite_petersen = CU_add_suite("Petersen Graph", init_suite_petersen, clean_suite_petersen);
 pSuite_tutte = CU_add_suite("Tutte Graph", init_suite_tutte, clean_suite_tutte);

 if (NULL == pSuite_chvatal ||
   NULL == pSuite_desargues ||
   NULL == pSuite_frucht ||
   NULL == pSuite_heawood ||
   NULL == pSuite_petersen ||
   NULL == pSuite_tutte) {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the Chvatal suite */
 if ((NULL == CU_add_test(pSuite_chvatal, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_chvatal, "Test degree parameters.", test_degree_parameters)) ||
   (NULL == CU_add_test(pSuite_chvatal, "Test distance parameters.", test_distance_parameters)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the Desargues suite */
 if ((NULL == CU_add_test(pSuite_desargues, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_desargues, "Test degree parameters.", test_degree_parameters)) ||
   (NULL == CU_add_test(pSuite_desargues, "Test distance parameters.", test_distance_parameters)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the Frucht suite */
 if ((NULL == CU_add_test(pSuite_frucht, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_frucht, "Test degree parameters.", test_degree_parameters)) ||
   (NULL == CU_add_test(pSuite_frucht, "Test distance parameters.", test_distance_parameters)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the Heawood suite */
 if ((NULL == CU_add_test(pSuite_heawood, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_heawood, "Test degree parameters.", test_degree_parameters)) ||
   (NULL == CU_add_test(pSuite_heawood, "Test distance parameters.", test_distance_parameters)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the Petersen suite */
 if ((NULL == CU_add_test(pSuite_petersen, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_petersen, "Test degree parameters.", test_degree_parameters)) ||
   (NULL == CU_add_test(pSuite_petersen, "Test distance parameters.", test_distance_parameters)))
 {
  CU_cleanup_registry();
  return CU_get_error();
 }

 /* add the tests to the Tutte suite */
 if ((NULL == CU_add_test(pSuite_tutte, "Test basic parameters.", test_basic_parameters)) ||
   (NULL == CU_add_test(pSuite_tutte, "Test degree parameters.", test_degree_parameters)) ||
   (NULL == CU_add_test(pSuite_tutte, "Test distance parameters.", test_distance_parameters)))
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
