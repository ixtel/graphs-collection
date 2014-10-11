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
