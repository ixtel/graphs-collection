#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load chvatal
}

@test "Chvatal graph -> DOT -> chi" {
  [ "$chvatal_gv_computed_chi" -eq $chvatal_expected_chi ]
}
@test "Chvatal graph -> DOT -> maxdeg" {
  [ "$chvatal_gv_computed_maxdeg" -eq $chvatal_expected_maxdeg ]
}
@test "Chvatal graph -> DOT -> order" {
  [ "$chvatal_gv_computed_order" -eq $chvatal_expected_order ]
}
@test "Chvatal graph -> DOT -> size" {
  [ "$chvatal_gv_computed_size" -eq $chvatal_expected_size ]
}

