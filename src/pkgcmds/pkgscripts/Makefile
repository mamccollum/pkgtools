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

BIN = cmdexec
OBJ = cmdexec.o ../../version/version.o

PLAIN = i.CompCpio i.awk i.build i.sed r.awk r.build r.sed default

.SUFFIXES: .in

.in:
	sed 's:@BINREL@:$(BINDIR:/%=%):g; s:@SADMDIR@:$(SADMDIR):g; s:@VSADMDIR@:$(VSADMDIR:/%=%):g' $< >$@

all: $(BIN) $(PLAIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) $(OBJ) $(PKGLIBS) $(LIBS) -o $@

install: all
	mkdir -p $(ROOT)$(SADMDIR)/install/scripts
	$(INSTALL) -c cmdexec $(ROOT)$(SADMDIR)/install/scripts/cmdexec
	$(STRIP) $(ROOT)$(SADMDIR)/install/scripts/cmdexec
	$(INSTALL) -c -m 755 i.CompCpio $(ROOT)$(SADMDIR)/install/scripts/i.CompCpio
	$(INSTALL) -c -m 755 i.awk $(ROOT)$(SADMDIR)/install/scripts/i.awk
	$(INSTALL) -c -m 755 i.build $(ROOT)$(SADMDIR)/install/scripts/i.build
	$(INSTALL) -c -m 755 i.sed $(ROOT)$(SADMDIR)/install/scripts/i.sed
	$(INSTALL) -c -m 755 r.awk $(ROOT)$(SADMDIR)/install/scripts/r.awk
	$(INSTALL) -c -m 755 r.build $(ROOT)$(SADMDIR)/install/scripts/r.build
	$(INSTALL) -c -m 755 r.sed $(ROOT)$(SADMDIR)/install/scripts/r.sed
	mkdir -p $(ROOT)$(VSADMDIR)/install/admin
	mkdir -p $(ROOT)$(VSADMDIR)/install/logs
	$(INSTALL) -c -m 644 default $(ROOT)$(VSADMDIR)/install/admin/default
	mkdir -p $(ROOT)$(ETCDIR)
	test -f $(ROOT)$(ETCDIR)/device.tab && exit 0 || \
		$(INSTALL) -c -m 644 device.tab $(ROOT)$(ETCDIR)/device.tab

clean:
	rm -f $(BIN) $(OBJ) $(PLAIN) core log

mrproper: clean

$(BIN): ../../libadm/libadm.a ../../libgendb/libgendb.a \
	../../libinst/libinst.a ../../libpkg/libpkg.a

cmdexec.o: cmdexec.c ../../libpkg/pkglib.h ../../hdrs/pkgdev.h \
  ../../hdrs/pkgstrct.h ../../libpkg/pkgerr.h ../../libpkg/keystore.h \
  ../../libpkg/cfext.h
