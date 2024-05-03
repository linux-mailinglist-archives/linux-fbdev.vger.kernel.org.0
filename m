Return-Path: <linux-fbdev+bounces-2245-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3D18BB3F7
	for <lists+linux-fbdev@lfdr.de>; Fri,  3 May 2024 21:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C11EE1F23048
	for <lists+linux-fbdev@lfdr.de>; Fri,  3 May 2024 19:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8558B158219;
	Fri,  3 May 2024 19:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Yphn7V1+"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE8363CF;
	Fri,  3 May 2024 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714764568; cv=none; b=EBgcx2Myxck139qsiwXCfZtW1iX6qon8Q03FLQkC7oIprgusLlvlbC7tkEesaduplw/1Hx1AikDf8ft93xLGmtZUidfWAPNSpDqXMIHNpL6rMT/9+8Yfhb3F0tvyWDc33C+VG+Zy/WC+5KgEIo4tCgEvjcAM9jg+xjWmXdMcnfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714764568; c=relaxed/simple;
	bh=9ZqHM4abn7CpGGthTHlMK+mT3y3FvF3yKb+/l5xV6mY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UwrqJ8Q6KkBmArhozq4/POKl8nIH4QIQc2+kpvPgGMJgHcscPjUlNaRQFz98w6fQ56kcF4IbJqi0ACpYCHOam/1LGZ2g71al25zrTypEa890uvHQMbSpyq3dIn0+L2s9bizGdBFP8bYuAfmMZrubalkmuApVCkinREGMXEQdaKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Yphn7V1+; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id DE0E2C0003CA;
	Fri,  3 May 2024 12:29:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com DE0E2C0003CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714764557;
	bh=9ZqHM4abn7CpGGthTHlMK+mT3y3FvF3yKb+/l5xV6mY=;
	h=From:To:Cc:Subject:Date:From;
	b=Yphn7V1+cQVI97VgfZU/RfjVHnOBn0Sr3tpVctdb4+KZQQjXiQPaNSSZWaNecPp/k
	 sy96J/1ekIIYg2n/PwyFWpUiTfyj0HzmktQsHeq5OG/oMvNn9qr9AgqsJ3NefXqaCj
	 D+zbsE71Wl3MeDwmF/D+cHagadkhkLF2m8rps+qM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id E35D018041CAC4;
	Fri,  3 May 2024 12:29:15 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
	dri-devel@lists.freedesktop.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH] fbdev: Have CONFIG_FB_NOTIFY be tristate
Date: Fri,  3 May 2024 12:28:54 -0700
Message-Id: <20240503192858.103640-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Android devices in recovery mode make use of a framebuffer device to
provide an user interface. In a GKI configuration that has CONFIG_FB=m,
but CONFIG_FB_NOTIFY=y, loading the fb.ko module will fail with:

fb: Unknown symbol fb_notifier_call_chain (err -2)

Have CONFIG_FB_NOTIFY be tristate, just like CONFIG_FB such that both
can be loaded as module with fb_notify.ko first, and fb.ko second.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/video/fbdev/core/Kconfig     | 2 +-
 drivers/video/fbdev/core/fb_notify.c | 3 +++
 include/linux/fb.h                   | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index db09fe87fcd4..036af8b5914a 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -8,7 +8,7 @@ config FB_CORE
 	tristate
 
 config FB_NOTIFY
-	bool
+	tristate
 
 config FIRMWARE_EDID
 	bool "Enable firmware EDID"
diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
index 10e3b9a74adc..ef707e092344 100644
--- a/drivers/video/fbdev/core/fb_notify.c
+++ b/drivers/video/fbdev/core/fb_notify.c
@@ -52,3 +52,6 @@ int fb_notifier_call_chain(unsigned long val, void *v)
 	return blocking_notifier_call_chain(&fb_notifier_list, val, v);
 }
 EXPORT_SYMBOL_GPL(fb_notifier_call_chain);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Frame buffer notifier support");
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 0dd27364d56f..8c7ae5997278 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -156,7 +156,7 @@ struct fb_blit_caps {
 	u32 flags;
 };
 
-#ifdef CONFIG_FB_NOTIFY
+#if IS_ENABLED(CONFIG_FB_NOTIFY)
 extern int fb_register_client(struct notifier_block *nb);
 extern int fb_unregister_client(struct notifier_block *nb);
 extern int fb_notifier_call_chain(unsigned long val, void *v);
-- 
2.34.1


