export

pangraph=$(HOME)/workspace/pangraph/src/pangraph

test_folder=./tests

classic := src/Classic/Chvatal\
           src/Classic/Desargues\
           src/Classic/Frucht\
           src/Classic/Heawood\
           src/Classic/Pappus\
           src/Classic/Petersen\
           src/Classic/Tutte\

platonic := src/Platonic/Dodecahedral\
            src/Platonic/Icosahedral\
            src/Platonic/Octahedral\
            src/Platonic/Tetrahedral

.PHONY: all check $(platonic) $(classic)

all: $(platonic) $(classic)

check:
	$(MAKE) --directory=$(test_folder) check

clean_test:
	$(MAKE) --directory=$(test_folder) clean

$(platonic) $(classic):
	$(MAKE) --directory=$@ $(TARGET)
