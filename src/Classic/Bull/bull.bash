bull_dir=$HOME/workspace/graphs/graphs-collection/src/Classic/Bull
bull_gv_path=$bull_dir/bull.gv
bull_properties_path=$bull_dir/bull_properties.yml

get_property() {
  property=$1
  s="/$property:/"'{ print $2  }'
  echo `cat $bull_properties_path | awk -F": " "$s"`
}

bull_expected_chi=$(get_property chromatic-number)
bull_expected_order=$(get_property order)
bull_expected_size=$(get_property size)
bull_expected_maxdeg=$(get_property max-degree)

bull_gv_computed_chi=`chromatic $bull_gv_path`
bull_gv_computed_order=`gc -n $bull_gv_path | awk '{ print $1 }'`
bull_gv_computed_size=`gc -e $bull_gv_path | awk '{ print $1 }'`
bull_gv_computed_maxdeg=`cat $bull_gv_path | gvpr -fmaxdeg | sed -n 's/max degree = \([0-9]*\).*/\1/p'`
