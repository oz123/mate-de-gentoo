# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="yes"
PYTHON_COMPAT=( python2_7 )

inherit gnome2 python-single-r1 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="The MATE image viewer"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="X dbus exif gtk3 +introspection jpeg lcms python svg tiff xmp"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
	gtk3? ( !dbus )"

RDEPEND="
	dev-libs/atk:0
	>=dev-libs/glib-2.36.0:2
	>=dev-libs/libxml2-2:2
	gnome-base/dconf:0
	>=mate-base/mate-desktop-${MATE_BRANCH}:0[gtk3?]
	sys-libs/zlib:0
	x11-libs/cairo:0
	>=x11-libs/gdk-pixbuf-2.30:2[introspection?,jpeg?,tiff?]
	!gtk3? ( >=x11-libs/gtk+-2.18:2 )
	gtk3? ( x11-libs/gtk+:3 )
	x11-libs/libX11:0
	>=x11-misc/shared-mime-info-0.20:0
	virtual/libintl:0
	dbus? ( >=dev-libs/dbus-glib-0.71:0 )
	exif? (
		>=media-libs/libexif-0.6.14:0
		virtual/jpeg:0 )
	introspection? ( >=dev-libs/gobject-introspection-0.9.3 )
	jpeg? ( virtual/jpeg:0 )
	lcms? ( media-libs/lcms:2 )
	python? (
		${PYTHON_DEPS}
		>=dev-python/pygobject-2.15.1:2[${PYTHON_USEDEP}]
		>=dev-python/pygtk-2.13:2[${PYTHON_USEDEP}] )
	svg? ( >=gnome-base/librsvg-2.36.2:2 )
	xmp? ( >=media-libs/exempi-1.99.5:2 )
	!!media-gfx/mate-image-viewer"

DEPEND="${RDEPEND}
	app-text/yelp-tools:0
	>=dev-util/intltool-0.50.1:*
	sys-devel/gettext:*
	virtual/pkgconfig:*"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local use_gtk3
	use gtk3 && use_gtk3="${use_gtk3} --with-gtk=3.0"
	use !gtk3 && use_gtk3="${use_gtk3} --with-gtk=2.0"
	gnome2_src_configure \
		$(use_enable python) \
		$(use_with jpeg libjpeg) \
		$(use_with exif libexif) \
		$(use_with dbus) \
		$(use_with lcms cms) \
		$(use_with xmp) \
		$(use_with svg librsvg) \
		$(use_with X x) \
		--without-cms \
		${use_gtk3}
}

DOCS="AUTHORS ChangeLog HACKING NEWS README"
