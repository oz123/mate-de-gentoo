# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

if [[ ${PV} == 9999 ]]; then
	MATE_BRANCH=9999
else
	inherit versionator
	MATE_BRANCH="$(get_version_component_range 1-2)"
	KEYWORDS="~amd64 ~arm ~x86"
fi

DESCRIPTION="Meta package to facilitate easy use of x11-themes/mate-themes"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
IUSE="unsupported-gtk3"

DEPEND=""
RDEPEND="|| (
		(
			=x11-libs/gtk+-3.16*:3
			=x11-themes/mate-themes-${MATE_BRANCH}*:0/3.16
		)
		(
			=x11-libs/gtk+-3.18*:3
			=x11-themes/mate-themes-${MATE_BRANCH}*:0/3.18
		)
		unsupported-gtk3? ( =x11-themes/mate-themes-${MATE_BRANCH}*:0 )
	)"
