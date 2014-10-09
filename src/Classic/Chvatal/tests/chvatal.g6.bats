#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load chvatal
}

@test "Chvatal graph: graph6. diameter" {
  [ "$chvatal_g6_computed_diameter" -eq $chvatal_expected_diameter ]
}
@test "Chvatal graph: graph6. girth" {
  [ "$chvatal_g6_computed_girth" -eq $chvatal_expected_girth ]
}
@test "Chvatal graph: graph6. order" {
  [ "$chvatal_g6_computed_order" -eq $chvatal_expected_order ]
}
@test "Chvatal graph: graph6. size" {
  [ "$chvatal_g6_computed_size" -eq $chvatal_expected_size ]
}
