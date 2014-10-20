#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load tutte
}

@test "Tutte graph -> graph6" {
  [ $tutte_g6_computed_order -eq $tutte_expected_order ]
  [ $tutte_g6_computed_size -eq $tutte_expected_size ]
}
