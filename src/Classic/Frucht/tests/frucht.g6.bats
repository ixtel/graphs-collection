#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load frucht
}

@test "Frucht graph -> graph6" {
  [ $frucht_g6_computed_diameter -eq $frucht_expected_diameter ]
  [ $frucht_g6_computed_girth -eq $frucht_expected_girth ]
  [ $frucht_g6_computed_order -eq $frucht_expected_order ]
  [ $frucht_g6_computed_size -eq $frucht_expected_size ]
}
