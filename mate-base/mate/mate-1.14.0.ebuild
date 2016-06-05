# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit multilib versionator

MATE_MV="$(get_version_component_range 1-2)"

SRC_URI=""
DESCRIPTION="Meta ebuild for MATE, a traditional desktop environment"
HOMEPAGE="http://mate-desktop.org"

LICENSE="metapackage"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+base -bluetooth +themes +extras gtk3"

S="${WORKDIR}"

RDEPEND="
	=mate-base/mate-desktop-${MATE_MV}*:0[gtk3?]
	=mate-base/mate-menus-${MATE_MV}*:0
	=mate-base/mate-panel-${MATE_MV}*:0[gtk3?]
	=mate-base/mate-session-manager-${MATE_MV}*:0[gtk3?]
	=mate-base/mate-settings-daemon-${MATE_MV}*:0[gtk3?]
	=x11-wm/marco-${MATE_MV}*:0[gtk3?]
	base? (
		=mate-base/caja-${MATE_MV}*:0[gtk3?]
		=mate-base/mate-applets-${MATE_MV}*:0[gtk3?]
		=mate-base/mate-control-center-${MATE_MV}*:0[gtk3?]
		=mate-extra/mate-media-${MATE_MV}*:0
		=x11-misc/mozo-${MATE_MV}*:0
		=x11-terms/mate-terminal-${MATE_MV}*:0[gtk3?]
	)
	bluetooth? ( net-wireless/blueman:0 )
	themes? (
		=x11-themes/mate-backgrounds-${MATE_MV}*:0
		=x11-themes/mate-icon-theme-${MATE_MV}*:0
		=x11-themes/mate-themes-${MATE_MV}*:0
	)
	extras? (
		=app-arch/engrampa-${MATE_MV}*:0[gtk3?]
		=app-editors/pluma-${MATE_MV}*:0[gtk3?]
		=app-text/atril-${MATE_MV}*:0[gtk3?]
		!gtk3? ( gnome-extra/gnome-calculator:0 )
		gtk3? ( sci-calculators/galculator )
        =mate-extra/caja-extensions-${MATE_MV}*:0
		=mate-extra/mate-netbook-${MATE_MV}*:0
		=mate-extra/mate-power-manager-${MATE_MV}*:0[gtk3?]
		=mate-extra/mate-screensaver-${MATE_MV}*:0
		=mate-extra/mate-system-monitor-${MATE_MV}*:0[gtk3?]
		=mate-extra/mate-utils-${MATE_MV}*:0
		=media-gfx/eom-${MATE_MV}*:0[gtk3?]
		sys-apps/gnome-disk-utility:0
	)
"

PDEPEND="virtual/notification-daemon:0"

pkg_postinst() {
	elog "For installation, usage and troubleshooting details regarding MATE;"
	elog "read more about it at Gentoo Wiki: https://wiki.gentoo.org/wiki/MATE"
	elog ""
	elog "MATE 1.14 removes the package net-anaylizer/mate-netspeed"
	elog "This is now part of the package mate-applets."
	elog ""
    elog "For user guide information: emerge mate-user-guide-1.14.0"
    elog ""
    elog "Please report any issues you encounter in "
    elog "https://github.com/oz123/mate-de-gentoo"
    elog ""
}
