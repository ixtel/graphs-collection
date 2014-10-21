#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load petersen
}

@test "Petersen graph -> graph6" {
  [ $petersen_g6_computed_diameter -eq $petersen_expected_diameter ]
  [ $petersen_g6_computed_girth -eq $petersen_expected_girth ]
  [ $petersen_g6_computed_order -eq $petersen_expected_order ]
  [ $petersen_g6_computed_size -eq $petersen_expected_size ]
}

@test "Petersen graph -> DOT" {
  [ $petersen_gv_computed_chi -eq $petersen_expected_chi ]
  [ $petersen_gv_computed_size -eq $petersen_expected_size ]
  [ $petersen_gv_computed_maxdeg -eq $petersen_expected_maxdeg ]
  [ $petersen_gv_computed_order -eq $petersen_expected_order ]
}
