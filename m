Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0C71F81BE
	for <lists+linux-fbdev@lfdr.de>; Sat, 13 Jun 2020 10:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgFMIN6 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 13 Jun 2020 04:13:58 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:39285 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726401AbgFMIN6 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 13 Jun 2020 04:13:58 -0400
Received: from localhost.localdomain (ip5f5af4f5.dynamic.kabel-deutschland.de [95.90.244.245])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 895BA2002EE10;
        Sat, 13 Jun 2020 10:13:54 +0200 (CEST)
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Peter Jones <pjones@redhat.com>
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, linux-fbdev@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] efifb: BGRT: Fix typo in *deferred* in comment
Date:   Sat, 13 Jun 2020 10:13:46 +0200
Message-Id: <20200613081346.4532-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Cc: linux-fbdev@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/video/fbdev/efifb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 65491ae74808..42b4facc5e2b 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -91,7 +91,7 @@ static int efifb_setcolreg(unsigned regno, unsigned red, unsigned green,
 }
 
 /*
- * If fbcon deffered console takeover is configured, the intent is for the
+ * If fbcon deferred console takeover is configured, the intent is for the
  * framebuffer to show the boot graphics (e.g. vendor logo) until there is some
  * (error) message to display. But the boot graphics may have been destroyed by
  * e.g. option ROM output, detect this and restore the boot graphics.
-- 
2.27.0

