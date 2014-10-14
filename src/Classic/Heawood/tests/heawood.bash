heawood_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Heawood
heawood_gv_path=$heawood_dir/heawood.gv
heawood_g6_path=$heawood_dir/heawood.graph6
heawood_properties_path=$heawood_dir/heawood_properties.yml

heawood_expected_chi=$(get_property $heawood_properties_path chromatic-number)
heawood_expected_diameter=$(get_property $heawood_properties_path diameter)
heawood_expected_girth=$(get_property $heawood_properties_path girth)
heawood_expected_order=$(get_property $heawood_properties_path order)
heawood_expected_size=$(get_property $heawood_properties_path size)
heawood_expected_maxdeg=$(get_property $heawood_properties_path max-degree)

heawood_gv_computed_chi=$(gv_chromatic $heawood_gv_path)
heawood_gv_computed_order=$(gv_order $heawood_gv_path)
heawood_gv_computed_size=$(gv_size $heawood_gv_path)
heawood_gv_computed_maxdeg=$(gv_maxdeg $heawood_gv_path)

heawood_g6_computed_diameter=$(g6_diameter $heawood_g6_path)
heawood_g6_computed_girth=$(g6_girth $heawood_g6_path)
heawood_g6_computed_order=$(g6_order $heawood_g6_path)
heawood_g6_computed_size=$(g6_size $heawood_g6_path)
