Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81C4257B872
	for <lists+linux-fbdev@lfdr.de>; Wed, 20 Jul 2022 16:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbiGTO1m (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 20 Jul 2022 10:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234279AbiGTO1j (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 20 Jul 2022 10:27:39 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460B23ED68
        for <linux-fbdev@vger.kernel.org>; Wed, 20 Jul 2022 07:27:38 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 71350340B4;
        Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1658327254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yz7+smYS3HuO96mDgkOeccHC0wiruCJTbt1mSo6CxY8=;
        b=QYn4+z7OGKtjKPV+6oZ10A6H6a/55DPyEc5eTpgb+gKt/Qo+orfpus8sEMlP840LNd8AGf
        TjqPrrK9dArPyKrvgfCME6SO0l9Ido4ILeDqcq2GAgaLCyA9NEBbIgjWsPO+M6/JB8ZRXv
        z2nyf8HtNuBjKKuVF5CO6XRLDAqoUxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1658327254;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yz7+smYS3HuO96mDgkOeccHC0wiruCJTbt1mSo6CxY8=;
        b=jyOQSNHtmxG+RfwvTVkV7PyQazO+R47MR+fkZH62BRse9K5txob30noH5UtZRpPVmdgdFA
        feLFUNjbeLZLCFBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30F7113ABB;
        Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CJUbC9YQ2GLfHgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:34 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
        deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
        msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, geert@linux-m68k.org,
        mark.cave-ayland@ilande.co.uk
Cc:     linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/10] drm/simpledrm: Remove mem field from device structure
Date:   Wed, 20 Jul 2022 16:27:23 +0200
Message-Id: <20220720142732.32041-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720142732.32041-1-tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Remove the unused mem field from struct simpledrm_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 768242a78e2b..9fd507119372 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -217,7 +217,6 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	struct resource *mem;
 	void __iomem *screen_base;
 
 	/* modesetting */
@@ -558,7 +557,6 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 	if (!screen_base)
 		return -ENOMEM;
 
-	sdev->mem = mem;
 	sdev->screen_base = screen_base;
 
 	return 0;
-- 
2.36.1

