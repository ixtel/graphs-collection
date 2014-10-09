chvatal_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Chvatal
chvatal_gv_path=$chvatal_dir/chvatal.gv
chvatal_g6_path=$chvatal_dir/chvatal.graph6
chvatal_properties_path=$chvatal_dir/chvatal_properties.yml

chvatal_expected_chi=$(get_property $chvatal_properties_path chromatic-number)
chvatal_expected_diameter=$(get_property $chvatal_properties_path diameter)
chvatal_expected_girth=$(get_property $chvatal_properties_path girth)
chvatal_expected_order=$(get_property $chvatal_properties_path order)
chvatal_expected_size=$(get_property $chvatal_properties_path size)
chvatal_expected_maxdeg=$(get_property $chvatal_properties_path max-degree)

chvatal_gv_computed_chi=$(gv_chromatic $chvatal_gv_path)
chvatal_gv_computed_order=$(gv_order $chvatal_gv_path)
chvatal_gv_computed_size=$(gv_size $chvatal_gv_path)
chvatal_gv_computed_maxdeg=$(gv_maxdeg $chvatal_gv_path)

chvatal_g6_computed_diameter=$(g6_diameter $chvatal_g6_path)
chvatal_g6_computed_girth=$(g6_girth $chvatal_g6_path)
