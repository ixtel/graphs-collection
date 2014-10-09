#!/usr/bin/env bats

setup() {
  gv_chi_computer=chromatic
  src_dir=$HOME/workspace/graphs/graphs-collection/src
}

@test "Bull graph." {
  bull_dir="$src_dir/Classic/Bull"
  bull_gv_path="$bull_dir/bull.gv"
  bull_properties_path="$bull_dir/bull_properties.yml"
  bull_expected_chi=`cat $bull_properties_path | awk -F": " '/chromatic-number:/ { print $2  }'`
  bull_gv_computed_chi="$($gv_chi_computer $bull_gv_path)"
  [ "$bull_gv_computed_chi" -eq $bull_expected_chi ]
}

@test "Chvatal graph." {
  result="$(chromatic ../src/Classic/Chvatal/chvatal.gv)"
  [ "$result" -eq 4 ]
}

@test "Desargues graph." {
  result="$(chromatic ../src/Classic/Desargues/desargues.gv)"
  [ "$result" -eq 2 ]
}

@test "Frucht graph." {
  result="$(chromatic ../src/Classic/Frucht/frucht.gv)"
  [ "$result" -eq 3 ]
}

@test "Heawood graph." {
  result="$(chromatic ../src/Classic/Heawood/heawood.gv)"
  [ "$result" -eq 2 ]
}

@test "Pappus graph." {
  result="$(chromatic ../src/Classic/Pappus/pappus.gv)"
  [ "$result" -eq 2 ]
}

@test "Petersen graph." {
  result="$(chromatic ../src/Classic/Petersen/petersen.gv)"
  [ "$result" -eq 3 ]
}

