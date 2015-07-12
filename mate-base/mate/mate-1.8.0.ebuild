# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/mate-base/mate/mate-1.8.0.ebuild,v 1.5 2014/07/02 09:47:11 pacho Exp $

EAPI="5"

inherit versionator

MATE_MV="$(get_version_component_range 1-2)"

SRC_URI=""
DESCRIPTION="Meta ebuild for MATE, a traditional desktop environment"
HOMEPAGE="http://mate-desktop.org"

LICENSE="metapackage"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+base -bluetooth +themes +extras"

S="${WORKDIR}"

RDEPEND="
	=mate-base/mate-desktop-${MATE_MV}*:0
	=mate-base/mate-menus-${MATE_MV}*:0
	=mate-base/mate-panel-${MATE_MV}*:0
	=mate-base/mate-session-manager-${MATE_MV}*:0
	=mate-base/mate-settings-daemon-${MATE_MV}*:0
	=x11-wm/marco-${MATE_MV}*:0
	base? (
		=mate-base/caja-${MATE_MV}*:0
		=mate-base/mate-applets-${MATE_MV}*:0
		=mate-base/mate-control-center-${MATE_MV}*:0
		=mate-extra/mate-media-${MATE_MV}*:0
		=x11-misc/mozo-${MATE_MV}*:0
		=x11-terms/mate-terminal-${MATE_MV}*:0
	)
	bluetooth? ( net-wireless/blueman:0 )
	themes? (
		=x11-themes/mate-backgrounds-${MATE_MV}*:0
		=x11-themes/mate-icon-theme-${MATE_MV}*:0
		=x11-themes/mate-themes-${MATE_MV}*:0
	)
	extras? (
		=app-arch/engrampa-${MATE_MV}*:0
		=app-editors/pluma-${MATE_MV}*:0
		=app-text/atril-${MATE_MV}*:0
		=mate-extra/mate-calc-${MATE_MV}*:0
		=mate-extra/mate-power-manager-${MATE_MV}*:0
		=mate-extra/mate-screensaver-${MATE_MV}*:0
		=mate-extra/mate-system-monitor-${MATE_MV}*:0
		=mate-extra/mate-utils-${MATE_MV}*:0
		=media-gfx/eom-${MATE_MV}*:0
	)
"

PDEPEND="virtual/notification-daemon:0"

pkg_postinst() {
	elog "For installation, usage and troubleshooting details regarding MATE;"
	elog "read more about it at Gentoo Wiki: https://wiki.gentoo.org/wiki/MATE"
	elog ""
	elog "MATE 1.8 had some packages renamed, replaced and/or dropped; for more"
	elog "details, see http://mate-desktop.org/blog/2014-03-04-mate-1-8-released"
	elog ""
	elog "MATE 1.6 has moved from mateconf to gsettings. This means that the"
	elog "desktop settings and panel applets will return to their default."
	elog "You will have to reconfigure your desktop appearance."
	elog ""
	elog "There is mate-conf-import that converts from mateconf to gsettings."
	elog ""
	elog "For support with mate-conf-import see the following MATE forum topic:"
	elog "http://forums.mate-desktop.org/viewtopic.php?f=16&t=1650"
}
