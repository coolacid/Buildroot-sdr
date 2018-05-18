################################################################################
#
# Flight Aware - PiAware
#
################################################################################

FLIGHTAWARE_VERSION = v3.6.0
FLIGHTAWARE_SITE = $(call github,flightaware,piaware,$(FLIGHTAWARE_VERSION))
FLIGHTAWARE_DEPENDENCIES = tcl 
# tcllauncher

define FLIGHTAWARE_INSTALL_TARGET_CMDS
#	$(INSTALL) -m 0755 -D $(@D)/tcl $(TARGET_DIR)/bin/piaware
#	$(INSTALL) -m 0755 -D $(TARGET_DIR)/bin/tcl $(TARGET_DIR)/bin/piaware
	$(INSTALL) -m 0755 -D $(@D)/programs/piaware/*.tcl $(TARGET_DIR)/usr/lib/piaware

	$(INSTALL) -m 0755 -D $(FLIGHTAWARE_PKGDIR)/init/S90flightaware $(TARGET_DIR)/etc/init.d/S90flightaware
endef

$(eval $(generic-package))

