all:

install: all
	test -d $(ROOT)$(MANDIR)/man1 || mkdir -p $(ROOT)$(MANDIR)/man1
	$(INSTALL) -c -m 644 ckdate.1 $(ROOT)$(MANDIR)/man1/ckdate.1
	$(INSTALL) -c -m 644 ckgid.1 $(ROOT)$(MANDIR)/man1/ckgid.1
	$(INSTALL) -c -m 644 ckint.1 $(ROOT)$(MANDIR)/man1/ckint.1
	$(INSTALL) -c -m 644 ckitem.1 $(ROOT)$(MANDIR)/man1/ckitem.1
	$(INSTALL) -c -m 644 ckkeywd.1 $(ROOT)$(MANDIR)/man1/ckkeywd.1
	$(INSTALL) -c -m 644 ckpath.1 $(ROOT)$(MANDIR)/man1/ckpath.1
	$(INSTALL) -c -m 644 ckrange.1 $(ROOT)$(MANDIR)/man1/ckrange.1
	$(INSTALL) -c -m 644 ckstr.1 $(ROOT)$(MANDIR)/man1/ckstr.1
	$(INSTALL) -c -m 644 cktime.1 $(ROOT)$(MANDIR)/man1/cktime.1
	$(INSTALL) -c -m 644 ckuid.1 $(ROOT)$(MANDIR)/man1/ckuid.1
	$(INSTALL) -c -m 644 ckyorn.1 $(ROOT)$(MANDIR)/man1/ckyorn.1
	$(INSTALL) -c -m 644 dispgid.1 $(ROOT)$(MANDIR)/man1/dispgid.1
	$(INSTALL) -c -m 644 dispuid.1 $(ROOT)$(MANDIR)/man1/dispuid.1
	$(INSTALL) -c -m 644 pkginfo.1 $(ROOT)$(MANDIR)/man1/pkginfo.1
	$(INSTALL) -c -m 644 pkgmk.1 $(ROOT)$(MANDIR)/man1/pkgmk.1
	$(INSTALL) -c -m 644 pkgparam.1 $(ROOT)$(MANDIR)/man1/pkgparam.1
	$(INSTALL) -c -m 644 pkgproto.1 $(ROOT)$(MANDIR)/man1/pkgproto.1
	$(INSTALL) -c -m 644 pkgtrans.1 $(ROOT)$(MANDIR)/man1/pkgtrans.1
	test -d $(ROOT)$(MANDIR)/man8 || mkdir -p $(ROOT)$(MANDIR)/man8
	$(INSTALL) -c -m 644 installf.8 $(ROOT)$(MANDIR)/man8/installf.8
	$(INSTALL) -c -m 644 pkgadd.8 $(ROOT)$(MANDIR)/man8/pkgadd.8
	$(INSTALL) -c -m 644 pkgask.8 $(ROOT)$(MANDIR)/man8/pkgask.8
	$(INSTALL) -c -m 644 pkgchk.8 $(ROOT)$(MANDIR)/man8/pkgchk.8
	$(INSTALL) -c -m 644 pkgrm.8 $(ROOT)$(MANDIR)/man8/pkgrm.8
	$(INSTALL) -c -m 644 removef.8 $(ROOT)$(MANDIR)/man8/removef.8
	test -d $(ROOT)$(MANDIR)/man5 || mkdir -p $(ROOT)$(MANDIR)/man5
	$(INSTALL) -c -m 644 depend.5 $(ROOT)$(MANDIR)/man5/depend.5
	$(INSTALL) -c -m 644 pkginfo.5 $(ROOT)$(MANDIR)/man5/pkginfo.5
	$(INSTALL) -c -m 644 pkgmap.5 $(ROOT)$(MANDIR)/man5/pkgmap.5
	$(INSTALL) -c -m 644 prototype.5 $(ROOT)$(MANDIR)/man5/prototype.5

clean:

mrproper: clean
