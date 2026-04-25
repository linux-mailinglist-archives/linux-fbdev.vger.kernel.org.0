Return-Path: <linux-fbdev+bounces-7067-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDCHNGlm7GnoYQAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7067-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Apr 2026 08:59:53 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DD4653EC
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Apr 2026 08:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7644300E3AE
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Apr 2026 06:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA16311979;
	Sat, 25 Apr 2026 06:59:49 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA740DFB9;
	Sat, 25 Apr 2026 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100389; cv=none; b=nhej6zLkTaqZv2mwfC9dcdki2S4HjquV3WYlxbjBFtY1XGVljYwQryQK5MUlXpvb4pQ8Gk8rvFlusvqUS5lDxwxXoMtVfjYq3ITdSZT17t1jWbkuIWdDhgOhgyTsAk2EomrUElPrLKVVhqISw3nw80h+F1qO0GCTiBZGnsu5OGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100389; c=relaxed/simple;
	bh=hnWD1AVyRSKxtXt/+A1gcL0PooGfKrpHM0Ap0tUdr3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uCZC2XJT10EDh+hui+6lv4u9C3+RKEMQXAts2zBMdCPMJ3tCXYk7mBB2WDS8XX1NjDjKEAFMiiWtDc3kZGhjP3adlwXWXxO2ArntriMhjJ7QJjGB8WOd8K7J6QEBRv4yh8s68Y3fEUNe2KMM7y+JRU+uSFecFCaeJPSgElF/PnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 549674b2407411f1aa26b74ffac11d73-20260425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:810e43dc-ea30-4cf2-8878-d40099abd163,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3da8c7107d9290cc6c015d2d1491a4c0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 549674b2407411f1aa26b74ffac11d73-20260425
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1225850773; Sat, 25 Apr 2026 14:59:40 +0800
From: Ai Chao <aichao@kylinos.cn>
To: deller@gmx.de,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk,
	dilinger@queued.net,
	adaplas@gmail.com,
	James.Bottomley@HansenPartnership.com,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org,
	kees@kernel.org,
	rene@exactco.de,
	tzimmermann@suse.de,
	rongqianfeng@vivo.com,
	thorsten.blum@linux.dev,
	chelsyratnawat2001@gmail.com,
	soci@c64.rulez.org,
	gregkh@linuxfoundation.org,
	daniel@thingy.jp,
	linmq006@gmail.com,
	fourier.thomas@gmail.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-geode@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 01/35] fbdev: matroxfb: Use safer strscpy() instead of strcpy()
Date: Sat, 25 Apr 2026 14:58:52 +0800
Message-Id: <20260425065926.1091168-2-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425065926.1091168-1-aichao@kylinos.cn>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 245DD4653EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-7067-lists,linux-fbdev=lfdr.de];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.de,microchip.com,bootlin.com,tuxon.dev,armlinux.org.uk,queued.net,gmail.com,HansenPartnership.com,kernel.org,exactco.de,suse.de,vivo.com,linux.dev,c64.rulez.org,linuxfoundation.org,thingy.jp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aichao@kylinos.cn,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.932];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Use a safer function strscpy() instead of strcpy() for copying to arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 drivers/video/fbdev/matrox/matroxfb_base.c  | 6 +++---
 drivers/video/fbdev/matrox/matroxfb_crtc2.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index e1a4bc7c2318..bd786543478c 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -709,7 +709,7 @@ static void matroxfb_init_fix(struct matrox_fb_info *minfo)
 	struct fb_fix_screeninfo *fix = &minfo->fbcon.fix;
 	DBG(__func__)
 
-	strcpy(fix->id,"MATROX");
+	strscpy(fix->id, "MATROX");
 
 	fix->xpanstep = 8;	/* 8 for 8bpp, 4 for 16bpp, 2 for 32bpp */
 	fix->ypanstep = 1;
@@ -1091,8 +1091,8 @@ static int matroxfb_ioctl(struct fb_info *info,
 				struct v4l2_capability r;
 
 				memset(&r, 0, sizeof(r));
-				strcpy(r.driver, "matroxfb");
-				strcpy(r.card, "Matrox");
+				strscpy(r.driver, "matroxfb");
+				strscpy(r.card, "Matrox");
 				sprintf(r.bus_info, "PCI:%s", pci_name(minfo->pcidev));
 				r.version = KERNEL_VERSION(1,0,0);
 				r.capabilities = V4L2_CAP_VIDEO_OUTPUT;
diff --git a/drivers/video/fbdev/matrox/matroxfb_crtc2.c b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
index 8de882b09a24..c20dd06c5fcd 100644
--- a/drivers/video/fbdev/matrox/matroxfb_crtc2.c
+++ b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
@@ -299,7 +299,7 @@ static void matroxfb_dh_init_fix(struct matroxfb_dh_fb_info *m2info)
 {
 	struct fb_fix_screeninfo *fix = &m2info->fbcon.fix;
 
-	strcpy(fix->id, "MATROX DH");
+	strscpy(fix->id, "MATROX DH");
 
 	fix->smem_start = m2info->video.base;
 	fix->smem_len = m2info->video.len_usable;
-- 
2.34.1


