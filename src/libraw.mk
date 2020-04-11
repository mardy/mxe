# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libraw
$(PKG)_WEBSITE  := https://libraw.org
$(PKG)_DESCR    := A library for reading RAW files obtained from digital photo cameras
$(PKG)_VERSION  := 0.19.5
$(PKG)_CHECKSUM := 40a262d7cc71702711a0faec106118ee004f86c86cc228281d12d16da03e02f5
$(PKG)_SUBDIR   := LibRaw-$($(PKG)_VERSION)
$(PKG)_FILE     := LibRaw-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://www.libraw.org/data/$($(PKG)_FILE)
$(PKG)_DEPS     := cc jpeg lcms

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(MXE_CONFIGURE_OPTS) \
        --disable-jasper \
        --enable-jpeg \
        --enable-lcms \
        --disable-examples \
        CXXFLAGS='-DLIBRAW_BUILDLIB' \
        LDFLAGS='-lws2_32'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install
endef
