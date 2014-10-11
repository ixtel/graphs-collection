#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load desargues
}

@test "Desargues graph -> graph6" {
  [ $desargues_g6_computed_diameter -eq $desargues_expected_diameter ]
  [ $desargues_g6_computed_girth -eq $desargues_expected_girth ]
  [ $desargues_g6_computed_order -eq $desargues_expected_order ]
  [ $desargues_g6_computed_size -eq $desargues_expected_size ]
}
