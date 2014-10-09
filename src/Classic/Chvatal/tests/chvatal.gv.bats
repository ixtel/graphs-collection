#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load chvatal
}

@test "Chvatal graph: Graphviz. maxdeg" {
  [ "$chvatal_gv_computed_maxdeg" -eq $chvatal_expected_maxdeg ]
}
@test "Chvatal graph: Graphviz. order" {
  [ "$chvatal_gv_computed_order" -eq $chvatal_expected_order ]
}
@test "Chvatal graph: Graphviz. size" {
  [ "$chvatal_gv_computed_size" -eq $chvatal_expected_size ]
}
@test "Chvatal graph: Graphviz. chi" {
  [ "$chvatal_gv_computed_chi" -eq $chvatal_expected_chi ]
}

