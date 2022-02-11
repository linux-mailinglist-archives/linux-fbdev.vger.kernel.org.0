Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA754B2264
	for <lists+linux-fbdev@lfdr.de>; Fri, 11 Feb 2022 10:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242819AbiBKJqp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 11 Feb 2022 04:46:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343993AbiBKJqo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 11 Feb 2022 04:46:44 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F08E10A2
        for <linux-fbdev@vger.kernel.org>; Fri, 11 Feb 2022 01:46:44 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id B9D361F3A2;
        Fri, 11 Feb 2022 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1644572802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rr/O6TIKP8Y1rYJpt7Gr1aalvRe+WTfBbdZrMfRKh5o=;
        b=MrepO+7/J+2mJI0T7QTZ4QrH60NDHNZ0Dx2IjZ5wMz/7YyN2lNsxHlzWyLzSSdII6R1iAF
        wU7U5Q1OmPpGR5Y7yVhf/gCmzn8JvIpo71R1XsfZbNgr2LlMyzWoQWbil7r5r0NaO8aTCe
        nxGJ7M9FnUs/KmmYjm/x7Pl2pO+HKnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1644572802;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rr/O6TIKP8Y1rYJpt7Gr1aalvRe+WTfBbdZrMfRKh5o=;
        b=2YHAfBmv3pK1Za/cI43eXpKM9GF+XUowzoq7OyvzGqGR0/1TKKUrAjaTlbJj9vkV8MR6h5
        dVNODF+xg9MqDhDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7611513BDD;
        Fri, 11 Feb 2022 09:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 2ADPG4IwBmKMHQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 09:46:42 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, javierm@redhat.com, noralf@tronnes.org,
        andriy.shevchenko@linux.intel.com, deller@gmx.de,
        bernie@plugable.com, jayalk@intworks.biz
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/2] fbdev/defio: Early-out if page is already enlisted
Date:   Fri, 11 Feb 2022 10:46:39 +0100
Message-Id: <20220211094640.21632-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211094640.21632-1-tzimmermann@suse.de>
References: <20220211094640.21632-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Return early if a page is already in the list of dirty pages for
deferred I/O. This can be detected if the page's list head is not
empty. Keep the list head initialized while the page is not enlisted
to make this work reliably.

v2:
	* update comment and fix spelling (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/fb_defio.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index a591d291b231..169a81c8172b 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -59,6 +59,7 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 		printk(KERN_ERR "no mapping available\n");
 
 	BUG_ON(!page->mapping);
+	INIT_LIST_HEAD(&page->lru);
 	page->index = vmf->pgoff;
 
 	vmf->page = page;
@@ -122,17 +123,24 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	 */
 	lock_page(page);
 
+	/*
+	 * This check is to catch the case where a new process could start
+	 * writing to the same page through a new PTE. This new access
+	 * can cause a call to .page_mkwrite even if the original process'
+	 * PTE is marked writable.
+	 *
+	 * TODO: The lru field is owned by the page cache; hence the name.
+	 *       We dequeue in fb_deferred_io_work() after flushing the
+	 *       page's content into video memory. Instead of lru, fbdefio
+	 *       should have it's own field.
+	 */
+	if (!list_empty(&page->lru))
+		goto page_already_added;
+
 	/* we loop through the pagelist before adding in order
 	to keep the pagelist sorted */
 	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
-		/* this check is to catch the case where a new
-		process could start writing to the same page
-		through a new pte. this new access can cause the
-		mkwrite even when the original ps's pte is marked
-		writable */
-		if (unlikely(cur == page))
-			goto page_already_added;
-		else if (cur->index > page->index)
+		if (cur->index > page->index)
 			break;
 	}
 
@@ -194,7 +202,7 @@ static void fb_deferred_io_work(struct work_struct *work)
 
 	/* clear the list */
 	list_for_each_safe(node, next, &fbdefio->pagelist) {
-		list_del(node);
+		list_del_init(node);
 	}
 	mutex_unlock(&fbdefio->lock);
 }
-- 
2.34.1

