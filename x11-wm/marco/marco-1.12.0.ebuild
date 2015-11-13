# Copyright open-overlay 2015 by Alex

EAPI="5"

# Debug only changes CFLAGS
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="MATE default window manager"
HOMEPAGE="http://mate-desktop.org"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="startup-notification test xinerama gtk3"

RDEPEND="
        gnome-extra/zenity
	dev-libs/atk:0
	>=dev-libs/glib-2.25.10:2
	!>=mate-extra/mate-dialogs-1.6:0
	!gtk3? ( media-libs/libcanberra:0[gtk]
    	x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-2.20:2
        )
        gtk3? ( x11-libs/gtk+:3 media-libs/libcanberra[gtk3] ) 
	>=gnome-base/libgtop-2:2=
	x11-libs/cairo:0
	>=x11-libs/pango-1.2:0[X]
	x11-libs/libICE:0
	x11-libs/libSM:0
	x11-libs/libX11:0
	>=x11-libs/libXcomposite-0.2:0
	x11-libs/libXcursor:0
	x11-libs/libXdamage:0
	x11-libs/libXext:0
	x11-libs/libXfixes:0
	x11-libs/libXrandr:0
	x11-libs/libXrender:0
	>=x11-libs/startup-notification-0.7:0
	virtual/libintl:0
	xinerama? ( x11-libs/libXinerama:0 )
	!!x11-wm/mate-window-manager"

DEPEND="${RDEPEND}
	app-text/yelp-tools:0
	>=dev-util/intltool-0.34.90:*
	sys-devel/gettext:*
	virtual/pkgconfig:*
	x11-proto/xextproto:0
	x11-proto/xproto:0
	test? ( app-text/docbook-xml-dtd:4.5 )
	xinerama? ( x11-proto/xineramaproto:0 )"

src_configure() {
        local myconf 
        use gtk3 && myconf="${myconf} --with-gtk=3.0"
        use !gtk3 && myconf="${myconf} --with-gtk=2.0"
	gnome2_src_configure \
		--enable-compositor \
		--enable-render \
		--enable-shape \
		--enable-sm \
		--enable-xsync \
		$(use_enable startup-notification) \
		$(use_enable xinerama) \
                ${myconf}
}

DOCS="AUTHORS ChangeLog HACKING NEWS README *.txt doc/*.txt"
