BDM_folder:=~/workspace/graphs-collection/External/BDM/Simple

four_folder:=./3

all: $(four_folder)

3.dimacs: $(BDM_folder)/graph3.g6
	listg -e $< | awk -f e2dimacs.awk > $@

$(four_folder): 3.dimacs
	mkdir -p $@;\
	cd $@;\
	awk -f dimacs_split.awk ../$<

