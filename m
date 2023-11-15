Return-Path: <linux-fbdev+bounces-68-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464177EC086
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 11:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE0202804DE
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Nov 2023 10:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2AEB1400B;
	Wed, 15 Nov 2023 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sDv/MVD9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1kUOYt/9"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C7EDF68
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 10:30:06 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1B2185
	for <linux-fbdev@vger.kernel.org>; Wed, 15 Nov 2023 02:30:01 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37DFE22920;
	Wed, 15 Nov 2023 10:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700044199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnvWOFzpAeGZYBKuQhlqCvVFEEbpRzhtSQSe0rVx5Go=;
	b=sDv/MVD9oHyhuynluyexjh2duL+LNImYQtCrmpZvppyjd22qSZG+bgvBBPt3rPddzo+VIe
	gzi//cqQXLQ08gh4BAF+EExIH/auv2+X8gKkons48iDtI9ZkRnB6rryc75Rou7RSAXmjXk
	9/qYGopZn10yuEU7t2FNQarCxxicwpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700044199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NnvWOFzpAeGZYBKuQhlqCvVFEEbpRzhtSQSe0rVx5Go=;
	b=1kUOYt/9KsKdK/oN9oxoZX43ddsfO2inVQNFagnItLBFB0i2XQuBn+hO333af4VqopdAMO
	g40O3zzkTG7peLAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0ABBB13592;
	Wed, 15 Nov 2023 10:29:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GI3HAaedVGV+UAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:29:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/32] fbdev/au1200fb: Set FBINFO_VIRTFB flag
Date: Wed, 15 Nov 2023 11:19:21 +0100
Message-ID: <20231115102954.7102-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115102954.7102-1-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.11
X-Spamd-Result: default: False [-3.11 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_MISSING_CHARSET(2.50)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[50.18%]

The au1200fb driver operates on DMA-able system memory. Mark the
framebuffer accordingly. Helpers operating on the framebuffer memory
will test for the presence of this flag.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/au1200fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 98afd385c49cd..817c1ebb625b6 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1568,6 +1568,8 @@ static int au1200fb_init_fbinfo(struct au1200fb_device *fbdev)
 	fbi->fix.mmio_len = 0;
 	fbi->fix.accel = FB_ACCEL_NONE;
 
+	fbi->flags |= FBINFO_VIRTFB;
+
 	fbi->screen_buffer = fbdev->fb_mem;
 
 	au1200fb_update_fbinfo(fbi);
-- 
2.42.0


