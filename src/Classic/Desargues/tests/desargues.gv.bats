#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load desargues
}

@test "Desargues graph -> DOT" {
  [ "$desargues_gv_computed_chi" -eq $desargues_expected_chi ]
  [ "$desargues_gv_computed_size" -eq $desargues_expected_size ]
  [ "$desargues_gv_computed_maxdeg" -eq $desargues_expected_maxdeg ]
  [ "$desargues_gv_computed_order" -eq $desargues_expected_order ]
}

