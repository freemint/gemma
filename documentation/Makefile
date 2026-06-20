#
# Makefile for gemma documentation
#

SHELL = /bin/sh
SUBDIRS = 

srcdir = .
top_srcdir = ..
subdir = demo

default: all

include $(top_srcdir)/CONFIGVARS
include $(top_srcdir)/RULES
include $(top_srcdir)/PHONY

HCP ?= hcp

all-here: gemma.hyp

%.hyp: %.stg
	@if command -v $(HCP) >/dev/null 2>&1 && test -f $<; then \
		$(HCP) -o $@ $<; \
	else \
		echo "HCP not found, help file not compiled" >&2; \
	fi

install: all-here
	install -m 755 -d $(DESTDIR)/stguide
	@if test -f gemma.hyp; then \
		install -m 644 gemma.hyp $(DESTDIR)/stguide; \
		install -m 644 gemma.ref $(DESTDIR)/stguide; \
	else \
		echo "HCP not found, installing documentation source" >&2; \
		install -m 644 gemma.stg $(DESTDIR)/stguide; \
	fi

clean::
	$(RM) gemma.hyp gemma.ref

# default overwrites

# default definitions

