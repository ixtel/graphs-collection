output_folder:=./output
src_folder:=~/workspace/graphs-collection/External/BDM/Simple

g6sources:=$(src_folder)/graph2.g6\
           $(src_folder)/graph3.g6\
           $(src_folder)/graph4.g6\
           $(src_folder)/graph5.g6\
           $(src_folder)/graph6.g6\
           $(src_folder)/graph7.g6\
           $(src_folder)/graph8.g6\
           $(src_folder)/graph9.g6\

dimacs_file_names:=$(subst g6,dimacs,$(subst graph,,$(notdir $(g6sources))))
dimacs_folder_names:=$(subst .,_,$(dimacs_file_names))

dimacs_file_paths:=$(addprefix $(output_folder)/, $(dimacs_file_names))
dimacs_folder_paths:=$(addprefix $(output_folder)/, $(dimacs_folder_names))

gv_file_names:=$(subst g6,gv,$(subst graph,,$(notdir $(g6sources))))
gv_folder_names:=$(subst .,_,$(gv_file_names))

gv_file_paths:=$(addprefix $(output_folder)/, $(gv_file_names))
gv_folder_paths:=$(addprefix $(output_folder)/, $(gv_folder_names))

.PHONY: all clean dimacs

all: dimacs gv

dimacs: $(dimacs_folder_paths)

gv: $(gv_folder_paths)

clean: clean_dimacs clean_gv

clean_dimacs:
	rm -rf $(dimacs_file_paths)
	rm -rf $(dimacs_folder_paths)

clean_gv:
	rm -rf $(gv_file_paths)
	rm -rf $(gv_folder_paths)

$(dimacs_file_paths): $(output_folder)/%.dimacs: $(src_folder)/graph%.g6
	listg -e $< | awk -f e2dimacs.awk > $@

$(dimacs_folder_paths): $(output_folder)/%_dimacs: $(output_folder)/%.dimacs
	mkdir -p $@;\
	cd $@;\
	awk -f dimacs_split.awk ../../$<

$(gv_file_paths): $(output_folder)/%.gv: $(src_folder)/graph%.g6
	listg -e $< | awk -f e2gv.awk > $@

$(gv_folder_paths): $(output_folder)/%_gv: $(output_folder)/%.gv
	mkdir -p $@;\
	cd $@;\
	awk -f gv_split.awk ../../$<
