#
# Makefile for the different libgemma
#

SHELL = /bin/sh
SUBDIRS = 

srcdir = .
top_srcdir = ..
subdir = libgemma

default: all

include $(top_srcdir)/CONFIGVARS
include $(top_srcdir)/RULES
include $(top_srcdir)/PHONY

all-here: libs

# default overwrites

# default definitions
GENFILES = .lib* libgem*.a

ALL_LIBS = normal

ifeq ($(WITH_020_LIB),yes)
ALL_LIBS += normal020
endif

ifeq ($(WITH_V4E_LIB),yes)
ALL_LIBS += normalv4e
endif

libs: $(ALL_LIBS)

normal:
	$(MAKE) libgemma.a TARGET=""

normal020:
	$(MAKE) libgemma020.a TARGET="020"

normalv4e:
	$(MAKE) libgemmav4e.a TARGET="v4e"

mt:
	$(MAKE) libgemma_mt.a TARGET="_mt"

mt020:
	$(MAKE) libgemma020_mt.a TARGET="020_mt"

libgemma$(TARGET).a: objs
	$(AM_V_at)$(RM) $@
	$(AM_V_AR)$(AR) rc $@ \
		$(shell for file in `cat .lib$(TARGET)/objs` ; \
			do echo .lib$(TARGET)/$$file ; done)
	$(AM_V_RANLIB)$(RANLIB) $@

objs: .lib$(TARGET)
	cd .lib$(TARGET); $(MAKE)
.PHONY: objs

.lib$(TARGET): Makefile.objs
	$(AM_V_at)$(MKDIR) -p $@
	$(AM_V_at)$(CP) Makefile.objs $@/Makefile

clean::
	rm -rf .lib*
