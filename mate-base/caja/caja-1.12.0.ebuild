# Copyright open-overlay 2015 by Alex

EAPI="5"

GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"

inherit eutils gnome2 versionator virtualx

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="Caja file manager for the MATE desktop"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2 LGPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="X +mate +introspection xmp +unique gtk3"

RDEPEND="dev-libs/atk:0
	>=dev-libs/glib-2.28:2
	>=dev-libs/libxml2-2.4.7:2
	gnome-base/dconf:0
	>=gnome-base/gvfs-1.10.1:0[udisks]
	>=mate-base/mate-desktop-1.9:0[gtk3?]
	>=media-libs/libexif-0.5.12:0
	x11-libs/cairo:0
	x11-libs/libICE:0
	x11-libs/libSM:0
	x11-libs/libX11:0
	x11-libs/libXext:0
	x11-libs/libXft:0
	x11-libs/libXrender:0
	>=x11-libs/pango-1.1.2:0
	virtual/libintl:0
    x11-libs/gdk-pixbuf:2
	introspection? ( >=dev-libs/gobject-introspection-0.6.4:0 )
    xmp? ( >=media-libs/exempi-1.99.2:2 )
    !gtk3? ( >=x11-libs/gtk+-2.24:2[introspection?]
        unique? ( >=dev-libs/libunique-1:1 )
    )
    gtk3? ( x11-libs/gtk+:3 
        unique? ( dev-libs/libunique:3 ) 
    )"
DEPEND="${RDEPEND}
	!!mate-base/mate-file-manager
	>=dev-lang/perl-5:0=
	dev-util/gdbus-codegen:0
	>=dev-util/intltool-0.50.2-r1
	>=mate-base/mate-common-1.6:0
	sys-devel/gettext:*
	virtual/pkgconfig:*"

PDEPEND="mate? ( >=x11-themes/mate-icon-theme-1.6:0 )"

# TODO: Test fails because Caja is not merged yet:
# GLib-GIO-ERROR **: Settings schema 'org.mate.caja.preferences' is not installed
RESTRICT="test"

src_prepare() {
	# Remove unnecessary CFLAGS.
	sed -i -e 's:-DG.*DISABLE_DEPRECATED::g' \
		configure{,.ac} eel/Makefile.{am,in} || die

	gnome2_src_prepare
}

src_configure() {
                local myconf
                use gtk3 && myconf="${myconf} --with-gtk=3.0"
                use !gtk3 && myconf="${myconf} --with-gtk=2.0" 
          	gnome2_src_configure \
		--enable-unique \
		--disable-packagekit \
		--disable-update-mimedb \
		$(use_enable introspection) \
		$(use_enable xmp) \
                ${myconf} \
                $(use_enable unique) \
                $(use_with X x)
}

DOCS="AUTHORS ChangeLog* HACKING MAINTAINERS NEWS README THANKS TODO"

src_test() {
	unset SESSION_MANAGER
	unset DBUS_SESSION_BUS_ADDRESS

	Xemake check || die "Test phase failed"
}

pkg_postinst() {
	gnome2_pkg_postinst

	elog "Caja can use gstreamer to preview audio files. Just make sure"
	elog "to have the necessary plugins available to play the media type you"
	elog "want to preview."
}
