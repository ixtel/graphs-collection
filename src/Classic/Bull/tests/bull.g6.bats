#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load bull
}

@test "Bull graph: graph6. diameter" {
  [ "$bull_g6_computed_diameter" -eq $bull_expected_diameter ]
}
@test "Bull graph: graph6. girth" {
  [ "$bull_g6_computed_girth" -eq $bull_expected_girth ]
}
@test "Bull graph: graph6. order" {
  [ "$bull_g6_computed_order" -eq $bull_expected_order ]
}
@test "Bull graph: graph6. size" {
  [ "$bull_g6_computed_size" -eq $bull_expected_size ]
}
