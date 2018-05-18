################################################################################
#
# dump1090 - Mutability -- https://github.com/mutability/dump1090
#
################################################################################

DUMP1090_MUTABILITY_VERSION = fb5942dba6505a21cbafc7905a5a7c513b214dc9
DUMP1090_MUTABILITY_SITE = git://github.com/mutability/dump1090.git
# DUMP1090_MUTABILITY_LICENSE = BSD-3-Clause
# no real license file
# DUMP1090_MUTABILITY_LICENSE_FILES = anet.h
DUMP1090_MUTABILITY_DEPENDENCIES = host-pkgconf librtlsdr

$(if $(BR2_PACKAGE_THTTPD), DUMP1090_MUTABILITY_DEPENDENCIES = DUMP1090_MUTABILITY_DEPENDENCIES + " thttpd")
$(if $(BR2_PACKAGE_NGINX), DUMP1090_MUTABILITY_DEPENDENCIES = DUMP1090_MUTABILITY_DEPENDENCIES + " nginx")

define DUMP1090_MUTABILITY_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) PREFIX=/usr -C $(@D)
endef

define DUMP1090_MUTABILITY_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/dump1090 $(TARGET_DIR)/usr/bin/dump1090
	$(INSTALL) -m 0755 -D $(@D)/view1090 $(TARGET_DIR)/usr/bin/view1090
	$(INSTALL) -m 0755 -D $(DUMP1090_MUTABILITY_PKGDIR)/init/S90dump1090 $(TARGET_DIR)/etc/init.d/S90dump1090

	$(INSTALL) -d $(TARGET_DIR)/usr/share/dump1090
	cp -r $(@D)/public_html/* $(TARGET_DIR)/usr/share/dump1090
	mkdir -p $(TARGET_DIR)/usr/share/dump1090/data
	mv $(TARGET_DIR)/usr/share/dump1090/gmap.html $(TARGET_DIR)/usr/share/dump1090/index.html
	$(if $(BR2_PACKAGE_NGINX),ln -sf /usr/share/dump1090 $(TARGET_DIR)/usr/html/)
	$(if $(BR2_PACKAGE_THTTPD),ln -sf /usr/share/dump1090 $(TARGET_DIR)/var/www/)
endef

$(eval $(generic-package))

