# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="no"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"
GTK_VERSION="3.${PR/r}"
GTK_MICRO=""$(get_version_component_range 3)

SRC_URI="http://pub.mate-desktop.org/releases/themes/${GTK_VERSION}/${PN}-${GTK_VERSION}.${GTK_MICRO}.tar.xz"
DESCRIPTION="A set of MATE themes, with sets for users with limited or low vision"
HOMEPAGE="http://mate-desktop.org"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""

S=${WORKDIR}/${PN}-${GTK_VERSION}.${GTK_MICRO}
RDEPEND="
	=x11-libs/gtk+-3.${PR/r}*:3
	x11-themes/murrine-themes:0"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35:*
	sys-devel/gettext:*
	>=x11-misc/icon-naming-utils-0.8.7:0
	virtual/pkgconfig:*"

RESTRICT="binchecks strip"

src_configure() {
	gnome2_src_configure
}

DOCS="AUTHORS ChangeLog NEWS README"
