################################################################################
#
# dump1090 - Mutability -- https://github.com/mutability/dump1090
#
################################################################################

FLIGHTRADAR24_VERSION = 1.0.46-1_armhf
FLIGHTRADAR24_SITE = https://repo-feed.flightradar24.com/rpi_binaries
FLIGHTRADAR24_SOURCE = fr24feed_$(FLIGHTRADAR24_VERSION).tgz
FLIGHTRADAR24_STRIP_COMPONENTS = 1

define FLIGHTRADAR24_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/fr24feed $(TARGET_DIR)/usr/bin/fr24feed
	$(INSTALL) -m 0755 -D $(FLIGHTRADAR24_PKGDIR)/init/fr24feed-init $(TARGET_DIR)/usr/bin/fr24feed-init
	$(INSTALL) -m 0755 -D $(FLIGHTRADAR24_PKGDIR)/init/S90flightradar24 $(TARGET_DIR)/etc/init.d/S90flightradar24
	$(INSTALL) -m 0755 -D $(FLIGHTRADAR24_PKGDIR)/config/fr24feed.ini $(TARGET_DIR)/etc/fr24feed.ini
	mkdir -p $(TARGET_DIR)/var/log/fr24feed/
endef

$(eval $(generic-package))

