# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"

inherit eutils gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="The MATE Desktop configuration tool"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk3"

RDEPEND="app-text/rarian:0
	dev-libs/atk:0
	>=dev-libs/dbus-glib-0.73:0
	>=dev-libs/glib-2.36:2
	!gtk3? ( >=dev-libs/libunique-1:1
			x11-libs/gdk-pixbuf:2
			>=x11-libs/gtk+-2.24:2
			media-libs/libcanberra[gtk]
			)
	gtk3? ( dev-libs/libunique:3
			x11-libs/gtk+:3
			media-libs/libcanberra[gtk3]
			)
	dev-libs/libxml2:2
	>=gnome-base/dconf-0.13.4:0
	>=gnome-base/librsvg-2.0:2
	>=mate-base/libmatekbd-1.10:0[gtk3?]
	>=mate-base/mate-desktop-${MATE_BRANCH}:0[gtk3?]
	|| (
		>=mate-base/caja-1.10:0[gtk3?]
	)
	>=mate-base/mate-menus-1.10:0
	>=mate-base/mate-settings-daemon-${MATE_BRANCH}:0[gtk3?]
	>=media-libs/fontconfig-1:1.0
	media-libs/freetype:2
	>=sys-apps/dbus-1:0
	x11-apps/xmodmap:0
	x11-libs/cairo:0
	x11-libs/libX11:0
	x11-libs/libXScrnSaver:0
	x11-libs/libXcursor:0
	x11-libs/libXext:0
	x11-libs/libXft:0
	>=x11-libs/libXi-1.2:0
	x11-libs/libXrandr:0
	x11-libs/libXrender:0
	x11-libs/libXxf86misc:0
	>=x11-libs/libxklavier-4:0
	x11-libs/pango:0
	>=x11-wm/marco-1.10.0:0
	virtual/libintl:0"

DEPEND="${RDEPEND}
	>=app-text/scrollkeeper-dtd-1:1.0
	app-text/yelp-tools:0
	dev-util/desktop-file-utils:0
	>=dev-util/intltool-0.50.1:*
	>=mate-base/mate-common-${MATE_BRANCH}:0
	sys-devel/gettext:*
	x11-proto/kbproto:0
	x11-proto/randrproto:0
	x11-proto/renderproto:0
	x11-proto/scrnsaverproto:0
	x11-proto/xextproto:0
	x11-proto/xf86miscproto:0
	x11-proto/xproto:0
	virtual/pkgconfig:*"

src_configure() {
	local use_gtk3
	use gtk3 && use_gtk3="${use_gtk3} --with-gtk=3.0"
	use !gtk3 && use_gtk3="${use_gtk3} --with-gtk=2.0"
	gnome2_src_configure \
	${use_gtk3} \
		--disable-update-mimedb \
		--disable-appindicator
}

src_compile() {
	emake
}

DOCS="AUTHORS ChangeLog NEWS README TODO"
