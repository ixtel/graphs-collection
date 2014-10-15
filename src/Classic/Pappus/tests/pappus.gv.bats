#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load pappus
}

@test "Pappus graph -> DOT" {
  [ "$pappus_gv_computed_chi" -eq $pappus_expected_chi ]
  [ "$pappus_gv_computed_size" -eq $pappus_expected_size ]
  [ "$pappus_gv_computed_maxdeg" -eq $pappus_expected_maxdeg ]
  [ "$pappus_gv_computed_order" -eq $pappus_expected_order ]
}

