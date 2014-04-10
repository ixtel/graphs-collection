icosahedral_graphs=icosahedral.gexf\
                    icosahedral.net

all: $(icosahedral_graphs)

OPTIONS=--name icosahedral

%.gexf:
	$(pangraph) --type gexf $(OPTIONS) -o $@

%.net:
	$(pangraph) --type pajek $(OPTIONS) -o $@

clean:
	rm -f $(icosahedral_graphs)
