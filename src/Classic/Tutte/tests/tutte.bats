#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load tutte
}

@test "Tutte graph -> graph6" {
  [ $tutte_g6_computed_diameter -eq $tutte_expected_diameter ]
  [ $tutte_g6_computed_girth -eq $tutte_expected_girth ]
  [ $tutte_g6_computed_order -eq $tutte_expected_order ]
  [ $tutte_g6_computed_size -eq $tutte_expected_size ]
}

@test "Tutte graph -> DOT" {
  [ $tutte_gv_computed_maxdeg -eq $tutte_expected_maxdeg ]
  [ $tutte_gv_computed_size -eq $tutte_expected_size ]
  [ $tutte_gv_computed_order -eq $tutte_expected_order ]
}
