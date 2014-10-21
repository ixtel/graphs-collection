tutte_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Tutte
tutte_gv_path=$tutte_dir/tutte.gv
tutte_g6_path=$tutte_dir/tutte.graph6
tutte_properties_path=$tutte_dir/tutte_properties.yml

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
