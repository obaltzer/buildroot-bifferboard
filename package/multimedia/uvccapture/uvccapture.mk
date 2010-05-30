#############################################################
#
# uvccapture
#
#############################################################
UVCCAPTURE_VERSION:=0.5
UVCCAPTURE_SOURCE:=uvccapture-$(UVCCAPTURE_VERSION).tar.bz2
UVCCAPTURE_SITE:=http://staticwave.ca/source/uvccapture/
#UVCCAPTURE_INSTALL_STAGING=YES
UVCCAPTURE_DEPENDENCIES = jpeg

define UVCCAPTURE_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
endef

define UVCCAPTURE_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/uvccapture $(TARGET_DIR)/usr/bin/uvccapture
	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/uvccapture
endef

$(eval $(call GENTARGETS,package/multimedia,uvccapture))
