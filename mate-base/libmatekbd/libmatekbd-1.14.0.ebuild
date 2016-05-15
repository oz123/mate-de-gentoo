# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="MATE keyboard configuration library"
HOMEPAGE="http://mate-desktop.org"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="X test gtk3"

RDEPEND=">=dev-libs/glib-2.36:2
	x11-libs/cairo:0
	!gtk3? ( >=x11-libs/gdk-pixbuf-2.24:2
			>=x11-libs/gtk+-2.24:2 )
	gtk3? ( x11-libs/gtk+:3 )
	x11-libs/libX11:0
	>=x11-libs/libxklavier-5.0:0
	x11-libs/pango:0
	virtual/libintl:0"

DEPEND="${RDEPEND}
	sys-devel/gettext:*
	>=dev-util/intltool-0.50.2-r1
	virtual/pkgconfig:*"

src_configure() {
	local use_gtk3
	use gtk3 &&  use_gtk3="${use_gtk3} --with-gtk=3.0"
	use !gtk3 && use_gtk3="${use_gtk3} --with-gtk=2.0"
	gnome2_src_configure \
	$(use_enable test tests) \
	$(use_with X x) \
	${use_gtk3}
}

DOCS="AUTHORS ChangeLog NEWS README"
