Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764444C1C5C
	for <lists+linux-fbdev@lfdr.de>; Wed, 23 Feb 2022 20:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbiBWTij (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 23 Feb 2022 14:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238574AbiBWTii (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 23 Feb 2022 14:38:38 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E989748E67
        for <linux-fbdev@vger.kernel.org>; Wed, 23 Feb 2022 11:38:09 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 82667218A8;
        Wed, 23 Feb 2022 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1645645088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q745Q564KmJVNw2+KNdAukT4aGfTFfnZ3w3mvLB/yBI=;
        b=isQfLLZ9DpWAk2rSDGCL21KLsDOMYjD5QXdnu4s6oEK78zUxWmA9ty+4BUAudzzHYFTNdh
        d1u+jusnKFVDzayeXBGJPN9uCYyQrzHGHK6rjD96mW2oUSVSub5DxJZqn/JlHAHNbBcI0D
        BJBu+WrgvqZ3bNTwUQ29IeLxrCuiPiU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1645645088;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q745Q564KmJVNw2+KNdAukT4aGfTFfnZ3w3mvLB/yBI=;
        b=QKf6D2JNo1iAlFUvobGBifCYUIul/yOOjv9AMCU+uRB90EJ/zhGCRDSCyiIj/h75ZQEMQW
        VUvPjVnDxsnSJUDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4978A13DAC;
        Wed, 23 Feb 2022 19:38:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 0PHwECCNFmKfUgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 23 Feb 2022 19:38:08 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com,
        geert@linux-m68k.org, sam@ravnborg.org, kraxel@redhat.com,
        ppaalanen@gmail.com
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 5/5] drm: Add TODO item for optimizing format helpers
Date:   Wed, 23 Feb 2022 20:38:04 +0100
Message-Id: <20220223193804.18636-6-tzimmermann@suse.de>
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

Add a TODO item for optimizing blitting and format-conversion helpers
in DRM and fbdev. There's always demand for faster graphics output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 7bf7f2111696..7f113c6a02dd 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -241,6 +241,28 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 
 Level: Advanced
 
+Benchmark and optimize blitting and format-conversion function
+--------------------------------------------------------------
+
+Drawing to dispay memory quickly is crucial for many applications'
+performance.
+
+On at least x86-64, sys_imageblit() is significantly slower than
+cfb_imageblit(), even though both use the same blitting algorithm and
+the latter is written for I/O memory. It turns out that cfb_imageblit()
+uses movl instructions, while sys_imageblit apparently does not. This
+seems to be a problem with gcc's optimizer. DRM's format-conversion
+heleprs might be subject to similar issues.
+
+Benchmark and optimize fbdev's sys_() helpers and DRM's format-conversion
+helpers. In cases that can be further optimized, maybe implement a different
+algorithm, For micro-optimizations, use movl/movq instructions explicitly.
+That might possibly require architecture specific helpers (e.g., storel()
+storeq()).
+
+Contact: Thomas Zimmermann <tzimmermann@suse.de>
+
+Level: Intermediate
 
 drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
 -----------------------------------------------------------------
-- 
2.35.1

