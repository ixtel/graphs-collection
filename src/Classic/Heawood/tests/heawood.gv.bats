#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load heawood
}

@test "Heawood graph -> DOT" {
  [ "$heawood_gv_computed_chi" -eq $heawood_expected_chi ]
  [ "$heawood_gv_computed_size" -eq $heawood_expected_size ]
  [ "$heawood_gv_computed_maxdeg" -eq $heawood_expected_maxdeg ]
  [ "$heawood_gv_computed_order" -eq $heawood_expected_order ]
}

