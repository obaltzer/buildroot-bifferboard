#############################################################
#
# mjpg-streamer
#
#############################################################
MJPG_STREAMER_VERSION:=r63
MJPG_STREAMER_SOURCE:=mjpg-streamer-$(MJPG_STREAMER_VERSION).tar.bz2
MJPG_STREAMER_SITE:=http://downloads.sourceforge.net/project/mjpg-streamer/mjpg-streamer/Sourcecode/
MJPG_STREAMER_DEPENDENCIES = jpeg

define MJPG_STREAMER_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
endef

define MJPG_STREAMER_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/mjpg_streamer $(TARGET_DIR)/usr/bin/mjpg_streamer
	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/mjpg_stramer

	mkdir -p $(TARGET_DIR)/usr/lib/mjpg-streamer
	cp -dpf $(@D)/*.so $(TARGET_DIR)/usr/lib/mjpg-streamer/
	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/mjpg-streamer/*.so

	mkdir -p $(TARGET_DIR)/usr/share/mjpg-streamer
	cp -dprf $(@D)/www $(TARGET_DIR)/usr/share/mjpg-streamer/
endef

$(eval $(call GENTARGETS,package/multimedia,mjpg-streamer))
