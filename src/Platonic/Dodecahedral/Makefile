pangraph=$(HOME)/workspace/pangraph/src/pangraph

src_dir=$(HOME)/workspace/graphs-collection/src

dodecahedral_graphs=dodecahedral.gexf\
                    dodecahedral.net

all: platonic_graphs

platonic_graphs: $(dodecahedral_graphs)

dodecahedral.gexf:
	$(pangraph) --type gexf --name dodecahedral -o $@

dodecahedral.net:
	$(pangraph) --type pajek --name dodecahedral -o $@

clean:
	rm -f $(dodecahedral_graphs)
