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

INC = -I../../hdrs -I../../libgendb -I../../libpkg -I../../libinst \
	-I../../libspmizones -I../../libadm

.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(INC) $(PATHS) $(WARN) $<

PKGLIBS = -L../../libinst -linst -L../../libpkg -lpkg -L../../libgendb -lgendb \
	-L../../libadm -ladm \
	-L$(CCSDIR)/lib -ll

BIN = pkgmk
OBJ = main.o mkpkgmap.o quit.o splpkgmap.o ../../version/version.o

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) $(PKGLIBS) $(LIBS) -o $@

install: all
	mkdir -p $(ROOT)$(BINDIR)
	$(INSTALL) -c -m 755 pkgmk $(ROOT)$(BINDIR)/pkgmk
	$(STRIP) $(ROOT)$(BINDIR)/pkgmk

clean:
	rm -f $(BIN) $(OBJ) core log

mrproper: clean

$(BIN): ../../libadm/libadm.a ../../libgendb/libgendb.a \
	../../libinst/libinst.a ../../libpkg/libpkg.a

main.o: main.c ../../hdrs/pkgstrct.h ../../hdrs/pkgdev.h \
  ../../hdrs/pkginfo.h ../../hdrs/pkglocs.h \
  ../../libspmizones/spmizones_api.h ../../libpkg/pkglib.h \
  ../../libpkg/pkgerr.h ../../libpkg/keystore.h ../../libpkg/cfext.h \
  ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h
mkpkgmap.o: mkpkgmap.c ../../hdrs/pkgstrct.h ../../hdrs/pkginfo.h \
  ../../libpkg/pkglib.h ../../hdrs/pkgdev.h ../../libpkg/pkgerr.h \
  ../../libpkg/keystore.h ../../libpkg/cfext.h ../../hdrs/install.h \
  ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h
quit.o: quit.c ../../hdrs/pkgdev.h ../../libpkg/pkglib.h \
  ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h \
  ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h ../../hdrs/valtools.h \
  ../../hdrs/install.h
splpkgmap.o: splpkgmap.c ../../hdrs/pkgdev.h ../../hdrs/pkgstrct.h \
  ../../libpkg/pkglib.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h \
  ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h ../../hdrs/valtools.h \
  ../../hdrs/install.h ../../hdrs/libinst.h ../../libpkg/cfext.h
