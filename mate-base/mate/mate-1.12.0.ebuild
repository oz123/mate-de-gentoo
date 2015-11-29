# Copyright open-overlay 2015 by Alex

EAPI="5"

inherit multilib

SRC_URI=""
DESCRIPTION="Meta ebuild for MATE, a traditional desktop environment"
HOMEPAGE="http://mate-desktop.org"

LICENSE="metapackage"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+base -bluetooth +themes +extras gtk3"

S="${WORKDIR}"

RDEPEND="
	>=mate-base/mate-desktop-1.12:0[gtk3?]
	>=mate-base/mate-menus-1.12:0
	>=mate-base/mate-panel-1.12:0[gtk3?]
	>=mate-base/mate-session-manager-1.12:0[gtk3?]
	>=mate-base/mate-settings-daemon-1.12:0[gtk3?]
	>=x11-wm/marco-1.12:0[gtk3?]
	base? (
		>=mate-base/caja-1.12:0[gtk3?]
		>=mate-base/mate-applets-1.12:0[gtk3?]
		>=mate-base/mate-control-center-1.12:0[gtk3?]
		>=mate-extra/mate-media-1.12:0
		>=x11-misc/mozo-1.12:0
		>=x11-terms/mate-terminal-1.12:0[gtk3?]
	)
	bluetooth? ( net-wireless/blueman:0 )
	themes? (
		>=x11-themes/mate-backgrounds-1.12:0
		>=x11-themes/mate-icon-theme-1.12:0
		>=x11-themes/mate-themes-1.12:0
	)
	extras? (
		>=app-arch/engrampa-1.12:0[gtk3?]
		>=app-editors/pluma-1.12:0[gtk3?]
		>=app-text/atril-1.12:0[gtk3?]
		!gtk3? ( >=mate-extra/mate-calc-1.8:0 )
		gtk3? ( sci-calculators/galculator )
                >=mate-extra/mate-power-manager-1.12:0[gtk3?]
		>=mate-extra/mate-screensaver-1.12:0
		>=mate-extra/mate-system-monitor-1.12:0[gtk3?]
		>=mate-extra/mate-utils-1.12:0
		>=media-gfx/eom-1.12:0[gtk3?]
	)
"

PDEPEND="virtual/notification-daemon:0"

pkg_postinst() {
	elog "For installation, usage and troubleshooting details regarding MATE;"
	elog "read more about it at Gentoo Wiki: https://wiki.gentoo.org/wiki/MATE"
	elog ""
	elog "MATE 1.12 had some packages renamed, replaced and/or dropped; for more"
	elog "details, see http://mate-desktop.org/blog/2015-11-05-mate-1-12-released/"
	elog ""
	elog "There is mate-conf-import that converts from mateconf to gsettings."
	elog ""
	elog "For support with mate-conf-import see the following MATE forum topic:"
	elog "http://forums.mate-desktop.org/viewtopic.php?f=16&t=1650"
    elog ""
    elog "For user guide information: emerge mate-user-guide-1.12.0"
    elog ""
    elog ""
    elog "Please report any issues you encounter in "
    elog "https://github.com/oz123/gentoo-mate-112"
    elog ""
}
