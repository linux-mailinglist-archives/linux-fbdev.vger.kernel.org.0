Return-Path: <linux-fbdev+bounces-7072-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EfzIvJm7Gn9YQAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7072-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Apr 2026 09:02:10 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E67374654BB
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Apr 2026 09:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201483032998
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Apr 2026 07:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90AF40DFB9;
	Sat, 25 Apr 2026 07:00:02 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440E314A60;
	Sat, 25 Apr 2026 07:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100402; cv=none; b=KpnmDpK5NW9kv2YPp1heIZulPy25yuIDo9Diqo/DrfdKbFTUjxH2IITEwYxZHBWtrBGRKPivNWCyjgBxRrleBLuS7RFgrTD/Zpr9djNNCTVYGXyO6dqO+oYn0SY1ZOEtYePVZn/f4URC1EfcmZEQpuoR8p2sQ3JAs28s8XN5wi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100402; c=relaxed/simple;
	bh=IxPBa4q6LR8zsTDZVDYOs+mybClYRLeVZ2W/IZT63Bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aAkxTRrLwBCGIt0dJ3V++O+eB95cOXvOwR9IBJ60jEff/2mC6Ty6auhqwKFyu/QfOWt56Z3ZjvVAfu04FyGx7QdF4m52zpWHWfmb+YvQ587nJ9A1Op6wHqwT05SkU03xvvlTsiN/OzDwcaH7PAtOnAF8xzBK024kramb3NvSM6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5d5bf6d0407411f1aa26b74ffac11d73-20260425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:fb6979e2-a7ea-433c-8b7d-c8cb69e668b5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:839ae1e41acbd81821964f9c223aed26,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5d5bf6d0407411f1aa26b74ffac11d73-20260425
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 824995028; Sat, 25 Apr 2026 14:59:55 +0800
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
Subject: [PATCH 06/35] fbdev: tdfxfb: Use safer strscpy() instead of strcpy()
Date: Sat, 25 Apr 2026 14:58:57 +0800
Message-Id: <20260425065926.1091168-7-aichao@kylinos.cn>
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
X-Rspamd-Queue-Id: E67374654BB
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
	TAGGED_FROM(0.00)[bounces-7072-lists,linux-fbdev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.941];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:mid,kylinos.cn:email]

Use a safer function strscpy() instead of strcpy() for copying to arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 drivers/video/fbdev/tdfxfb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 4c4e53aaea3a..b7cc2b1012eb 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1401,15 +1401,15 @@ static int tdfxfb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Configure the default fb_fix_screeninfo first */
 	switch (pdev->device) {
 	case PCI_DEVICE_ID_3DFX_BANSHEE:
-		strcpy(info->fix.id, "3Dfx Banshee");
+		strscpy(info->fix.id, "3Dfx Banshee");
 		default_par->max_pixclock = BANSHEE_MAX_PIXCLOCK;
 		break;
 	case PCI_DEVICE_ID_3DFX_VOODOO3:
-		strcpy(info->fix.id, "3Dfx Voodoo3");
+		strscpy(info->fix.id, "3Dfx Voodoo3");
 		default_par->max_pixclock = VOODOO3_MAX_PIXCLOCK;
 		break;
 	case PCI_DEVICE_ID_3DFX_VOODOO5:
-		strcpy(info->fix.id, "3Dfx Voodoo5");
+		strscpy(info->fix.id, "3Dfx Voodoo5");
 		default_par->max_pixclock = VOODOO5_MAX_PIXCLOCK;
 		break;
 	}
-- 
2.34.1


