#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load pappus
}

@test "Pappus graph -> graph6" {
  [ $pappus_g6_computed_diameter -eq $pappus_expected_diameter ]
  [ $pappus_g6_computed_girth -eq $pappus_expected_girth ]
  [ $pappus_g6_computed_order -eq $pappus_expected_order ]
  [ $pappus_g6_computed_size -eq $pappus_expected_size ]
}
