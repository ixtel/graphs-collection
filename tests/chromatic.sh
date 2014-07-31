#!/usr/bin/env bats

@test "Bull graph." {
  result="$(chromatic ../src/Classic/Bull/bull.gv)"
  [ "$result" -eq 3 ]
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

