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
	-I../../libspmizones -I../../libadm -I../pkgadm

.c.o:
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(INC) $(PATHS) $(WARN) $<

PKGLIBS = -L../../libinst -linst -L../../libpkg -lpkg -L../../libgendb -lgendb \
	-L../../libadm -ladm \
	-L$(CCSDIR)/lib -ll

BIN = pkginstall
OBJ = backup.o check.o cppath.o dockspace.o getinst.o instvol.o main.o \
	merginfo.o pkgenv.o pkgvolume.o predepend.o quit.o reqexec.o \
	sortmap.o special.o ../../version/version.o

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) $(PKGLIBS) $(LIBS) -o $@

install: all
	mkdir -p $(ROOT)$(SADMDIR)/install/bin
	$(INSTALL) -c -m 755 pkginstall $(ROOT)$(SADMDIR)/install/bin/pkginstall
	$(STRIP) $(ROOT)$(SADMDIR)/install/bin/pkginstall

clean:
	rm -f $(BIN) $(OBJ) core log

mrproper: clean

$(BIN): ../../libadm/libadm.a ../../libgendb/libgendb.a \
	../../libinst/libinst.a ../../libpkg/libpkg.a

backup.o: backup.c ../../libpkg/pkglib.h ../../hdrs/pkgdev.h \
  ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h
check.o: check.c ../../hdrs/pkgstrct.h ../../hdrs/pkglocs.h \
  ../../hdrs/install.h ../../libpkg/pkglib.h ../../hdrs/pkgdev.h \
  ../../libpkg/pkgerr.h ../../libpkg/keystore.h ../../libpkg/cfext.h \
  ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h \
  ../../hdrs/pkginfo.h ../../hdrs/valtools.h ../../hdrs/install.h \
  ../../hdrs/libinst.h ../../libpkg/cfext.h pkginstall.h
cppath.o: cppath.c ../../hdrs/pkglocs.h ../../libpkg/pkglib.h \
  ../../hdrs/pkgdev.h ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h \
  ../../libpkg/keystore.h ../../libpkg/cfext.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h ../../hdrs/install.h ../../hdrs/messages.h \
  pkginstall.h
dockspace.o: dockspace.c ../../hdrs/pkgstrct.h ../../hdrs/install.h \
  ../../libpkg/pkglib.h ../../hdrs/pkgdev.h ../../libpkg/pkgerr.h \
  ../../libpkg/keystore.h ../../libpkg/cfext.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h pkginstall.h
getinst.o: getinst.c ../../hdrs/valtools.h ../../hdrs/pkginfo.h \
  ../../hdrs/install.h ../../hdrs/pkgstrct.h ../../libpkg/pkglib.h \
  ../../hdrs/pkgdev.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h \
  ../../hdrs/sys/dklabel.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h pkginstall.h ../../hdrs/messages.h
instvol.o: instvol.c ../../hdrs/pkgstrct.h ../../hdrs/pkgdev.h \
  ../../hdrs/pkglocs.h ../../hdrs/archives.h \
  ../../libspmizones/spmizones_api.h ../../libpkg/pkglib.h \
  ../../libpkg/pkgerr.h ../../libpkg/keystore.h ../../libpkg/cfext.h \
  ../../libpkg/pkgweb.h ../../libpkg/pkglocale.h ../pkgadm/pkgadm.h \
  ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libgendb/genericdb.h ../../hdrs/libinst.h ../../hdrs/pkginfo.h \
  ../../libpkg/cfext.h ../../hdrs/install.h ../../hdrs/install.h \
  ../../hdrs/libinst.h ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h \
  ../../hdrs/sys/dklabel.h ../../hdrs/valtools.h ../../hdrs/dryrun.h \
  ../../hdrs/messages.h pkginstall.h
main.o: main.c ../../hdrs/pkgstrct.h ../../hdrs/pkginfo.h \
  ../../hdrs/pkgdev.h ../../hdrs/pkglocs.h \
  ../../libspmizones/spmizones_api.h ../../libpkg/pkglib.h \
  ../../libpkg/pkgerr.h ../../libpkg/keystore.h ../../libpkg/cfext.h \
  ../../libpkg/pkgweb.h ../../libpkg/pkglocale.h ../../hdrs/install.h \
  ../../hdrs/libinst.h ../../libpkg/cfext.h ../../hdrs/install.h \
  ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h \
  ../../hdrs/valtools.h ../../hdrs/dryrun.h ../../hdrs/messages.h \
  pkginstall.h
merginfo.o: merginfo.c ../../libpkg/pkglib.h ../../hdrs/pkgdev.h \
  ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h ../../hdrs/install.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/pkglib.h ../../libpkg/cfext.h pkginstall.h \
  ../../hdrs/messages.h
pkgenv.o: pkgenv.c ../../hdrs/pkgstrct.h ../../libpkg/pkglib.h \
  ../../hdrs/pkgdev.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h ../../hdrs/install.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h
pkgvolume.o: pkgvolume.c ../../hdrs/pkgdev.h ../../libpkg/pkglib.h \
  ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h \
  ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h ../../hdrs/valtools.h \
  ../../hdrs/install.h ../../hdrs/libinst.h ../../libpkg/cfext.h
predepend.o: predepend.c ../../hdrs/pkglocs.h ../../libpkg/pkglib.h \
  ../../hdrs/pkgdev.h ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h \
  ../../libpkg/keystore.h ../../libpkg/cfext.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h \
  ../../hdrs/valtools.h ../../hdrs/install.h
quit.o: quit.c ../../hdrs/pkgdev.h ../../hdrs/pkglocs.h \
  ../../libpkg/pkglib.h ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h \
  ../../libpkg/keystore.h ../../libpkg/cfext.h ../../hdrs/install.h \
  ../../hdrs/dryrun.h ../../libpkg/cfext.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h pkginstall.h ../../hdrs/messages.h
reqexec.o: reqexec.c ../../libpkg/pkglib.h ../../hdrs/pkgdev.h \
  ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h ../../hdrs/install.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/pkginfo.h \
  ../../hdrs/valtools.h ../../hdrs/install.h ../../hdrs/libinst.h \
  ../../libpkg/cfext.h pkginstall.h ../../hdrs/messages.h
sortmap.o: sortmap.c ../../hdrs/pkgstrct.h ../../hdrs/pkglocs.h \
  ../../hdrs/install.h ../../libpkg/pkglib.h ../../hdrs/pkgdev.h \
  ../../libpkg/pkgerr.h ../../libpkg/keystore.h ../../libpkg/cfext.h \
  ../../hdrs/libadm.h ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h \
  ../../hdrs/pkginfo.h ../../hdrs/valtools.h ../../hdrs/install.h \
  ../../hdrs/libinst.h ../../libpkg/cfext.h
special.o: special.c ../../hdrs/pkgstrct.h ../../hdrs/pkginfo.h \
  ../../hdrs/pkgdev.h ../../hdrs/pkglocs.h ../../libpkg/pkglib.h \
  ../../libpkg/pkgerr.h ../../libpkg/keystore.h ../../libpkg/cfext.h \
  ../../libpkg/dbsql.h ../../libgendb/genericdb.h ../../hdrs/libadm.h \
  ../../hdrs/sys/vtoc.h ../../hdrs/sys/dklabel.h ../../hdrs/valtools.h \
  ../../hdrs/install.h ../../hdrs/libinst.h ../../libpkg/cfext.h \
  ../../hdrs/dryrun.h pkginstall.h ../../hdrs/messages.h
