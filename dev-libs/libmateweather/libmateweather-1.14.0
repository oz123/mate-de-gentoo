# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"
PYTHON_COMPAT=( python2_7 )

inherit gnome2 python-r1 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="MATE library to access weather information from online services"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="gtk3 python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND=">=dev-libs/glib-2.36:2[${PYTHON_USEDEP}]
	>=dev-libs/libxml2-2.6:2
	>=net-libs/libsoup-2.34:2.4
	>=sys-libs/timezone-data-2010k:0
	!gtk3? ( x11-libs/gdk-pixbuf:2
			>=x11-libs/gtk+-2.24:2 )
			gtk3? ( x11-libs/gtk+:3 )
	virtual/libintl:0

	python? (
		${PYTHON_DEPS}
		>=dev-python/pygobject-2:2[${PYTHON_USEDEP}]
		>=dev-python/pygtk-2:2[${PYTHON_USEDEP}]
	)"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.50.2-r1
	>=mate-base/mate-common-1.12:0
	sys-devel/gettext:*
	virtual/pkgconfig:*"

my_command() {
	if use python ; then
		python_foreach_impl run_in_build_dir $@
	else
		$@
	fi
}

src_prepare() {
	# Is this still needed ?
	# Fix undefined use of MKDIR_P in python/Makefile.am.
	# epatch "${FILESDIR}"/${PN}-1.6.1-fix-mkdirp.patch
	# eautoreconf

	use python && python_copy_sources
	my_command gnome2_src_prepare
}

src_configure() {
	local use_gtk
	use gtk3 && use_gtk="${use_gtk} --with-gtk=3.0"
	use !gtk3 && use_gtk="${use_gtk} --with-gtk=2.0"
	my_command gnome2_src_configure \
	--enable-locations-compression \
	--disable-all-translations-in-one-xml \
	${use_gtk} \
	$(use_enable python)
}

src_compile() {
	my_command gnome2_src_compile
}

DOCS="AUTHORS ChangeLog NEWS"

src_install() {
	my_command gnome2_src_install
}
