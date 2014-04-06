dodecahedral_graphs=dodecahedral.gexf\
                    dodecahedral.net

all: platonic_graphs

platonic_graphs: $(dodecahedral_graphs)

OPTIONS=--name dodecahedral

%.gexf:
	$(pangraph) --type gexf $(OPTIONS) -o $@

%.net:
	$(pangraph) --type pajek $(OPTIONS) -o $@

clean:
	rm -f $(dodecahedral_graphs)
