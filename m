Return-Path: <linux-fbdev+bounces-938-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E984B226
	for <lists+linux-fbdev@lfdr.de>; Tue,  6 Feb 2024 11:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36CF8B214AF
	for <lists+linux-fbdev@lfdr.de>; Tue,  6 Feb 2024 10:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE01612E1E8;
	Tue,  6 Feb 2024 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wIT6GxCG"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0C512D162;
	Tue,  6 Feb 2024 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707214350; cv=none; b=iW0IpTg/a2c3qlhQsj1U0a8T580lcSAKb10bAJesqGfE6GIaLyMYSBpzVKeWfF66wPtfgEjF5AKVmCHTTnLhZuutL+PLBeM548+Vlf5kfujTBan1kslYr0dZGqw3NsFDvyYVna/rSbtOmKhLTJ+Zv2fIedw4qWbD+MAj4ZyKW/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707214350; c=relaxed/simple;
	bh=6iroYnq9Uw0iRChwBJhE8H6kVE7luAmB8MvjeUbdHQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOnBmv++1yp1p1cl6DGsttOhdfRPvon0eaWPJXwKFSDl/q19FXX+2bxkL/V7tkDRaHNoZJDnDSMGpBE//HTmkey7CVOtOzD4khag7fyAB39ab47NTvhbVY1ZgMBYm24NKmoSBa9oKJSdsfZO4BkbKn3FzVDMjP0xiSHEXyEjd70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wIT6GxCG; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from dragon.fritz.box (unknown [58.7.187.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 7AD283FB19;
	Tue,  6 Feb 2024 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1707214344;
	bh=r7riL64QZMEi+mj5uTbvBKg5b2LZZd6mXEPDsU5u25U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=wIT6GxCGp5GTc8iTMS+obmHAjlmQQshVZOetnDM6QbTJOaDhbh7HbAPvv8SCAg8bc
	 he+Iwd8bTKPIMDqYyNWd+fNdoWzZnUTVzUEj99iaoUeFrN+OH/NO+0vG3jR2YFzceu
	 oKi4mjRNnou3A5XzuzxJdJGO00yXKtfSOk6Wy9bo9Bt1SlAOIweUBtN1NxccmCV8n3
	 ntor14ntxik5SgBSpNEBfYXHLa22TBzE/xuJtFYECl0SNPZgPS4d8CPnmu6RF/LzU5
	 +7ncQAzOckNzfW82w6czRcHPxOy3uEYNg1YtqBPHH7lxM6Acia85c5hoZpbAWQVtfl
	 abwIP0YBncOAg==
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
To: 
Cc: Daniel van Vugt <daniel.van.vugt@canonical.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helge Deller <deller@gmx.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	Danilo Krummrich <dakr@redhat.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] fbcon: Defer console takeover for splash screens to first switch
Date: Tue,  6 Feb 2024 18:10:51 +0800
Message-ID: <20240206101100.25536-2-daniel.van.vugt@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206101100.25536-1-daniel.van.vugt@canonical.com>
References: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
 <20240206101100.25536-1-daniel.van.vugt@canonical.com>
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
extend the deferral until after the first switch.

V2: Added Kconfig option instead of hard coding "splash".

Closes: https://bugs.launchpad.net/bugs/1970069
Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
---
 drivers/video/console/Kconfig    | 13 +++++++++++
 drivers/video/fbdev/core/fbcon.c | 38 ++++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index bc31db6ef7..a6e371bfb4 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -138,6 +138,19 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
 	  by the firmware in place, rather then replacing the contents with a
 	  black screen as soon as fbcon loads.
 
+config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
+	string "Framebuffer Console Deferred Takeover Condition"
+	depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
+	default "splash"
+	help
+	  If enabled this defers further the framebuffer console taking over
+	  until the first console switch has occurred. And even then only if
+	  text has been output, and only if the specified parameter is found
+	  on the command line. This ensures fbcon does not interrupt userspace
+	  splash screens such as Plymouth which may be yet to start rendering
+	  at the time of the first console output. "splash" is the simplest
+	  distro-agnostic condition for this that Plymouth checks for.
+
 config STI_CONSOLE
 	bool "STI text console"
 	depends on PARISC && HAS_IOMEM
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 63af6ab034..98155d2256 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -76,6 +76,7 @@
 #include <linux/crc32.h> /* For counting font checksums */
 #include <linux/uaccess.h>
 #include <asm/irq.h>
+#include <asm/cmdline.h>
 
 #include "fbcon.h"
 #include "fb_internal.h"
@@ -3358,6 +3359,26 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 
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
+		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
+		dummycon_register_output_notifier(&fbcon_output_nb);
+	}
+
+	return NOTIFY_OK;
+}
+#endif
 #endif
 
 static void fbcon_start(void)
@@ -3370,7 +3391,16 @@ static void fbcon_start(void)
 
 	if (deferred_takeover) {
 		fbcon_output_nb.notifier_call = fbcon_output_notifier;
-		dummycon_register_output_notifier(&fbcon_output_nb);
+#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
+		if (cmdline_find_option_bool(boot_command_line,
+		      CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
+			initial_console = fg_console;
+			fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
+			dummycon_register_switch_notifier(&fbcon_switch_nb);
+		} else
+#endif
+			dummycon_register_output_notifier(&fbcon_output_nb);
+
 		return;
 	}
 #endif
@@ -3417,8 +3447,12 @@ void __exit fb_console_exit(void)
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


