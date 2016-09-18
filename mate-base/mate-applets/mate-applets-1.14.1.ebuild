# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="no"
PYTHON_COMPAT=( python2_7 )

inherit autotools eutils gnome2 python-single-r1 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="Applets for the MATE Desktop and Panel"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2 FDL-1.1 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="X gtk3 ipv6 policykit +upower"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	app-text/rarian:0
	dev-libs/atk:0
	>=dev-libs/dbus-glib-0.74:0
	>=dev-libs/glib-2.36:2
	>=dev-libs/libmateweather-1.14.0:0[gtk3?]
	>=dev-libs/libxml2-2.5:2
	dev-python/pygobject:3
	>=gnome-base/libgtop-2.11.92:2=
	>=mate-base/mate-desktop-${MATE_BRANCH}:0[gtk3?]
	>=mate-base/mate-panel-${MATE_BRANCH}:0[gtk3?]
	>=mate-base/mate-settings-daemon-${MATE_BRANCH}:0[gtk3?]
	>=sys-apps/dbus-1.1.2:0
	sys-power/cpupower
	!gtk3? ( x11-libs/gdk-pixbuf:2
			>=x11-libs/gtk+-2.24:2
			>=x11-libs/libwnck-2.30:1
			x11-libs/gtksourceview:2.0
	)
	gtk3? ( x11-libs/gtk+:3
			x11-libs/gtksourceview:3.0
			x11-libs/libwnck:3
	)
	upower?  ( || ( >=sys-power/upower-0.9.23
					>=sys-power/upower-pm-utils-0.9.23 ) )
	>=x11-libs/libnotify-0.7:0
	x11-libs/libX11:0
	>=x11-libs/libxklavier-4:0
	x11-libs/pango:0
	>=x11-themes/mate-icon-theme-${MATE_BRANCH}:0
	virtual/libintl:0
	policykit? ( >=sys-auth/polkit-0.92:0 )
	!!net-analyzer/mate-netspeed
	"

DEPEND="${RDEPEND}
	app-text/docbook-xml-dtd:4.3
	>=app-text/scrollkeeper-dtd-1:1.0
	app-text/yelp-tools:0
	>=dev-util/intltool-0.50.2-r1
	dev-libs/libxslt:0
	>=mate-base/mate-common-${MATE_BRANCH}:0
	sys-devel/gettext:*
	virtual/pkgconfig:*"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.10.0-replace-cpufreq-by-cpupower.patch
	eautoreconf
}

src_configure() {
	local use_gtk3
	use gtk3 && use_gtk3="${use_gtk3} --with-gtk=3.0"
	use !gtk3 && use_gtk3="${use_gtk3} --with-gtk=2.0"
	gnome2_src_configure \
		--libexecdir=/usr/libexec/mate-applets \
		$(use_enable ipv6) \
		$(use_enable policykit polkit) \
		$(use_with upower) \
		${use_gtk3} \
		$(use_with X x)
}

src_test() {
	unset DBUS_SESSION_BUS_ADDRESS
	emake check
}

DOCS="AUTHORS ChangeLog NEWS README"

src_install() {
	python_fix_shebang invest-applet timerapplet
	gnome2_src_install

	local APPLETS="accessx-status battstat charpick command cpufreq drivemount
			geyes invest-applet mateweather mini-commander mixer multiload
			null_applet stickynotes timerapplet trashapplet"

	for applet in ${APPLETS}; do
		docinto ${applet}

		for d in AUTHORS ChangeLog NEWS README README.themes TODO; do
			[ -s ${applet}/${d} ] && dodoc ${applet}/${d}
		done
	done
}
