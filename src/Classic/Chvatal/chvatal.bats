#!/usr/bin/env bats

@test "Chvatal graph: Basic." {
  load ../../graphs
  load chvatal
  [ "$chvatal_gv_computed_maxdeg" -eq $chvatal_expected_maxdeg ]
  [ "$chvatal_gv_computed_order" -eq $chvatal_expected_order ]
  [ "$chvatal_gv_computed_size" -eq $chvatal_expected_size ]
}

@test "Chvatal graph: Chromatic." {
  load ../../graphs
  load chvatal
  [ "$chvatal_gv_computed_chi" -eq $chvatal_expected_chi ]
}

@test "Chvatal graph: Distance." {
  load ../../graphs
  load chvatal
  [ "$chvatal_g6_computed_diameter" -eq $chvatal_expected_diameter ]
  [ "$chvatal_g6_computed_girth" -eq $chvatal_expected_girth ]
}
