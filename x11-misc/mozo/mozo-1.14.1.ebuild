# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

GCONF_DEBUG="no"
PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="xml"

inherit gnome2 python-r1 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="Mozo menu editor for MATE"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="dev-libs/gobject-introspection[${PYTHON_USEDEP}]
	>=mate-base/mate-menus-1.10:0[introspection,python]"

RDEPEND="${COMMON_DEPEND}
	${PYTHON_DEPS}
	>=x11-libs/gtk+-3.0:3
	virtual/libintl:0
	!!x11-misc/mate-menu-editor"

DEPEND="${COMMON_DEPEND}
	>=dev-util/intltool-0.40:*
	sys-devel/gettext:*
	virtual/pkgconfig:*"

src_prepare() {
	gnome2_src_prepare
	python_copy_sources
}

src_configure() {
	python_foreach_impl run_in_build_dir gnome2_src_configure \
		--disable-icon-update
}

src_compile() {
	python_foreach_impl run_in_build_dir gnome2_src_compile
}

src_test() {
	python_foreach_impl run_in_build_dir emake check
}

DOCS="AUTHORS NEWS README"

src_install() {
	installing() {
		gnome2_src_install

		# Massage shebang to make python_doscript happy
		sed -e 's:#! '"${PYTHON}:#!/usr/bin/python:" \
			-i mozo || die

		python_doscript mozo
	}

	python_foreach_impl run_in_build_dir installing
}
