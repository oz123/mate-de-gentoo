# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils autotools gnome2
DESCRIPTION="Application dock for the MATE panel"
HOMEPAGE="https://github.com/robint99/dock-applet"
SRC_URI="https://github.com/robint99/mate-dock-applet/archive/V${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3"

DEPEND=">=sys-devel/automake-1.15:1.15"

RDEPEND="
	dev-lang/python:3.4
	dev-python/pyxdg[python_targets_python3_4]
	gtk3? (
		x11-libs/libwnck:3[introspection]
		mate-base/mate-panel[introspection,gtk3]
		dev-python/pygobject:3[python_targets_python3_4]
	)

	!gtk3? (
		x11-libs/libwnck:1[introspection]
		mate-base/mate-panel[introspection]
		dev-python/pygobject:2
	)
	"

src_prepare() {
	eaclocal
	eautomake
	eautoreconf
}

src_configure(){
	gnome2_src_configure $(use_with gtk3) --prefix=/usr
}
