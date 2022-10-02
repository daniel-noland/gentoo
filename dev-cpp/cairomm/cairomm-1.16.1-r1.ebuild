# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson-multilib

DESCRIPTION="C++ bindings for the Cairo vector graphics library"
HOMEPAGE="https://cairographics.org/cairomm/"
SRC_URI="https://www.cairographics.org/releases/${P}.tar.xz"

LICENSE="LGPL-2+"
SLOT="1.16"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~riscv ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-solaris"
IUSE="gtk-doc test X"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-libs/libsigc++:3[gtk-doc?,${MULTILIB_USEDEP}]
	>=x11-libs/cairo-1.12.10[X=,${MULTILIB_USEDEP}]
"
DEPEND="${RDEPEND}
	test? (
		dev-libs/boost[${MULTILIB_USEDEP}]
		media-libs/fontconfig[${MULTILIB_USEDEP}]
	)
"
BDEPEND="
	virtual/pkgconfig
	gtk-doc? (
		app-doc/doxygen[dot]
		dev-lang/perl
		dev-libs/libxslt
	)
"

multilib_src_configure() {
	local emesonargs=(
		$(meson_native_use_bool gtk-doc build-documentation)
		-Dbuild-examples=false
		$(meson_use test build-tests)
		-Dboost-shared=true
	)
	meson_src_configure
}
