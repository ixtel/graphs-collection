dodecahedral_graphs=dodecahedral.gexf\
                    dodecahedral.net

all: $(dodecahedral_graphs)

OPTIONS=--name dodecahedral

%.gexf:
	$(pangraph) --type gexf $(OPTIONS) -o $@

%.net:
	$(pangraph) --type pajek $(OPTIONS) -o $@

clean:
	rm -f $(dodecahedral_graphs)
