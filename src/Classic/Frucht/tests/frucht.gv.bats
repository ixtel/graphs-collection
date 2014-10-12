#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load frucht
}

@test "Frucht graph -> DOT" {
  [ "$frucht_gv_computed_chi" -eq $frucht_expected_chi ]
  [ "$frucht_gv_computed_size" -eq $frucht_expected_size ]
  [ "$frucht_gv_computed_maxdeg" -eq $frucht_expected_maxdeg ]
  [ "$frucht_gv_computed_order" -eq $frucht_expected_order ]
}

