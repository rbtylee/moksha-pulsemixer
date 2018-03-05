AC_PREREQ([2.69])
AC_INIT([epulse], [0.1], [moksha@bodhilinux.com])

AM_INIT_AUTOMAKE([-Wno-portability foreign subdir-objects])
AC_CONFIG_HEADER([config.h])
AC_CONFIG_MACRO_DIR([m4])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

PKG_PROG_PKG_CONFIG

AC_LANG_C

AC_USE_SYSTEM_EXTENSIONS
AC_PROG_CC
AC_PROG_CXX
AM_PROG_CC_C_O
AC_C___ATTRIBUTE__

AC_DISABLE_STATIC
AC_PROG_LIBTOOL

EFL_COMPILER_FLAG
EFL_COMPILER_FLAG([-Wall])
EFL_COMPILER_FLAG([-Wextra])
EFL_COMPILER_FLAG([-Wshadow])
EFL_COMPILER_FLAG([-fvisibility=hidden])

# Checks for programs.
EFL_WITH_BIN([edje], [edje-cc], [edje_cc])

AM_GNU_GETTEXT_VERSION([0.18])
AM_GNU_GETTEXT([external], [need-ngettext])

# Checks for libraries.
PKG_CHECK_MODULES([EFL],
	[
		elementary
		eet
		ecore
		ecore-file
	 ])

have_enotify=no
AM_CONDITIONAL([HAVE_ENOTIFY], [false])
AC_ARG_ENABLE([enotify],
  AC_HELP_STRING([--disable-enotify], [disable Enotify support @<:@default=detect@:>@]),
  [e_cv_want_enotify=$enableval],
  AC_CACHE_VAL([e_cv_want_enotify], [e_cv_want_enotify=yes])
)
if test "x$e_cv_want_enotify" != "xno" ; then
  PKG_CHECK_MODULES(ENOTIFY, [ edbus ],
  [
    AC_DEFINE_UNQUOTED([HAVE_ENOTIFY], [1], [enable enotify])
  ],
  [
    AC_MSG_NOTICE([enotify disabled])
    e_cv_want_enotify=no
  ])
else
  AC_MSG_NOTICE([enotify disabled])
    e_cv_want_enotify=no
fi
AC_SUBST([ENOTIFY_CFLAGS])
AC_SUBST([ENOTIFY_LIBS])

PKG_CHECK_MODULES(E, [enlightenment])

PKG_CHECK_MODULES([PULSE],
	[
		libpulse-simple
		libpulse
	 ])

release=$(pkg-config --variable=release enlightenment)
MODULE_ARCH="$host_os-$host_cpu-$release"
AC_SUBST(MODULE_ARCH)
AC_DEFINE_UNQUOTED(MODULE_ARCH, "$MODULE_ARCH", "Module architecture")
AC_DEFINE_UNQUOTED(MODULE_VERSION, "$VERSION", "Module version")

pkgdir=$(pkg-config --variable=modules enlightenment)/${PACKAGE}
AC_ARG_ENABLE(homedir-install,
  AS_HELP_STRING([--enable-homedir-install], [Install module in homedir]),
  [ pkgdir="${HOME}/.e/e/modules/${PACKAGE}" ]
)

AC_SUBST(pkgdir)

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([
po/Makefile.in \
Makefile
])
AC_OUTPUT([
data/xml/module.desktop
])


echo
echo
echo
echo "------------------------------------------------------------------------"
echo "$PACKAGE $VERSION"
echo "------------------------------------------------------------------------"
echo
echo "Configuration Options Summary:"
echo
echo
echo "  edje_cc..................: ${edje_cc}"
echo
echo "Compilation................: make (or gmake)"
echo "  CPPFLAGS.................: $CPPFLAGS"
echo "  CFLAGS...................: $CFLAGS"
echo "  LDFLAGS..................: $LDFLAGS"
echo
echo "Installation...............: make install (as root if needed, with 'su' or 'sudo')"
echo "  prefix...................: $prefix"
echo "  module...................: $pkgdir"
echo
