get_property() {
  property=$2
  s="/$property:/"'{ print $2  }'
  echo `cat $1 | awk -F": " "$s"`
}

gv_chromatic() { chromatic $1; }

gv_order() { gc -n $1 | awk '{ print $1 }'; }

gv_size() { gc -e $1 | awk '{ print $1 }'; }

gv_maxdeg() { cat $1 | gvpr -fmaxdeg | sed -n 's/max degree = \([0-9]*\).*/\1/p'; }

g6_girth() { cat $1 | girth.py; }

g6_diameter() { cat $1 | diameter.py; }

g6_order() { cat $1 | listg -y | gc -n | awk '{ print $1 }'; }

g6_size() { cat $1 | listg -y | gc -e | awk '{ print $1 }'; }
