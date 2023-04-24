Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE6306D980B
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Apr 2023 15:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbjDFNW0 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Apr 2023 09:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238518AbjDFNWR (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Apr 2023 09:22:17 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B63793F1
        for <linux-fbdev@vger.kernel.org>; Thu,  6 Apr 2023 06:21:58 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id F15EE225A5;
        Thu,  6 Apr 2023 13:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680787271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ta8f8WHREs5bm4b1Ti3FczQdjKLh0lCzor3tvYZlBU8=;
        b=MmvU5nwEksjkx15HCDtEwEhjjjC8P3ar7uZUMI0ev4iw/lY3c4KOeWsaQntyDp0OIvlTra
        hIxujnQrdwBEFPgCUgBF9auYYkC4Sp6pIsTqbKkkBhmoTsM+3xyVDCYh7fSRGAYVAZla18
        pZS2zpeS28Gi4uI+tk7pKkLxh6wDqWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680787272;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ta8f8WHREs5bm4b1Ti3FczQdjKLh0lCzor3tvYZlBU8=;
        b=l3QfOftGNyQ/s8eNfOFdjOADVBa1+1wjQA9SXRtdiVrBuiu3caHmtE7+6d5Yf/6KL0l6wV
        t2YYodPZa21KxQAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C883313A1D;
        Thu,  6 Apr 2023 13:21:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iEARMEfHLmSqBwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 13:21:11 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, daniel.vetter@ffwll.ch,
        patrik.r.jakobsson@gmail.com
Cc:     dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
Subject: [PATCH v5 4/9] video/aperture: Only kick vgacon when the pdev is decoding vga
Date:   Thu,  6 Apr 2023 15:21:04 +0200
Message-Id: <20230406132109.32050-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406132109.32050-1-tzimmermann@suse.de>
References: <20230406132109.32050-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Daniel Vetter <daniel.vetter@ffwll.ch>

Otherwise it's a bit silly, and we might throw out the driver for the
screen the user is actually looking at. I haven't found a bug report
for this case yet, but we did get bug reports for the analog case
where we're throwing out the efifb driver.

v2: Flip the check around to make it clear it's a special case for
kicking out the vgacon driver only (Thomas)

v4:
- fixes to commit message
- fix Daniel's S-o-b address

v5:
- add back an S-o-b tag with Daniel's Intel address

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216303
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/aperture.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index d0eccc4ed60b..26bdba6b2725 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -342,13 +342,15 @@ int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const char *na
 			return ret;
 	}
 
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-	ret = vga_remove_vgacon(pdev);
-	if (ret)
-		return ret;
+	if (primary) {
+		/*
+		 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+		 * otherwise the vga fbdev driver falls over.
+		 */
+		ret = vga_remove_vgacon(pdev);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 
-- 
2.40.0

