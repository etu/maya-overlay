# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  adlmapps-4 for amd64$
EAPI="4"

inherit rpm eutils

DESCRIPTION="Autodesk License Management Apps, Used by Autodesk's Maya. Commercial modeling and animation package"
HOMEPAGE="http://usa.autodesk.com/maya/"
SRC_URI="http://images.autodesk.com/adsk/files/autodesk_maya_2012_english_linux_64bit2.tgz"

LICENSE="maya-12.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RESTRICT="mirror nouserpriv"

# Needed for install
DEPEND="app-arch/rpm2targz app-arch/tar"

RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	unpack ${A}

	rpm2tar adlmapps4-4.0.35-0.x86_64.rpm -O | tar -x
	assert "Failed to unpack adlmapps4-4.0.35-0.x86_64.rpm"
}

src_install() {
	# Copy the unpacked things to to the build directory
	cp -pPR ./var ./opt ${D} || die
}
