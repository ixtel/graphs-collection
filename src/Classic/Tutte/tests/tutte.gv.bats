#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load tutte
}

@test "Tutte graph -> DOT" {
  [ "$tutte_gv_computed_size" -eq $tutte_expected_size ]
  [ "$tutte_gv_computed_order" -eq $tutte_expected_order ]
}

