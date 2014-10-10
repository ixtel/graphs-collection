#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load bull
}

@test "Bull graph -> DOT -> chi" {
  [ "$bull_gv_computed_chi" -eq $bull_expected_chi ]
}
@test "Bull graph -> DOT -> maxdeg" {
  [ "$bull_gv_computed_maxdeg" -eq $bull_expected_maxdeg ]
}
@test "Bull graph -> DOT -> order" {
  [ "$bull_gv_computed_order" -eq $bull_expected_order ]
}
@test "Bull graph -> DOT -> size" {
  [ "$bull_gv_computed_size" -eq $bull_expected_size ]
}

