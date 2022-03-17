GARFIELD_HOME = /usr/local/garfield
OBJDIR = $(GARFIELD_HOME)/Object
SRCDIR = $(GARFIELD_HOME)/Source
INCDIR = $(GARFIELD_HOME)/Include
HEEDDIR = $(GARFIELD_HOME)/Heed
LIBDIR = $(GARFIELD_HOME)/Library

# Compiler flags
CXX = `root-config --cxx`
CFLAGS = `root-config --cflags` \
        -I$(INCDIR) -I$(HEEDDIR)

# Debug flags
# CFLAGS += -g

LDFLAGS = -L$(LIBDIR) -lGarfield
LDFLAGS += -L/usr/local/lib -lgfortran
LDFLAGS += `root-config --glibs` -lGeom

triple: avalanche.cc
	$(CXX) $(CFLAGS) -c avalanche.cc
	$(CXX) $(CFLAGS) -o triple avalanche.o $(LDFLAGS)
	rm avalanche.o
