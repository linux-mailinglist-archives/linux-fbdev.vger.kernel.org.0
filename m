Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E15F4C1C5E
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Feb 2022 20:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244471AbiBWTih (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 23 Feb 2022 14:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233923AbiBWTig (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 23 Feb 2022 14:38:36 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFB348E6A
        for <linux-fbdev@vger.kernel.org>; Wed, 23 Feb 2022 11:38:08 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 803371F37E;
        Wed, 23 Feb 2022 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645645087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s5ZN7uI6UG6Di2iSINpGQFR90gjSNoFjkDK2XKHJmb8=;
        b=PCa6oGDrQ1n2qcRHF5a73W6x6YgnrbQsuD32eUczTD2snckw0qWUf22KsXT0Pv7dQ+Jhaa
        CE7FslEwt4wDJywN4UCFyNds61jSLj7sjcsSrnCX+ECjRe0izJewbRoHLsrspAW1pupja9
        5XnM9sJTjDmPeWP8YwYmK2Tl6/D5oKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645645087;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s5ZN7uI6UG6Di2iSINpGQFR90gjSNoFjkDK2XKHJmb8=;
        b=Jx64EzN+aniD/z/Ga2FsNuAbxSPpCLCdhHw+MhW2Vu5gLLuGu9Va55v559ikUYFAK9dQ/t
        hSlW0/dUP53WjDCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47FD513DAC;
        Wed, 23 Feb 2022 19:38:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WOaNEB+NFmKfUgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 23 Feb 2022 19:38:07 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com,
        geert@linux-m68k.org, sam@ravnborg.org, kraxel@redhat.com,
        ppaalanen@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/5] fbdev: Improve performance of sys_fillrect()
Date:   Wed, 23 Feb 2022 20:38:00 +0100
Message-Id: <20220223193804.18636-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223193804.18636-1-tzimmermann@suse.de>
References: <20220223193804.18636-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Improve the performance of sys_fillrect() by using word-aligned
32/64-bit mov instructions. While the code tried to implement this,
the compiler failed to create fast instructions. The resulting
binary instructions were even slower than cfb_fillrect(), which
uses the same algorithm, but operates on I/O memory.

A microbenchmark measures the average number of CPU cycles
for sys_fillrect() after a stabilizing period of a few minutes
(i7-4790, FullHD, simpledrm, kernel with debugging). The value
for CFB is given as a reference.

  sys_fillrect(), new:  26586 cycles
  sys_fillrect(), old: 166603 cycles
  cfb_fillrect():       41012 cycles

In the optimized case, sys_fillrect() is now ~6x faster than before
and ~1.5x faster than the CFB implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/sysfillrect.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index 33ee3d34f9d2..bcdcaeae6538 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -50,19 +50,9 @@ bitfill_aligned(struct fb_info *p, unsigned long *dst, int dst_idx,
 
 		/* Main chunk */
 		n /= bits;
-		while (n >= 8) {
-			*dst++ = pat;
-			*dst++ = pat;
-			*dst++ = pat;
-			*dst++ = pat;
-			*dst++ = pat;
-			*dst++ = pat;
-			*dst++ = pat;
-			*dst++ = pat;
-			n -= 8;
-		}
-		while (n--)
-			*dst++ = pat;
+		memset_l(dst, pat, n);
+		dst += n;
+
 		/* Trailing bits */
 		if (last)
 			*dst = comp(pat, *dst, last);
-- 
2.35.1

