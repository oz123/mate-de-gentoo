# Copyright open-overlay 2015 by Alex

EAPI="5"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="Mixer library for MATE Desktop"
HOMEPAGE="http://mate-desktop.org"

LICENSE="LGPL-2 GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="alsa oss pulseaudio"

DEPEND="pulseaudio? ( >=media-sound/pulseaudio-0.9.23:0[glib] )
	app-text/docbook-xml-dtd:4.1.2
	>=dev-util/intltool-0.50.2-r1
	sys-devel/gettext:*
	virtual/pkgconfig:*"

src_configure() {
	gnome2_src_configure \
		--disable-null \
		$(use_enable pulseaudio) \
		$(use_enable alsa) \
		$(use_enable oss)
}

DOCS="AUTHORS ChangeLog NEWS README"
