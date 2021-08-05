# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MATE_LA_PUNT="yes"

inherit mate

if [[ ${PV} != 9999 ]]; then
	KEYWORDS="~amd64"
fi

DESCRIPTION="User documentation for MATE Desktop"
LICENSE="GPL-2 LGPL-2"
SLOT="0"
IUSE="nls"

COMMON_DEPEND="virtual/libintl:0"

RDEPEND="${COMMON_DEPEND}
	gnome-extra/yelp"

DEPEND="${COMMON_DEPEND}
	app-text/yelp-tools
	>=sys-devel/gettext-0.19.8
	virtual/pkgconfig:*
	!!mate-base/mate-desktop[user-guide]"

src_configure() {
	mate_src_configure \
		$(use_enable nls)
}
