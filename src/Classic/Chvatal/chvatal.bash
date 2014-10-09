chvatal_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Chvatal
chvatal_gv_path=$chvatal_dir/chvatal.gv
chvatal_properties_path=$chvatal_dir/chvatal_properties.yml

get_property() {
  property=$1
  s="/$property:/"'{ print $2  }'
  echo `cat $chvatal_properties_path | awk -F": " "$s"`
}

chvatal_expected_chi=$(get_property chromatic-number)
chvatal_expected_order=$(get_property order)
chvatal_expected_size=$(get_property size)
chvatal_expected_maxdeg=$(get_property max-degree)

chvatal_gv_computed_chi=`chromatic $chvatal_gv_path`
chvatal_gv_computed_order=`gc -n $chvatal_gv_path | awk '{ print $1 }'`
chvatal_gv_computed_size=`gc -e $chvatal_gv_path | awk '{ print $1 }'`
chvatal_gv_computed_maxdeg=`cat $chvatal_gv_path | gvpr -fmaxdeg | sed -n 's/max degree = \([0-9]*\).*/\1/p'`
