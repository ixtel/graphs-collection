#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load petersen
}

@test "Petersen graph -> DOT" {
  [ "$petersen_gv_computed_chi" -eq $petersen_expected_chi ]
  [ "$petersen_gv_computed_size" -eq $petersen_expected_size ]
  [ "$petersen_gv_computed_maxdeg" -eq $petersen_expected_maxdeg ]
  [ "$petersen_gv_computed_order" -eq $petersen_expected_order ]
}

