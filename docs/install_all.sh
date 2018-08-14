#!/bin/bash

set -x

VERSION=$1

USE="gtk3 xinerama" emerge -UN \
">=mate-base/mate-common-${VERSION}" \
">=mate-base/mate-desktop-${VERSION}" \
">=mate-base/libmatekbd-${VERSION}" \
">=dev-libs/libmateweather-${VERSION}" \
">=x11-themes/mate-icon-theme-${VERSION}" \
">=mate-base/caja-${VERSION}" \
">=x11-wm/marco-${VERSION}" \
">=media-libs/libmatemixer-${VERSION}" \
">=mate-base/mate-settings-daemon-${VERSION}" \
">=mate-base/mate-session-manager-${VERSION}" \
">=mate-base/mate-menus-${VERSION}" \
">=mate-base/mate-panel-${VERSION}" \
">=mate-base/mate-control-center-${VERSION}" \
">=mate-extra/mate-polkit-${VERSION}" \
">=mate-base/mate-applets-${VERSION}" \
">=mate-extra/mate-media-${VERSION}" \
">=mate-extra/mate-netbook-${VERSION}" \
">=mate-extra/caja-extensions-${VERSION}" \
">=mate-extra/caja-dropbox-${VERSION}" \
">=x11-themes/mate-backgrounds-${VERSION}" \
">=x11-misc/mate-notification-daemon-${VERSION}" \
">=mate-extra/mate-sensors-applet-${VERSION}" \
">=mate-extra/mate-system-monitor-${VERSION}" \
">=mate-extra/mate-user-guide-${VERSION}" \
">=mate-extra/mate-utils-${VERSION}" \
">=dev-python/python-caja-${VERSION}" \
">=mate-extra/mate-power-manager-${VERSION}" \
">=x11-terms/mate-terminal-${VERSION}" \
">=app-arch/engrampa-${VERSION}" \
">=media-gfx/eom-${VERSION}" \
">=app-text/atril-${VERSION}" \
">=mate-extra/mate-screensaver-${VERSION}" \
">=x11-misc/mozo-${VERSION}" \
">=app-editors/pluma-${VERSION}" \
">=x11-themes/mate-themes-${VERSION}"
