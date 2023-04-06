Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D246D9A0A
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Apr 2023 16:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239297AbjDFOav (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Apr 2023 10:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238526AbjDFOaZ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Apr 2023 10:30:25 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E7A93CB;
        Thu,  6 Apr 2023 07:30:24 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id A27F62270E;
        Thu,  6 Apr 2023 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680791422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bCoxmdX4y9ul4c4sc0AlrMWrTF+cPW9BA1U+6LtQKlA=;
        b=txezI0OP8/f4lClS5LB/4tIroaJiDP/QLAelQR95C/0xWhhdk1DX/M/zvsAyK5AvjdQ+lE
        OqZlvN8C2izFTk8YmUTI5GdgR9ZMQX4TToC9fodm9Ott/qiwnWrulx/4lV6ouJeq0ds60Z
        WhxaIQst9855wnH0Q41Fr5NLYKKcfkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680791422;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bCoxmdX4y9ul4c4sc0AlrMWrTF+cPW9BA1U+6LtQKlA=;
        b=wcPRh1fk0ZA7xVSDrF8uubgX3fCA7RsXAQ6yR2LwEx4MHaadMSEfp01AcEJ7Jq7sO5zSV2
        Klp5L8DNjLYONuBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43A4113A1D;
        Thu,  6 Apr 2023 14:30:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id WLuvD37XLmS4LgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:30:22 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de,
        javierm@redhat.com, gregkh@linuxfoundation.org
Cc:     linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 03/19] arch/arm: Implement <asm/fb.h> with generic helpers
Date:   Thu,  6 Apr 2023 16:30:03 +0200
Message-Id: <20230406143019.6709-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143019.6709-1-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
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

Replace the architecture's fbdev helpers with the generic
ones from <asm-generic/fb.h>. No functional changes.

v2:
	* use default implementation for fb_pgprotect() (Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Russell King <linux@armlinux.org.uk>
---
 arch/arm/include/asm/fb.h | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/fb.h b/arch/arm/include/asm/fb.h
index d92e99cd8c8a..ce20a43c3033 100644
--- a/arch/arm/include/asm/fb.h
+++ b/arch/arm/include/asm/fb.h
@@ -1,19 +1,6 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
-#include <linux/fs.h>
-#include <asm/page.h>
-
-static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
-				unsigned long off)
-{
-	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-}
-
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
+#include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
-- 
2.40.0

