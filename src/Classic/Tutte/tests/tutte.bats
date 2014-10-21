#!/usr/bin/env bats

setup() {
  load ../../../graphs
  load tutte

  tutte_expected_diameter=$(get_property $tutte_properties_path diameter)
  tutte_expected_girth=$(get_property $tutte_properties_path girth)
  tutte_expected_order=$(get_property $tutte_properties_path order)
  tutte_expected_size=$(get_property $tutte_properties_path size)
  tutte_expected_maxdeg=$(get_property $tutte_properties_path max-degree)

  tutte_gv_computed_order=$(gv_order $tutte_gv_path)
  tutte_gv_computed_size=$(gv_size $tutte_gv_path)
  tutte_gv_computed_maxdeg=$(gv_maxdeg $tutte_gv_path)

  tutte_g6_computed_diameter=$(g6_diameter $tutte_g6_path)
  tutte_g6_computed_girth=$(g6_girth $tutte_g6_path)
  tutte_g6_computed_order=$(g6_order $tutte_g6_path)
  tutte_g6_computed_size=$(g6_size $tutte_g6_path)
}

@test "Tutte graph -> graph6" {
  [ $tutte_g6_computed_diameter -eq $tutte_expected_diameter ]
  [ $tutte_g6_computed_girth -eq $tutte_expected_girth ]
  [ $tutte_g6_computed_order -eq $tutte_expected_order ]
  [ $tutte_g6_computed_size -eq $tutte_expected_size ]
}

@test "Tutte graph -> DOT" {
  [ $tutte_gv_computed_maxdeg -eq $tutte_expected_maxdeg ]
  [ $tutte_gv_computed_size -eq $tutte_expected_size ]
  [ $tutte_gv_computed_order -eq $tutte_expected_order ]
}
