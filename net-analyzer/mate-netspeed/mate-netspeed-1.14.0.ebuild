# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

HOMEPAGE="mate-desktop.org"
DESCRIPTION="Applet showing network traffic for MATE"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"

pkg_postinst() {
	elog ""
	elog "${PN} Has been merged into mate-applets. To compile it, build"
	elog "mate-applets-1.14 with netspeed flag enabled."
}

DOCS="AUTHORS ChangeLog README"
