bull_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Bull
bull_gv_path=$bull_dir/bull.gv
bull_properties_path=$bull_dir/bull_properties.yml

bull_expected_chi=$(get_property $bull_properties_path chromatic-number)
bull_expected_order=$(get_property $bull_properties_path order)
bull_expected_size=$(get_property $bull_properties_path size)
bull_expected_maxdeg=$(get_property $bull_properties_path max-degree)

bull_gv_computed_chi=$(gv_chromatic $bull_gv_path)
bull_gv_computed_order=$(gv_order $bull_gv_path)
bull_gv_computed_size=$(gv_size $bull_gv_path)
bull_gv_computed_maxdeg=$(gv_maxdeg $bull_gv_path)
