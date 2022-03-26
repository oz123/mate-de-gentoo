# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mate

if [[ ${PV} != 9999 ]]; then
	KEYWORDS="~amd64"
fi

DESCRIPTION="Mixer library for MATE Desktop"
LICENSE="LGPL-2+"
SLOT="0"

IUSE="+alsa +udev oss pulseaudio"

COMMON_DEPEND="
	>=dev-libs/glib-2.50:2
	>=sys-devel/gettext-0.19.8:*
	alsa? ( >=media-libs/alsa-lib-1.0.5 )
	udev? ( virtual/udev )
	pulseaudio? ( >=media-sound/pulseaudio-5.0.0:0[glib] )

"

RDEPEND="${COMMON_DEPEND}
	virtual/libintl
"

DEPEND="${COMMON_DEPEND}
	app-text/docbook-xml-dtd:4.1.2
	dev-util/gtk-doc
	dev-util/gtk-doc-am
	virtual/pkgconfig
"

src_configure() {
	mate_src_configure \
		--disable-null \
		$(use_enable alsa) \
		$(use_enable oss) \
		$(use_enable pulseaudio) \
		$(use_enable udev)
}
