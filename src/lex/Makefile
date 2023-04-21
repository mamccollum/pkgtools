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

XOBJ = main.o sub1.o sub2.o sub3.o header.o wcio.o parser.o getopt.o lsearch.o

LOBJ = allprint.o libmain.o reject.o yyless.o yywrap.o \
	allprint_w.o reject_w.o yyless_w.o reject_e.o yyless_e.o

WFLAGS = -DEUC -DJLSLEX -DWOPTION
EFLAGS = -DEUC -DJLSLEX -DEOPTION

LEXDIR = $(LIBDIR)/lex

.c.o: ; $(CC) -c $(CFLAGS) $(CPPFLAGS) $(WARN) -DFORMPATH='"$(LEXDIR)"' $<

# removed lex from all
all: libl.a

lex: $(XOBJ)
	$(CC) $(LDFLAGS) $(XOBJ) $(LIBS) -o lex

libl.a: $(LOBJ)
	$(AR) -rv libl.a $(LOBJ)
	$(RANLIB) $@
	mkdir -p ../ccs/lib/
	cp $@ ../ccs/lib/$@

allprint_w.o: allprint.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(WARN) $(WFLAGS) allprint.c -o $@

reject_w.o: reject.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(WARN) $(WFLAGS) reject.c -o $@

yyless_w.o: yyless.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(WARN) $(WFLAGS) yyless.c -o $@

reject_e.o: reject.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(WARN) $(EFLAGS) reject.c -o $@

yyless_e.o: yyless.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $(WARN) $(EFLAGS) yyless.c -o $@

install: all
	@echo "Not installing lex."
	#test -d $(ROOT)$(BINDIR) || mkdir -p $(ROOT)$(BINDIR)
	#test -d $(ROOT)$(LEXDIR) || mkdir -p $(ROOT)$(LEXDIR)
	#$(INSTALL) -c -m 755 lex $(ROOT)$(BINDIR)/lex
	#$(STRIP) $(ROOT)$(BINDIR)/lex
	#$(INSTALL) -c -m 644 ncform $(ROOT)$(LEXDIR)/ncform
	#$(INSTALL) -c -m 644 nceucform $(ROOT)$(LEXDIR)/nceucform
	#$(INSTALL) -c -m 644 nrform $(ROOT)$(LEXDIR)/nrform
	#$(INSTALL) -c -m 644 libl.a $(ROOT)$(LIBDIR)/libl.a
	#test -d $(ROOT)$(MANDIR)/man1 || mkdir -p $(ROOT)$(MANDIR)/man1
	#$(INSTALL) -c -m 644 lex.1 $(ROOT)$(MANDIR)/man1/lex.1

clean:
	rm -f lex libl.a $(XOBJ) $(LOBJ) parser.c core log *~

mrproper: clean

allprint.o: allprint.c
header.o: header.c ldefs.c
ldefs.o: ldefs.c
libmain.o: libmain.c
main.o: main.c once.h ldefs.c sgs.h
reject.o: reject.c
sub1.o: sub1.c ldefs.c
sub2.o: sub2.c ldefs.c
sub3.o: sub3.c ldefs.c search.h
yyless.o: yyless.c
yywrap.o: yywrap.c
lsearch.o: search.h
