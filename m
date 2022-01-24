Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189ED497FA4
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jan 2022 13:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239545AbiAXMhI (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jan 2022 07:37:08 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:39088 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241215AbiAXMhH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jan 2022 07:37:07 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 7BBA41F38F;
        Mon, 24 Jan 2022 12:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1643027826; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9lYRh2nW2gDT1C90x0lvcg1tfcOcymqymgktmR6tiFg=;
        b=PyNrqIXvW847xsRZbPSLS1pAcF43YjRceDx5UEiM8KUNmC8rPEAUMlBr/hvPlVPm9i7Mm6
        w35A+rCVQ1eQd2WtOQ1zxzd2Zvnabrdcbi8rFKQm9Rnp6VLn794h6b3Az+yAZhNPw44ita
        GT8Rpfq+dtqkCxlsn7VMYR/3OVjCQ0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1643027826;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9lYRh2nW2gDT1C90x0lvcg1tfcOcymqymgktmR6tiFg=;
        b=EV/jIaMY9C7cx2vwPRW6+BkByfjFXV8P3RNMme9xpJJpvWICwy9LUcrdk0KNCY5kioi6bN
        1hAC28RW7MoPU7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E0CF13BA4;
        Mon, 24 Jan 2022 12:37:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CGQmDnKd7mFyNQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 24 Jan 2022 12:37:06 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     zackr@vmware.com, javierm@redhat.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
        hdegoede@redhat.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/simpledrm: Request memory region in driver
Date:   Mon, 24 Jan 2022 13:36:57 +0100
Message-Id: <20220124123659.4692-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124123659.4692-1-tzimmermann@suse.de>
References: <20220124123659.4692-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Requesting the framebuffer memory in simpledrm marks the memory
range as busy. This used to be done by the firmware sysfb code,
but the driver is the correct place.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 04146da2d1d8..f72b71511a65 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -526,21 +526,31 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 {
 	struct drm_device *dev = &sdev->dev;
 	struct platform_device *pdev = sdev->pdev;
-	struct resource *mem;
+	struct resource *res, *mem;
 	void __iomem *screen_base;
 	int ret;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem)
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
 		return -EINVAL;
 
-	ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
+	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
 	if (ret) {
 		drm_err(dev, "could not acquire memory range %pr: error %d\n",
-			mem, ret);
+			res, ret);
 		return ret;
 	}
 
+	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
+				      sdev->dev.driver->name);
+	if (!mem) {
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about
+		 */
+		drm_warn(dev, "could not acquire memory region %pr\n", res);
+	}
+
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
 				      resource_size(mem));
 	if (!screen_base)
-- 
2.34.1

