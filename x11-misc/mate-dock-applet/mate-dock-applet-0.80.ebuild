# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils autotools mate
DESCRIPTION="Application dock for the MATE panel"
HOMEPAGE="https://github.com/robint99/dock-applet"
SRC_URI="https://github.com/robint99/mate-dock-applet/archive/V${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

PYTHON_COMPAT=( python{3_4,3_5,3_6} )
DEPEND=">=sys-devel/automake-1.15:1.15"

RDEPEND="
	dev-python/python-xlib[python_targets_python3_4,python_targets_python3_5,python_targets_python3_6]
	dev-python/pygobject:3[python_targets_python3_4,python_targets_python3_5,python_targets_python3_6]
	dev-python/pillow
	>=mate-base/mate-panel-1.17.0[introspection]
	x11-libs/libwnck:3[introspection]
	"

src_prepare() {
	eapply_user
	eaclocal
	eautomake
	eautoreconf
}

src_configure(){
	mate_src_configure --with-gtk3 --prefix=/usr
}
