# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="MATE indicator applet"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2 FDL-1.1 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="gtk3"

RDEPEND="
	>=mate-base/mate-panel-1.14:0
	!gtk3? ( x11-libs/gdk-pixbuf:2
			>=x11-libs/gtk+-2.14:2
			dev-libs/libindicator:0
			)
	gtk3? ( x11-libs/gtk+:3
			dev-libs/libindicator:3
			)"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35.0
	virtual/pkgconfig"

src_configure() {
	local use_gtk
	use gtk3 && use_gtk="${use_gtk} --with-gtk=3.0"
	use !gtk3 && use_gtk="${use_gtk} --with-gtk=2.0"

	gnome2_src_configure \
		--disable-static \
		${use_gtk}
}
