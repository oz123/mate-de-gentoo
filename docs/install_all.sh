#!/bin/bash

VERSION=1.14.0

USE="gtk3" emerge -ank =mate-base/mate-common-1.14.0 =mate-base/mate-desktop-1.14.0 \
=mate-base/libmatekbd-${VERSION}* \
=dev-libs/libmateweather-${VERSION}* \
=x11-themes/mate-icon-theme-${VERSION}* \
=mate-base/caja-1.14.0 =x11-wm/marco-1.14.0 \
=media-libs/libmatemixer-${VERSION} \
=mate-base/mate-settings-daemon-${VERSION} \
=mate-base/mate-session-manager-${VERSION} \
=mate-base/mate-menus-${VERSION} \
=mate-base/mate-panel-${VERSION} \
=mate-base/mate-control-center-$VERSION \
=mate-extra/mate-polkit-$VERSION \
=mate-base/mate-applets-${VERSION}* \
=mate-extra/mate-media-$VERSION \
=mate-extra/mate-netbook-$VERSION \
=mate-extra/caja-extensions-$VERSION \
=mate-extra/caja-dropbox-$VERSION \
=x11-themes/mate-backgrounds-$VERSION \
=x11-misc/mate-notification-daemon-$VERSION \
=mate-extra/mate-sensors-applet-$VERSION \
=mate-extra/mate-system-monitor-$VERSION \
=mate-extra/mate-user-guide-$VERSION \
=mate-extra/mate-user-share-$VERSION \
=mate-extra/mate-utils-1.14.0 \
=dev-python/python-caja-$VERSION \
=mate-extra/mate-power-manager-1.14.0 \
=x11-terms/mate-terminal-${VERSION} \
=app-arch/engrampa-$VERSION \
=media-gfx/eom-${VERSION}* \
=app-text/atril-1.14.0 \
=mate-extra/mate-screensaver-${VERSION} \
=x11-misc/mozo-${VERSION} \
=app-editors/pluma-1.14.0
