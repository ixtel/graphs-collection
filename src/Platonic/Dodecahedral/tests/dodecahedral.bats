#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load dodecahedral
}

@test "Dodecahedral graph -> graph6" {
  [ $dodecahedral_g6_computed_diameter -eq $dodecahedral_expected_diameter ]
  [ $dodecahedral_g6_computed_girth -eq $dodecahedral_expected_girth ]
  [ $dodecahedral_g6_computed_order -eq $dodecahedral_expected_order ]
  [ $dodecahedral_g6_computed_size -eq $dodecahedral_expected_size ]
}

@test "Dodecahedral graph -> DOT" {
  [ $dodecahedral_gv_computed_chi -eq $dodecahedral_expected_chi ]
  [ $dodecahedral_gv_computed_maxdeg -eq $dodecahedral_expected_maxdeg ]
  [ $dodecahedral_gv_computed_order -eq $dodecahedral_expected_order ]
  [ $dodecahedral_gv_computed_size -eq $dodecahedral_expected_size ]
}

