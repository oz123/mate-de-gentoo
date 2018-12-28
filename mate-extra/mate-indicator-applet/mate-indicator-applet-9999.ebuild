# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit mate versionator

if [[ ${PV} != 9999 ]]; then
	KEYWORDS="~amd64 ~arm ~x86"
fi

DESCRIPTION="MATE indicator applet"
LICENSE="GPL-2 FDL-1.1 LGPL-2"
SLOT="0"

COMMON_DEPEND="
	>=mate-base/mate-panel-1.8
	>=dev-libs/libindicator-0.3.90:3
	>=x11-libs/gtk+-3.0:3
	"

RDEPEND="${COMMON_DEPEND}"

DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.35.0
	virtual/pkgconfig"

src_configure() {
	mate_src_configure
}
