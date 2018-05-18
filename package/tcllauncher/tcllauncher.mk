################################################################################
#
# TCL Launcher
#
################################################################################

TCLLAUNCHER_VERSION = 462ad35fcf4313e929e86e9cf40407bf85d1d3bf
TCLLAUNCHER_SITE = git://github.com/flightaware/tcllauncher.git
# TCLLAUNCHER_LICENSE = BSD-3-Clause
# no real license file
# TCLLAUNCHER_LICENSE_FILES = anet.h
TCLLAUNCHER_DEPENDENCIES = tcl

#define TCLLAUNCHER_BUILD_CMDS
#	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
#endef

#define TCLLAUNCHER_INSTALL_TARGET_CMDS
#	$(INSTALL) -m 0755 -D $(@D)/dump1090 $(TARGET_DIR)/usr/bin/dump1090
#	$(INSTALL) -m 0755 -D $(@D)/view1090 $(TARGET_DIR)/usr/bin/view1090
#	$(INSTALL) -m 0755 -D $(TCLLAUNCHER_PKGDIR)/init/S90dump1090 $(TARGET_DIR)/etc/init.d/S90dump1090
#
#	$(INSTALL) -d $(TARGET_DIR)/usr/share/dump1090
#	cp -r $(@D)/public_html/* $(TARGET_DIR)/usr/share/dump1090
#	mkdir -p $(TARGET_DIR)/usr/share/dump1090/data
#	mv $(TARGET_DIR)/usr/share/dump1090/gmap.html $(TARGET_DIR)/usr/share/dump1090/index.html
#	ln -sf /usr/share/dump1090 $(TARGET_DIR)/usr/html/
#endef

$(eval $(autotools-package))

