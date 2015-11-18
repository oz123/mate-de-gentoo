# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="no"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="Applet showing network traffic for MATE"
HOMEPAGE="http://mate-desktop.org/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3"

# FIXME: wireless-tools >= 28pre9 is automagic
RDEPEND="dev-libs/glib:2
	>=gnome-base/libgtop-2.14.2:2
	>=mate-base/mate-panel-1.12:0[gtk3?]
	>=net-wireless/wireless-tools-28_pre9:0
	!gtk3? ( x11-libs/gdk-pixbuf:2
			x11-libs/gtk+:2
			)
	gtk3? ( x11-libs/gtk+:3 )
	x11-libs/pango:0
	virtual/libintl:0"

DEPEND="${RDEPEND}
	app-text/yelp-tools:0
	>=dev-util/intltool-0.50.2-r1
	sys-devel/gettext:*
	virtual/pkgconfig:*"

DOCS="AUTHORS ChangeLog README"
