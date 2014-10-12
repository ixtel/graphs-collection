frucht_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Frucht
frucht_gv_path=$frucht_dir/frucht.gv
frucht_g6_path=$frucht_dir/frucht.graph6
frucht_properties_path=$frucht_dir/frucht_properties.yml

frucht_expected_chi=$(get_property $frucht_properties_path chromatic-number)
frucht_expected_diameter=$(get_property $frucht_properties_path diameter)
frucht_expected_girth=$(get_property $frucht_properties_path girth)
frucht_expected_order=$(get_property $frucht_properties_path order)
frucht_expected_size=$(get_property $frucht_properties_path size)
frucht_expected_maxdeg=$(get_property $frucht_properties_path max-degree)

frucht_gv_computed_chi=$(gv_chromatic $frucht_gv_path)
frucht_gv_computed_order=$(gv_order $frucht_gv_path)
frucht_gv_computed_size=$(gv_size $frucht_gv_path)
frucht_gv_computed_maxdeg=$(gv_maxdeg $frucht_gv_path)

frucht_g6_computed_diameter=$(g6_diameter $frucht_g6_path)
frucht_g6_computed_girth=$(g6_girth $frucht_g6_path)
frucht_g6_computed_order=$(g6_order $frucht_g6_path)
frucht_g6_computed_size=$(g6_size $frucht_g6_path)
