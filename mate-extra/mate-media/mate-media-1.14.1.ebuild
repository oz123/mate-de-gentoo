# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="yes"

inherit gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="Multimedia related programs for the MATE desktop"
HOMEPAGE="http://mate-desktop.org"

LICENSE="LGPL-2 GPL-2 FDL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="aac flac gtk3 mp3 speex twolame vorbis"

# FIXME: automagic dev-util/glade:3 support
COMMON_DEPEND="app-text/rarian:0
	dev-libs/libxml2:2
	>=dev-libs/glib-2.36.0:2
	>=mate-base/mate-panel-1.14:0[gtk3?]
	>=mate-base/mate-desktop-1.14:0[gtk3?]
	!gtk3? ( >=media-libs/libcanberra-0.13:0[gtk]
			>=dev-libs/libunique-1:1
			>=x11-libs/gtk+-2.24:2
			)
	gtk3? ( x11-libs/gtk+:3
			dev-libs/libunique:3
			>=media-libs/libcanberra-0.13:0[gtk3] )
	x11-libs/cairo:0
	x11-libs/pango:0
	virtual/libintl:0"
#	>=media-libs/gstreamer-0.10.23:0.10
#	>=media-libs/gst-plugins-base-0.10.23:0.10
#	>=media-libs/gst-plugins-good-0.10:0.10
#	>=media-plugins/gst-plugins-meta-0.10-r2:0.10
#	>=media-plugins/gst-plugins-gconf-0.10.1:0.10

# Specific gst plugins are used by the default audio encoding profiles
#RDEPEND="${COMMON_DEPEND}
#	>=media-plugins/gst-plugins-meta-0.10:0.10[flac?,vorbis?]
#	aac? (
#		>=media-plugins/gst-plugins-faac-0.10.23:0.10
#		>=media-plugins/gst-plugins-ffmpeg-0.10:0.10
#	)
#	mp3? (
#		>=media-libs/gst-plugins-ugly-0.10:0.10
#		>=media-plugins/gst-plugins-taglib-0.10.23:0.10
#		>=media-plugins/gst-plugins-lame-0.10:0.10
#	)
#	speex? (
#		>=media-plugins/gst-plugins-ogg-0.10.23:0.10
#		>=media-plugins/gst-plugins-speex-0.10.23:0.10
#	)
#	twolame? (
#		>=media-plugins/gst-plugins-taglib-0.10.23:0.10
#		>=media-plugins/gst-plugins-twolame-0.10:0.10
#	)"

DEPEND="${COMMON_DEPEND}
	>=media-libs/libmatemixer-1.14.0
	app-text/docbook-xml-dtd:4.1.2
	app-text/yelp-tools:0
	>=app-text/scrollkeeper-dtd-1:1.0
	>=dev-util/intltool-0.35.0:*
	sys-devel/gettext:*
	virtual/pkgconfig:*
	!!<mate-base/mate-applets-1.10:*"

src_configure() {
	local  use_gtk3
	use gtk3 && use_gtk3="${use_gtk3} --with-gtk=3.0"
	use !gtk3 && use_gtk3="${use_gtk3} --with-gtk=2.0"
	gnome2_src_configure \
		${use_gtk3}
}

DOCS="AUTHORS ChangeLog* NEWS README"

pkg_postinst() {
	gnome2_pkg_postinst

	ewarn
	ewarn "If you cannot play some music format, please check your"
	ewarn "USE flags on media-plugins/gst-plugins-meta"
	ewarn
}
