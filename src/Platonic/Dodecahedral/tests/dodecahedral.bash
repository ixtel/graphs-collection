dodecahedral_dir=$HOME/workspace/graphs/graphs-collection/src/Platonic/Dodecahedral
dodecahedral_gv_path=$dodecahedral_dir/dodecahedral.gv
dodecahedral_g6_path=$dodecahedral_dir/dodecahedral.graph6
dodecahedral_properties_path=$dodecahedral_dir/dodecahedral_properties.yml

dodecahedral_expected_diameter=$(get_property $dodecahedral_properties_path diameter)
dodecahedral_expected_girth=$(get_property $dodecahedral_properties_path girth)
dodecahedral_expected_order=$(get_property $dodecahedral_properties_path order)
dodecahedral_expected_size=$(get_property $dodecahedral_properties_path size)
dodecahedral_expected_maxdeg=$(get_property $dodecahedral_properties_path max-degree)

dodecahedral_gv_computed_order=$(gv_order $dodecahedral_gv_path)
dodecahedral_gv_computed_size=$(gv_size $dodecahedral_gv_path)
dodecahedral_gv_computed_maxdeg=$(gv_maxdeg $dodecahedral_gv_path)

dodecahedral_g6_computed_diameter=$(g6_diameter $dodecahedral_g6_path)
dodecahedral_g6_computed_girth=$(g6_girth $dodecahedral_g6_path)
dodecahedral_g6_computed_order=$(g6_order $dodecahedral_g6_path)
dodecahedral_g6_computed_size=$(g6_size $dodecahedral_g6_path)
