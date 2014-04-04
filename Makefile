pangraph=$(HOME)/workspace/pangraph/src/pangraph

src_dir=$(HOME)/workspace/graphs-collection/src

dodecahedral_graphs=$(src_dir)/Platonic/Dodecahedral/dodecahedral.gexf\
                    $(src_dir)/Platonic/Dodecahedral/dodecahedral.net

icosahedral_graphs=$(src_dir)/Platonic/Icosahedral/icosahedral.gexf\
                   $(src_dir)/Platonic/Icosahedral/icosahedral.net

all: platonic_graphs

platonic_graphs: $(dodecahedral_graphs) $(icosahedral_graphs)

$(src_dir)/Platonic/Dodecahedral/dodecahedral.gexf:
	$(pangraph) --type gexf --name dodecahedral -o $@

$(src_dir)/Platonic/Dodecahedral/dodecahedral.net:
	$(pangraph) --type pajek --name dodecahedral -o $@

$(src_dir)/Platonic/Icosahedral/icosahedral.gexf:
	$(pangraph) --type gexf --name icosahedral -o $@

$(src_dir)/Platonic/Icosahedral/icosahedral.net:
	$(pangraph) --type pajek --name icosahedral -o $@

clean:
	rm -f $(dodecahedral_graphs)
	rm -f $(icosahedral_graphs)
