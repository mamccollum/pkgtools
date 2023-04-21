SHELL = /bin/sh
VAR=/var
CFLAGS = -O
LDFLAGS=-static
CCSLDFLAGS=-static
CPPFLAGS=-D_GNU_SOURCE -std=c89
STRIP=strip -s -R .comment -R .note
LNS = ln -s

# Where to place binaries.
BINDIR=$(PREFIX)/bin
# Where to place superuser-only binaries. This may be
# the same place as the binary directory.
SBINDIR=$(PREFIX)/sbin
# Where to place configuration files.
ETCDIR=/etc
# Where to place (read-only) helper files.
SADMDIR=$(PREFIX)/sadm
# Where to place the database of installed packages.
VSADMDIR=$(VAR)/sadm
# Where to place the manual pages.
MANDIR=$(PREFIX)/share/man
### configure results
MAKE = gmake
CC = gcc
LD = ld
AR = ar
RANLIB = ranlib
YACC = bison -y
LEX = flex
INSTALL = install
PREFIX = /usr
CCSDIR = /home/hex7c/code/pkgtools/src/ccs
### end configure results

PATHS = \
	-DSHELL='"$(SHELL)"' \
	-DETCDIR='"$(ETCDIR)"' \
	-DBINDIR='"$(BINDIR)"' \
	-DSBINDIR='"$(SBINDIR)"' \
	-DSADMDIR='"$(SADMDIR)"' \
	-DVSADMDIR='"$(VSADMDIR)"' \
	-DVSADMREL='"$(VSADMDIR:/%=%)"'

LDFLAGS = $(CCSLDFLAGS)

YOBJ = y1.o y2.o y3.o y4.o y5.o getopt.o

LOBJ = libmai.o libzer.o

.c.o: ; $(CC) -c $(CFLAGS) $(CPPFLAGS) $(WARN) -DPARSER='"$(LIBDIR)/yaccpar"' $<

# removed yacc from all
all: liby.a

yacc: $(YOBJ)
	$(CC) $(LDFLAGS) $(YOBJ) $(LIBS) -o yacc

liby.a: $(LOBJ)
	$(AR) -rv liby.a $(LOBJ)
	$(RANLIB) $@
	mkdir -p ../ccs/lib/
	cp $@ ../ccs/lib/$@

install: all
	@echo "Not installing yacc."
	#test -d $(ROOT)$(BINDIR) || mkdir -p $(ROOT)$(BINDIR)
	#test -d $(ROOT)$(LIBDIR) || mkdir -p $(ROOT)$(LIBDIR)
	#$(INSTALL) -c -m 755 yacc $(ROOT)$(BINDIR)/yacc
	#$(STRIP) $(ROOT)$(BINDIR)/yacc
	#$(INSTALL) -c -m 644 yaccpar $(ROOT)$(LIBDIR)/yaccpar
	#$(INSTALL) -c -m 644 liby.a $(ROOT)$(LIBDIR)/liby.a
	#test -d $(ROOT)$(MANDIR)/man1 || mkdir -p $(ROOT)$(MANDIR)/man1
	#$(INSTALL) -c -m 644 yacc.1 $(ROOT)$(MANDIR)/man1/yacc.1

clean:
	rm -f yacc liby.a $(YOBJ) $(LOBJ) y.tab.[ch] core log *~

mrproper: clean

libmai.o: libmai.c
libzer.o: libzer.c
y1.o: y1.c dextern
y2.o: y2.c dextern sgs.h
y3.o: y3.c dextern
y4.o: y4.c dextern
