petersen_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Petersen
petersen_gv_path=$petersen_dir/petersen.gv
petersen_g6_path=$petersen_dir/petersen.graph6
petersen_properties_path=$petersen_dir/petersen_properties.yml

petersen_expected_chi=$(get_property $petersen_properties_path chromatic-number)
petersen_expected_diameter=$(get_property $petersen_properties_path diameter)
petersen_expected_girth=$(get_property $petersen_properties_path girth)
petersen_expected_order=$(get_property $petersen_properties_path order)
petersen_expected_size=$(get_property $petersen_properties_path size)
petersen_expected_maxdeg=$(get_property $petersen_properties_path max-degree)

petersen_gv_computed_chi=$(gv_chromatic $petersen_gv_path)
petersen_gv_computed_order=$(gv_order $petersen_gv_path)
petersen_gv_computed_size=$(gv_size $petersen_gv_path)
petersen_gv_computed_maxdeg=$(gv_maxdeg $petersen_gv_path)

petersen_g6_computed_diameter=$(g6_diameter $petersen_g6_path)
petersen_g6_computed_girth=$(g6_girth $petersen_g6_path)
petersen_g6_computed_order=$(g6_order $petersen_g6_path)
petersen_g6_computed_size=$(g6_size $petersen_g6_path)
