# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MATE_LA_PUNT="yes"

PYTHON_COMPAT=( python3_{9..11} )

inherit meson python-single-r1

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/infirit/caja-admin"
else
	SRC_URI="https://github.com/infirit/caja-admin/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Caja Admin Extension"
HOMEPAGE="https://github.com/infirit/caja-admin"
LICENSE="GPL-3+"
SLOT="0"

IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

COMMON_DEPEND="${PYTHON_DEPS}"

RDEPEND="${COMMON_DEPEND}
	app-editors/pluma
	dev-python/python-caja[${PYTHON_SINGLE_USEDEP}]
	sys-auth/polkit
	x11-terms/mate-terminal
"

BDEPEND="${COMMON_DEPEND}
	sys-devel/gettext
"

src_install() {
	meson_src_install
	python_optimize "${D}/usr/share/caja-python/extensions"
}
