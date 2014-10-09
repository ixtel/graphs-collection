#!/usr/bin/env bats

@test "Chvatal Graph." {
  load chvatal
  [ "$chvatal_gv_computed_chi" -eq $chvatal_expected_chi ]
  [ "$chvatal_gv_computed_order" -eq $chvatal_expected_order ]
  [ "$chvatal_gv_computed_size" -eq $chvatal_expected_size ]
  [ "$chvatal_gv_computed_maxdeg" -eq $chvatal_expected_maxdeg ]
}

