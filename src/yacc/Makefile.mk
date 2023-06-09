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
