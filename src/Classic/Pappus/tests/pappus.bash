pappus_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Pappus
pappus_gv_path=$pappus_dir/pappus.gv
pappus_g6_path=$pappus_dir/pappus.graph6
pappus_properties_path=$pappus_dir/pappus_properties.yml

pappus_expected_chi=$(get_property $pappus_properties_path chromatic-number)
pappus_expected_diameter=$(get_property $pappus_properties_path diameter)
pappus_expected_girth=$(get_property $pappus_properties_path girth)
pappus_expected_order=$(get_property $pappus_properties_path order)
pappus_expected_size=$(get_property $pappus_properties_path size)
pappus_expected_maxdeg=$(get_property $pappus_properties_path max-degree)

pappus_gv_computed_chi=$(gv_chromatic $pappus_gv_path)
pappus_gv_computed_order=$(gv_order $pappus_gv_path)
pappus_gv_computed_size=$(gv_size $pappus_gv_path)
pappus_gv_computed_maxdeg=$(gv_maxdeg $pappus_gv_path)

pappus_g6_computed_diameter=$(g6_diameter $pappus_g6_path)
pappus_g6_computed_girth=$(g6_girth $pappus_g6_path)
pappus_g6_computed_order=$(g6_order $pappus_g6_path)
pappus_g6_computed_size=$(g6_size $pappus_g6_path)
