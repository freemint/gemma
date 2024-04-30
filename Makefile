#
# Makefile for gemma, a GEM library
#

SHELL = /bin/sh
SUBDIRS = libgemma kernel32 documentation libslb src configtool test
BUILDLIB=gemma

srcdir = .
top_srcdir = .
subdir = 
top_builddir = .

libdir = ${PREFIX}/lib
slblibdir = ${PREFIX}/../mint/slb
includedir = ${PREFIX}/include
slbincludedir = ${includedir}/slb

default: all

include $(top_srcdir)/CONFIGVARS
include $(top_srcdir)/RULES
include $(top_srcdir)/PHONY
include $(srcdir)/VERSION

all-here:

dist: distdir
	-chmod -R a+r $(distdir) 
	GZIP=$(GZIP) $(TAR) chzf $(distdir).tar.gz $(distdir)
	-rm -rf $(distdir)

# default overwrites

# default definitions


install:
	install -m 755 -d $(DESTDIR)${libdir}
	install -m 755 -d $(DESTDIR)${slblibdir}
	install -m 755 -d $(DESTDIR)${slbincludedir}
	install -m 644 include/slb/gemma.h $(DESTDIR)${slbincludedir}
	install -m 644 include/slb/gemma-struct.h $(DESTDIR)${slbincludedir}
	install -m 644 include/slb/kernel.h $(DESTDIR)${slbincludedir}
	install -m 644 libgemma/libgemma.a $(DESTDIR)${libdir}
ifeq ($(WITH_020_LIB),yes)
	install -m 755 -d $(DESTDIR)${libdir}/m68020-60
	install -m 644 libgemma/libgemma020.a $(DESTDIR)${libdir}/m68020-60/libgemma.a
endif
ifeq ($(WITH_V4E_LIB),yes)
	install -m 755 -d $(DESTDIR)${libdir}/m5475
	install -m 644 libgemma/libgemmav4e.a $(DESTDIR)${libdir}/m5475/libgemma.a
endif
	install -m 755 src/gemma32.slb $(DESTDIR)${slblibdir}
ifeq ($(WITH_V4E_LIB),yes)
	install -m 755 -d $(DESTDIR)${slblibdir}/m5475
	install -m 755 src/gemma32v4e.slb $(DESTDIR)${slblibdir}/m5475/gemma32.slb
endif
ifeq ($(WITH_020_LIB),yes)
	install -m 755 -d $(DESTDIR)${slblibdir}/m68020-60
	install -m 755 src/gemma32020.slb $(DESTDIR)${slblibdir}/m68020-60/gemma32.slb
endif
	install -m 755 kernel32/.lib/kernel32.slb $(DESTDIR)${slblibdir}
ifeq ($(WITH_020_LIB),yes)
	install -m 755 kernel32/.lib020/kernel32.slb $(DESTDIR)${slblibdir}/m68020-60
endif
ifeq ($(WITH_V4E_LIB),yes)
	install -m 755 kernel32/.libv4e/kernel32.slb $(DESTDIR)${slblibdir}/m5475
endif

uninstall:
	rm -f $(DESTDIR)${slbincludedir}/gemma-struct.h
	rm -f $(DESTDIR)${slbincludedir}/gemma.h
	rm -f $(DESTDIR)${slbincludedir}/kernel.h
	rm -f $(DESTDIR)${libdir}/libgemma.a
	rm -f $(DESTDIR)${libdir}/m68020-60/libgemma.a
	rm -f $(DESTDIR)${libdir}/m5475/libgemma.a
	rm -f $(DESTDIR)${slblibdir}/gemma32.slb
	rm -f $(DESTDIR)${slblibdir}/m68020-60/gemma32.slb
	rm -f $(DESTDIR)${slblibdir}/m5475/gemma32.slb
	rm -f $(DESTDIR)${slblibdir}/kernel32.slb
	rm -f $(DESTDIR)${slblibdir}/m68020-60/kernel32.slb
	rm -f $(DESTDIR)${slblibdir}/m5475/kernel32.slb
