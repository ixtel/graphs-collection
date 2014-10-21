#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load chvatal
}

@test "Chvatal graph -> graph6" {
  [ $chvatal_g6_computed_diameter -eq $chvatal_expected_diameter ]
  [ $chvatal_g6_computed_girth -eq $chvatal_expected_girth ]
  [ $chvatal_g6_computed_order -eq $chvatal_expected_order ]
  [ $chvatal_g6_computed_size -eq $chvatal_expected_size ]
}

@test "Chvatal graph -> DOT" {
  [ $chvatal_gv_computed_chi -eq $chvatal_expected_chi ]
  [ $chvatal_gv_computed_maxdeg -eq $chvatal_expected_maxdeg ]
  [ $chvatal_gv_computed_order -eq $chvatal_expected_order ]
  [ $chvatal_gv_computed_size -eq $chvatal_expected_size ]
}
