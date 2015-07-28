CXX = gcc
CXXFLAGS = -O0
LDFLAGS = -pg

ALL: Gauss Gauss.s

Gauss: Gauss.c
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

Gauss.s: Gauss.c
	$(CXX) $(CXXFLAGS) -S -o $@ $^

clean:
	rm -f *~ *.exe *.o Gauss Gauss.s

.PHONY: all clean
