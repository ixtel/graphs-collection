#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load chvatal
}

@test "Chvatal graph -> DOT" {
  [ "$chvatal_gv_computed_chi" -eq $chvatal_expected_chi ]
  [ "$chvatal_gv_computed_maxdeg" -eq $chvatal_expected_maxdeg ]
  [ "$chvatal_gv_computed_order" -eq $chvatal_expected_order ]
  [ "$chvatal_gv_computed_size" -eq $chvatal_expected_size ]
}

