Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D585C4CC764
	for <lists+linux-fbdev@lfdr.de>; Thu,  3 Mar 2022 21:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236384AbiCCU7b (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 3 Mar 2022 15:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236378AbiCCU7a (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 3 Mar 2022 15:59:30 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CAB45AC0
        for <linux-fbdev@vger.kernel.org>; Thu,  3 Mar 2022 12:58:43 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 656C8218DF;
        Thu,  3 Mar 2022 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1646341122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ZtguNSgg1NDddm00GNZoC9vZyrOz7spcYQMWL43ODc=;
        b=PuEJIpxoROvq+bRS7uWsQbRtB2OJunOblB+Ls7ey5o7JHNsJiN8AAcXIi6pqhJqDwyaIfB
        D/XNqecVqmF8yuhAn1Q3ftQ8DVe8kior7SIc0O8VTpJ3A4A/UXMBGw0EnwZMxTWUVDCJj5
        WO0dBKfSgB/IKwDpV3uhVk99XMXDc/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1646341122;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ZtguNSgg1NDddm00GNZoC9vZyrOz7spcYQMWL43ODc=;
        b=KnrPv3pEeHNUVwoOoUNGqigtiie3T29tWUVxyr/z09kq5hD/IbU+Ql7Z4aSg0lSP5KOWka
        yW26wce+QabDTZCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35293139B5;
        Thu,  3 Mar 2022 20:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id GPIMDAIsIWJoHAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, deller@gmx.de,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/9] fbdev: Export helper for implementing page_mkwrite
Date:   Thu,  3 Mar 2022 21:58:34 +0100
Message-Id: <20220303205839.28484-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
References: <20220303205839.28484-1-tzimmermann@suse.de>
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

Refactor the page-write handler and export it as helper function
fb_deferred_io_page_mkwrite(). Drivers that implement struct
vm_operations_struct.page_mkwrite for deferred I/O should use the
function to let fbdev track written pages of mmap'ed framebuffer
memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 69 ++++++++++++++++++++---------
 include/linux/fb.h                  |  1 +
 2 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 20c6eb94a685..8cd40b1714d4 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -143,29 +143,18 @@ int fb_deferred_io_fsync(struct file *file, loff_t start, loff_t end, int datasy
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_fsync);
 
-/* vm_ops->page_mkwrite handler */
-static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
+/*
+ * Adds a page to the dirty list. Requires caller to hold
+ * struct fb_deferred_io.lock. Call this from struct
+ * vm_operations_struct.page_mkwrite.
+ */
+static vm_fault_t __fb_deferred_io_track_page(struct fb_info *info, unsigned long offset,
+					      struct page *page)
 {
-	struct page *page = vmf->page;
-	struct fb_info *info = vmf->vma->vm_private_data;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct fb_deferred_io_pageref *pageref;
-	unsigned long offset;
 	vm_fault_t ret;
 
-	offset = (vmf->address - vmf->vma->vm_start);
-
-	/* this is a callback we get when userspace first tries to
-	write to the page. we schedule a workqueue. that workqueue
-	will eventually mkclean the touched pages and execute the
-	deferred framebuffer IO. then if userspace touches a page
-	again, we repeat the same scheme */
-
-	file_update_time(vmf->vma->vm_file);
-
-	/* protect against the workqueue changing the page list */
-	mutex_lock(&fbdefio->lock);
-
 	/* first write in this cycle, notify the driver */
 	if (fbdefio->first_io && list_empty(&fbdefio->pagelist))
 		fbdefio->first_io(info);
@@ -186,8 +175,6 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	 */
 	lock_page(pageref->page);
 
-	mutex_unlock(&fbdefio->lock);
-
 	/* come back after delay to process the deferred IO */
 	schedule_delayed_work(&info->deferred_work, fbdefio->delay);
 	return VM_FAULT_LOCKED;
@@ -197,6 +184,48 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	return ret;
 }
 
+/**
+ * fb_deferred_io_page_mkwrite - Mark a page as written for deferred I/O
+ * @fb_info: The fbdev info structure
+ * @vmf: The VM fault
+ *
+ * This is a callback we get when userspace first tries to
+ * write to the page. We schedule a workqueue. That workqueue
+ * will eventually mkclean the touched pages and execute the
+ * deferred framebuffer IO. Then if userspace touches a page
+ * again, we repeat the same scheme.
+ *
+ * Returns:
+ * VM_FAULT_LOCKED on success, or a VM_FAULT error otherwise.
+ */
+vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
+{
+	struct page *page = vmf->page;
+	struct fb_deferred_io *fbdefio = info->fbdefio;
+	unsigned long offset;
+	vm_fault_t ret;
+
+	offset = (vmf->address - vmf->vma->vm_start);
+
+	file_update_time(vmf->vma->vm_file);
+
+	/* protect against the workqueue changing the page list */
+	mutex_lock(&fbdefio->lock);
+	ret = __fb_deferred_io_track_page(info, offset, page);
+	mutex_unlock(&fbdefio->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fb_deferred_io_page_mkwrite);
+
+/* vm_ops->page_mkwrite handler */
+static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
+{
+	struct fb_info *info = vmf->vma->vm_private_data;
+
+	return fb_deferred_io_page_mkwrite(info, vmf);
+}
+
 static const struct vm_operations_struct fb_deferred_io_vm_ops = {
 	.fault		= fb_deferred_io_fault,
 	.page_mkwrite	= fb_deferred_io_mkwrite,
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 768de6534a82..631a1d0cb193 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -670,6 +670,7 @@ static inline void __fb_pad_aligned_buffer(u8 *dst, u32 d_pitch,
 }
 
 /* drivers/video/fb_defio.c */
+vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf);
 int fb_deferred_io_mmap(struct fb_info *info, struct vm_area_struct *vma);
 extern int  fb_deferred_io_init(struct fb_info *info);
 extern void fb_deferred_io_open(struct fb_info *info,
-- 
2.35.1

