Return-Path: <linux-fbdev+bounces-1083-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27D854256
	for <lists+linux-fbdev@lfdr.de>; Wed, 14 Feb 2024 06:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81E76B241E5
	for <lists+linux-fbdev@lfdr.de>; Wed, 14 Feb 2024 05:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6041AC147;
	Wed, 14 Feb 2024 05:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jmn+rSKV"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA510A01;
	Wed, 14 Feb 2024 05:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707888327; cv=none; b=ALeoEngWsaYOHbLxy32XnlNz7YVqg3VP3svVzMu5a2gTI5ed+GcPIhruDTpyS0Qmov/S9ilI0ctBhKb9ikqfQo/kxfS7mGoPdKTiuVGMIo5rH4QqvwbbCVfDpKXZRJe6a/XRAy91/B+xQR4tL6bR9nJvh3Lg5mbfbZn605hE2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707888327; c=relaxed/simple;
	bh=/SNJH5mi3cLJUn0gkt7Dk+vu0AREXHUs/+p3bdoRMj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prWWnvsh2ZbBUpO3b2gSTrxoqkpiUrGmyXufOgEWGJtH9L0OCtpIS5uA+MvoVcR64XThXb0j5AE27s1ExV6iaGS1oYekOKszjG6PGBlXG6/X2aUl/mnTe+75m0+SDiZKRyC+QrKJ0ye19L6NUJ6oDBOCQaftaihWQlyBxWhok3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jmn+rSKV; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from dragon.fritz.box (unknown [58.7.187.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6213043A13;
	Wed, 14 Feb 2024 05:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1707888320;
	bh=F7tGUbYrO0LaqqLDslIXG8EpJYmwDVj8pxAuB9hurBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=jmn+rSKV1GWw4BbgEKt8LV0gNWtSCrzaGYl4SnNBs2cJc0IEZ4eWfCctqqyFJxbw/
	 mbdu/f/ACZQSi11bX5Me0YKaPIIT2/VNp2nAB5GkytNwkvtnZuKDvIdswItJK1WhPz
	 4yn8Wi7iWb3Vi/4/UxzLO/mlokW6YDLZVN5rLeTM6z46xBtMHs62bMf0LY4SrPuiMC
	 iBEKbjZ4gp+jCKngdWFB9EI1VEpjnYLcXg1EwgX4iDO8RJxwFjeAkTq4Yox11zfhC6
	 pnsv7zgs1a5gbeN0oJc6dHTE3VIHF/CHCfvjT1ggMLYbrgMZue6rXJrSNOKgko+x/6
	 Q0TQjSF2rf6Bg==
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
To: 
Cc: Daniel van Vugt <daniel.van.vugt@canonical.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] fbcon: Defer console takeover for splash screens to first switch
Date: Wed, 14 Feb 2024 13:24:07 +0800
Message-ID: <20240214052412.22770-2-daniel.van.vugt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214052412.22770-1-daniel.van.vugt@canonical.com>
References: <f2c54ff7-d601-49d0-b5ad-9b111d743ded@canonical.com>
 <20240214052412.22770-1-daniel.van.vugt@canonical.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Until now, deferred console takeover only meant defer until there is
output. But that risks stepping on the toes of userspace splash screens,
as console messages may appear before the splash screen. So check the
command line for the expectation of userspace splash and if present then
extend the deferral until the first switch.

v2: Added Kconfig option instead of hard coding "splash".
v3: Default to disabled, not "splash". If enabled then take over on
    switch rather than on first output after switch.

Closes: https://bugs.launchpad.net/bugs/1970069
Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
---
 drivers/video/console/Kconfig    | 12 +++++++++
 drivers/video/fbdev/core/fbcon.c | 44 +++++++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index bc31db6ef7..2f9435335f 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -138,6 +138,18 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 	  by the firmware in place, rather then replacing the contents with a
 	  black screen as soon as fbcon loads.
 
+config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
+	string "Command line parameter to defer takeover to first switch"
+	depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
+	default ""
+	help
+	  If enabled this defers further the framebuffer console taking over
+	  until the first console switch has occurred. And even then only if
+	  the specified parameter is found on the command line. This ensures
+	  fbcon does not interrupt userspace splash screens such as Plymouth
+	  which may be yet to start rendering at the time of the first console
+	  output.
+
 config STI_CONSOLE
 	bool "STI text console"
 	depends on PARISC && HAS_IOMEM
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 1183e7a871..e5d841ab03 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -76,6 +76,7 @@
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
 #include <asm/irq.h>
+#include <asm/cmdline.h>
 
 #include "fbcon.h"
 #include "fb_internal.h"
@@ -3348,7 +3349,7 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 {
 	WARN_CONSOLE_UNLOCKED();
 
-	pr_info("fbcon: Taking over console\n");
+	pr_info("fbcon: Taking over console for output\n");
 
 	dummycon_unregister_output_notifier(&fbcon_output_nb);
 
@@ -3357,6 +3358,27 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 
 	return NOTIFY_OK;
 }
+
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
+static int initial_console;
+static struct notifier_block fbcon_switch_nb;
+
+static int fbcon_switch_notifier(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct vc_data *vc = data;
+
+	WARN_CONSOLE_UNLOCKED();
+
+	if (vc->vc_num != initial_console) {
+		pr_info("fbcon: Taking over console for switch\n");
+		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
+		schedule_work(&fbcon_deferred_takeover_work);
+	}
+
+	return NOTIFY_OK;
+}
+#endif
 #endif
 
 static void fbcon_start(void)
@@ -3368,8 +3390,18 @@ static void fbcon_start(void)
 		deferred_takeover = false;
 
 	if (deferred_takeover) {
-		fbcon_output_nb.notifier_call = fbcon_output_notifier;
-		dummycon_register_output_notifier(&fbcon_output_nb);
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
+		if (cmdline_find_option_bool(boot_command_line,
+		      CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
+			initial_console = fg_console;
+			fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
+			dummycon_register_switch_notifier(&fbcon_switch_nb);
+		} else
+#endif
+		{
+			fbcon_output_nb.notifier_call = fbcon_output_notifier;
+			dummycon_register_output_notifier(&fbcon_output_nb);
+		}
 		return;
 	}
 #endif
@@ -3416,8 +3448,12 @@ void __exit fb_console_exit(void)
 {
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 	console_lock();
-	if (deferred_takeover)
+	if (deferred_takeover) {
 		dummycon_unregister_output_notifier(&fbcon_output_nb);
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
+		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
+#endif
+	}
 	console_unlock();
 
 	cancel_work_sync(&fbcon_deferred_takeover_work);
-- 
2.43.0


