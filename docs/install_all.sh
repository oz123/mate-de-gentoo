#!/bin/bash

VERSION=1.14.1

USE="gtk3 xinerama" emerge -aUN =mate-base/mate-common-1.14.0 \
=mate-base/mate-desktop-1.14.1 \
=mate-base/libmatekbd-${VERSION}* \
=dev-libs/libmateweather-1.14.3 \
=x11-themes/mate-icon-theme-1.14.0 \
=mate-base/caja-1.14.1 \
=x11-wm/marco-1.14.0 \
=media-libs/libmatemixer-1.14.0 \
=mate-base/mate-settings-daemon-${VERSION} \
=mate-base/mate-session-manager-${VERSION} \
=mate-base/mate-menus-1.14.0 \
=mate-base/mate-panel-1.14.1 \
=mate-base/mate-control-center-$VERSION \
=mate-extra/mate-polkit-1.14.0 \
=mate-base/mate-applets-${VERSION}* \
=mate-extra/mate-media-$VERSION \
=mate-extra/mate-netbook-1.14.0 \
=mate-extra/caja-extensions-$VERSION \
=mate-extra/caja-dropbox-1.14.0-r1 \
=x11-themes/mate-backgrounds-1.14.0 \
=x11-misc/mate-notification-daemon-$VERSION \
=mate-extra/mate-sensors-applet-1.14.0 \
=mate-extra/mate-system-monitor-$VERSION \
=mate-extra/mate-user-guide-1.14.0 \
#=mate-extra/mate-user-share-1.14.0 \
=mate-extra/mate-utils-1.14.0 \
=dev-python/python-caja-1.14.0 \
=mate-extra/mate-power-manager-1.14.0 \
=x11-terms/mate-terminal-${VERSION} \
=app-arch/engrampa-1.14.1 \
=media-gfx/eom-${VERSION}* \
=app-text/atril-1.14.1 \
=mate-extra/mate-screensaver-1.14.1 \
=x11-misc/mozo-${VERSION} \
=app-editors/pluma-1.14.0 \
=x11-themes/mate-themes-1.14.2
