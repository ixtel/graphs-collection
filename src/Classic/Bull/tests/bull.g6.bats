#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load bull
}

@test "Bull graph -> graph6" {
  [ "$bull_g6_computed_diameter" -eq $bull_expected_diameter ]
  [ "$bull_g6_computed_girth" -eq $bull_expected_girth ]
  [ "$bull_g6_computed_order" -eq $bull_expected_order ]
  [ "$bull_g6_computed_size" -eq $bull_expected_size ]
}
