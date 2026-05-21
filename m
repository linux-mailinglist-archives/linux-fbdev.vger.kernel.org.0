Return-Path: <linux-fbdev+bounces-7334-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMwYBMBuD2oDMQYAu9opvQ
	(envelope-from <linux-fbdev+bounces-7334-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 May 2026 22:44:48 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CCA5ABDDA
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 May 2026 22:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40D1E301DCC2
	for <lists+linux-fbdev@lfdr.de>; Thu, 21 May 2026 20:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A29D3F54CB;
	Thu, 21 May 2026 20:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="ggghTuOV"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A31733F59E;
	Thu, 21 May 2026 20:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396284; cv=none; b=RKYR3NSI6pKBBvqjbsXzd4AJUlB85fJMorM6gAPp35XkFUwkugKCk4g9JMa8J0sUPOZJoMReRvdYoE0bfW/k7B+GrxDO9/FfVno06EF8iMopKmAlCWCggcvTvPhA8Cmjp4hB9QiR/ioHHm9JpJVooKbvIpljbDwqn0aGBh5RJ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396284; c=relaxed/simple;
	bh=U+mjeFBvd5jXT7BUeSO72bx8hbUjfXFQvTWwlgahahw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSNSjVdAcwMmsXKEBVZLS0bEm2uq11zmc30Io3yyqonT1wcCt0eO+qI707CFTOLmEm9Ha1tItBtxCra9Nqpn1ECc7p495GTMk7rQGGEjv8M2cxF04l1VlsA9uTqqxSci9Bl1HvLHyBBinlYlQFNqAQ5C4yy+FDRlRGUDsPrDk20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=ggghTuOV; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:190d:0:640:bab5:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id BCCF0C00EE;
	Thu, 21 May 2026 23:44:32 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp) with ESMTPSA id SiaXmd1ec0U0-SuJSHUkj;
	Thu, 21 May 2026 23:44:32 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779396272;
	bh=5+mM6KPtZHiSrppUZfbtbISzRq+n70tpqAADZy/kYSA=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ggghTuOVjKYeiRHx4VrLdGYb5D0sE5iCq+r2IutPUiK5Jz8jSNCldr2CrAoVHc9x1
	 WyH5jT0bLYVTJ4WD5dLjPEybc3ehY66lbbessSYuphNtxkR65FKTUrMrCIVN/FfHYf
	 FGcDQdsCFQ4iV5tkAClkNyM4c33kt+ifHtFRst5o=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH] staging: sm750fb: gate dualview dataflow using g_dualview
Date: Thu, 21 May 2026 20:44:25 +0000
Message-ID: <20260521204425.82627-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sezginduran.net];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7334-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sezginduran.net:email,sezginduran.net:mid,sezginduran.net:dkim]
X-Rspamd-Queue-Id: 58CCA5ABDDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In sm750fb_setup and sm750fb_set_drv functions, the dualview
related code is guarded by `sm750_dev->fb_count > 1` condition.
That value is updated only after each framebuffer is registered,
while both guards are used before any increment.

Current flow:

  lynxfb_pci_probe()
    sm750fb_setup()                 // fb_count is 0
    for each fb:
      sm750fb_framebuffer_alloc()
        lynxfb_set_fbinfo()
          sm750fb_set_drv()         // fb_count is 0 or 1
        register_framebuffer()
        sm750_dev->fb_count++;      // fb_count is incremented

Thus even if `dualview=1` parameter is passed down to the driver,
fb_count is never > 1 at either check, so dualview dataflows are
not selected and crtc->vidmem_size is never halved.

Use `g_dualview` global variable instead of fb_count > 1 to correctly
enable dualview capabilities.

Fixes: a3f92cc94c61 ("staging: sm750fb: replace dual member of sm750_dev with fb_count")
Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
Found by code inspection. Not tested on sm750 hardware. This restores
the gate that selects the dual-display dataflow but does not validate
the rest of that path, which has been unreachable since commit a3f92cc94c61.

 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..3a4b9c06f770 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -591,7 +591,7 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 	crtc = &par->crtc;
 
 	crtc->vidmem_size = sm750_dev->vidmem_size;
-	if (sm750_dev->fb_count > 1)
+	if (g_dualview)
 		crtc->vidmem_size >>= 1;
 
 	/* setup crtc and output member */
@@ -896,7 +896,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 
 NO_PARAM:
 	if (sm750_dev->revid != SM750LE_REVISION_ID) {
-		if (sm750_dev->fb_count > 1) {
+		if (g_dualview) {
 			if (swap)
 				sm750_dev->dataflow = sm750_dual_swap;
 			else
-- 
2.53.0


