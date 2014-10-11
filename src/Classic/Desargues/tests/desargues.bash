desargues_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Desargues
desargues_gv_path=$desargues_dir/desargues.gv
desargues_g6_path=$desargues_dir/desargues.graph6
desargues_properties_path=$desargues_dir/desargues_properties.yml

desargues_expected_chi=$(get_property $desargues_properties_path chromatic-number)
desargues_expected_diameter=$(get_property $desargues_properties_path diameter)
desargues_expected_girth=$(get_property $desargues_properties_path girth)
desargues_expected_order=$(get_property $desargues_properties_path order)
desargues_expected_size=$(get_property $desargues_properties_path size)
desargues_expected_maxdeg=$(get_property $desargues_properties_path max-degree)

desargues_gv_computed_chi=$(gv_chromatic $desargues_gv_path)
desargues_gv_computed_order=$(gv_order $desargues_gv_path)
desargues_gv_computed_size=$(gv_size $desargues_gv_path)
desargues_gv_computed_maxdeg=$(gv_maxdeg $desargues_gv_path)

desargues_g6_computed_diameter=$(g6_diameter $desargues_g6_path)
desargues_g6_computed_girth=$(g6_girth $desargues_g6_path)
desargues_g6_computed_order=$(g6_order $desargues_g6_path)
desargues_g6_computed_size=$(g6_size $desargues_g6_path)
