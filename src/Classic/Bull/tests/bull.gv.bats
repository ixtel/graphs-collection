#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load bull
}

@test "Bull graph -> DOT" {
  [ "$bull_gv_computed_chi" -eq $bull_expected_chi ]
  [ "$bull_gv_computed_maxdeg" -eq $bull_expected_maxdeg ]
  [ "$bull_gv_computed_order" -eq $bull_expected_order ]
  [ "$bull_gv_computed_size" -eq $bull_expected_size ]
}

