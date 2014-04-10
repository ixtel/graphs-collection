%.gexf:
	$(pangraph) --type gexf $(OPTIONS) -o $@

%.net:
	$(pangraph) --type pajek $(OPTIONS) -o $@

