#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load bull
}

@test "Bull graph: Graphviz. order" {
  [ "$bull_gv_computed_order" -eq $bull_expected_order ]
}
@test "Bull graph: Graphviz. size" {
  [ "$bull_gv_computed_size" -eq $bull_expected_size ]
}
@test "Bull graph: Graphviz. maxdeg" {
  [ "$bull_gv_computed_maxdeg" -eq $bull_expected_maxdeg ]
}
@test "Bull graph: Graphviz. chi" {
  [ "$bull_gv_computed_chi" -eq $bull_expected_chi ]
}

