
# makefile for all BLITZ tools
#
# Harry Porter - 5 September 2007
# Dan Colish - 2 October 2010
#
# To compile all the Blitz Tools, type 'make' with this 'makefile' file in a
# directory containing the source files for all the Blitz.  The Unix "make"
# utility will execute all the necessary compiles as needed, based
# on files' most-recent-update times.
#
# Here is a list of the executables that should be produced:
#
#    asm
#    dumpObj
#    lddd
#    blitz
#    kpl
#    diskUtil
#    check
#    endian
#    hexdump
# 

#########################################################################
#
# The following options are used when compiling for Intel-based systems.
#
# These work for the following systems.  For these, no change is
# necessary.  For other systems, this file must be edited; read on.
#
#   Apple Mac with Intel Processors
#
#   Windows (using Cygwin, see www.cygwin.com).
#
#   Debian/Ubuntu Linux 2.6.20; i686; using GCC 4.1.2, although warnings
#   about multi-byte character constants get displayed.
#
#   FreeBSD 5.5 on Intel hardware.
#
#   Ubuntu 7.04, with the multi-char warnings.
#
#   cc (GCC) 4.0.3 (Ubuntu 4.0.3-1ubuntu5), with the multi-char warnings.
#

CC=cc
CXX=g++
COMMONFLAGS= -g -DBLITZ_HOST_IS_LITTLE_ENDIAN -m32 -Werror -Wall
CFLAGS+= -lm $(COMMONFLAGS)
CXXFLAGS+= $(COMMONFLAGS)
SRCS=$(shell echo *.c | sed 's/\.c*//g')
OBJ=$(patsubst %.cc, %.o, $(shell echo *.cc))

all: $(SRCS) kpl

kpl: $(OBJ)
	$(CXX) $(CXXFLAGS) $+ -o $@

clean: 
	rm -rf *.o *.dSYM $(SRCS) kpl

.SUFFIXES: .o .cc .c