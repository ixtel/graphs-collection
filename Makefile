dodecahedral := src/Platonic/Dodecahedral

.PHONY: all $(dodecahedral)

all: $(dodecahedral)

$(dodecahedral):
	$(MAKE) --directory=$@ $(TARGET)

