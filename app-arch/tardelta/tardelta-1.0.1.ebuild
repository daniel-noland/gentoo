# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{9..10} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="Generate a tarball of differences between two tarballs"
HOMEPAGE="https://github.com/zmedico/tardelta"
SRC_URI="https://github.com/zmedico/tardelta/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"

src_prepare() {
	sed -i "s:^\(__version__ =\).*:\\1 \"${PV}\":" src/${PN}.py || die
	distutils-r1_src_prepare
}
