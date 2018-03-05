ACLOCAL_AMFLAGS = -I m4
AM_MAKEFLAGS = --no-print-directory
AM_CFLAGS = \
	-DPACKAGE_DATA_DIR=\"$(pkgdatadir)/\" \
	-DPACKAGE_BIN_DIR=\"$(bindir)\" \
	-DPACKAGE_LIB_DIR=\"$(libdir)\" \
	-I$(top_srcdir)/src/lib/ \
	@EFL_CFLAGS@ \
	@E_CFLAGS@ \
	@PULSE_CFLAGS@

src_module_module_la_CFLAGS= $(AM_CFLAGS)

MAINTAINERCLEANFILES = \
	aclocal.m4 \
	compile \
	config.guess \
	config.h.in \
	config.sub \
	configure \
	depcomp \
	install-sh \
	ltmain.sh \
	Makefile.in \
	missing \
	mkinstalldirs
EXTRA_DIST =

lib_LTLIBRARIES = \
	src/lib/libepulse.la

src_lib_libepulse_la_SOURCES = \
	src/lib/common.c \
	src/lib/common.h \
	src/lib/epulse_ml.c \
	src/lib/epulse.c \
	src/lib/epulse.h

src_lib_libepulse_la_LIBADD = @EFL_LIBS@ @PULSE_LIBS@
src_lib_libepulse_la_LDFLAGS = -no-undefined -avoid-version
src_lib_libepulse_la_LIBTOOLFLAGS = --tag=disable-static

bin_PROGRAMS = \
	src/bin/epulse

src_bin_epulse_LDADD = \
	$(top_builddir)/src/lib/libepulse.la \
	@EFL_LIBS@ \
	@PULSE_LIBS@

src_bin_epulse_SOURCES = \
	src/bin/main_window.h \
	src/bin/main_window.c \
	src/bin/playbacks_view.h \
	src/bin/playbacks_view.c \
	src/bin/sinks_view.h \
	src/bin/sinks_view.c \
	src/bin/sources_view.h \
	src/bin/sources_view.c \
	src/bin/main.c

moduledir = $(pkgdir)/$(MODULE_ARCH)
module_LTLIBRARIES = src/module/module.la

src_module_module_la_SOURCES = \
	src/module/e_mod_main.c \
	src/module/e_mod_main.h

src_module_module_la_LIBADD = \
	$(top_builddir)/src/lib/libepulse.la \
	@EFL_LIBS@ \
	@E_LIBS@ \
	@PULSE_LIBS@

src_module_module_la_LDFLAGS = -module -avoid-version

src_module_module_la_CFLAGS += @ENOTIFY_CFLAGS@
src_module_module_la_LIBADD += @ENOTIFY_LIBS@

SUBDIRS = po

include Makefile_Theme.am

iconsdir = $(datadir)/icons
icons_DATA = data/icons/epulse.png

desktopdir = $(datadir)/applications
desktop_DATA = data/xml/epulse.desktop

EXTRA_DIST += \
	$(icons_DATA) \
	$(desktop_DATA) \
	mksnapshot \
	mksubmit \
	autogen.sh

.PHONY: update-potfiles
update-potfiles:
	cd $(top_srcdir) && \
	find -type f -name '*.[ch]' | sort > po/POTFILES.in


clean-local:
