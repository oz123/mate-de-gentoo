# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit meson python-single-r1 xdg

DESCRIPTION="Make simple recordings from your desktop"
HOMEPAGE="https://gitlab.com/oz123/mate-sound-recorder"
SRC_URI="https://gitlab.com/oz123/mate-sound-recorder/-/archive/v${PV}/${PN}-v${PV}.tar.bz2 -> ${P}.tar.bz2"
S="${WORKDIR}/${PN}-v${PV}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/pygobject:3[${PYTHON_USEDEP}]
	')
	>=dev-libs/glib-2.39.3:2
	>=dev-libs/gobject-introspection-1.31.6
	>=x11-libs/gtk+-3.22.0:3[introspection]
	media-libs/gstreamer:1.0[introspection]
	media-libs/gst-plugins-base:1.0[introspection]
	media-libs/gst-plugins-bad:1.0[introspection]
	media-libs/gst-plugins-good:1.0
"
DEPEND="${RDEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	sys-devel/gettext
	virtual/pkgconfig
"

src_install() {
	meson_src_install
	python_fix_shebang "${ED}/usr/bin/mate-sound-recorder"
}

pkg_postinst() {
	xdg_pkg_postinst
}

pkg_postrm() {
	xdg_pkg_postrm
}
