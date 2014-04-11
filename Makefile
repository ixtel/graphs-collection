export

pangraph=$(HOME)/workspace/pangraph/src/pangraph

classic := src/Classic/Chvatal\
           src/Classic/Desargues\
           src/Classic/Frucht\
           src/Classic/Heawood\
           src/Classic/Petersen\
           src/Classic/Tutte\

platonic := src/Platonic/Dodecahedral\
            src/Platonic/Icosahedral\
            src/Platonic/Octahedral\
            src/Platonic/Tetrahedral

.PHONY: all check $(platonic) $(classic)

all: $(platonic) $(classic)

check:
	$(MAKE) --directory=./tests check

$(platonic) $(classic):
	$(MAKE) --directory=$@ $(TARGET)
