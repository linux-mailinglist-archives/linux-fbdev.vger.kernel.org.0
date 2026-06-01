Return-Path: <linux-fbdev+bounces-7456-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGWiBmo8HWoqWQkAu9opvQ
	(envelope-from <linux-fbdev+bounces-7456-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 01 Jun 2026 10:01:46 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BD761B3AB
	for <lists+linux-fbdev@lfdr.de>; Mon, 01 Jun 2026 10:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88C8B3010C12
	for <lists+linux-fbdev@lfdr.de>; Mon,  1 Jun 2026 07:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16482388869;
	Mon,  1 Jun 2026 07:54:38 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE63E38837C;
	Mon,  1 Jun 2026 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300478; cv=none; b=M6q4DIsIkon6GFq8G3Q8rzq7j89a4YDciALpB3mFgJvyeRen22eX5iE7692JMS81BR5x0v/FM8COfjHm8EjqDDHs+Ao8sYffvngUMfoWQgRMGUF2xrGHv5CwAvH7lXGevAsdgE7fjhHaS5AHmbCyj1oqeVUGFN2mkQmxhstKU0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300478; c=relaxed/simple;
	bh=UA6lVnaUVFnSloqLbYBnYV5Y1adVW3NBuBmUfd7DNq8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QG3Rh6w2MeM6GkGiTPAIWTVnUIUQ8pD1GWkeW9uL6NqrujeVDERMo3xj+PCuqTGt3wTzPaawAfsb5e/VYru/VuvwFMzgDOpqhGwZPIeOOCyBgQMQU2sdY669pkt2gWkb0A/mpAIZPzq8hQt4cWHYWQhxZa3IPNYNfP2cJiT8kJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1d3be2805d8f11f1aa26b74ffac11d73-20260601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:fedfcc34-84aa-469c-a9e9-4b4170d56118,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c9f868013bde326e382fa55a7c858271,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|850|865|898,TC:nil,Content
	:0|15|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d3be2805d8f11f1aa26b74ffac11d73-20260601
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1752011668; Mon, 01 Jun 2026 15:54:27 +0800
From: yaolu@kylinos.cn
To: deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	yaolu@kylinos.cn
Subject: [PATCH v2] fbcon: do suspend/resume only when vc is text mode and visible
Date: Mon,  1 Jun 2026 15:54:23 +0800
Message-Id: <20260601075423.543611-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <67a1f756-996c-404b-8eff-f705ff151ed3@gmx.de>
References: <67a1f756-996c-404b-8eff-f705ff151ed3@gmx.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	SUSPICIOUS_URL_IN_SUSPICIOUS_MESSAGE(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	URIBL_RED(0.50)[kylinos.cn:mid,kylinos.cn:email];
	MAILLIST(-0.15)[generic];
	HAS_ANON_DOMAIN(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[kylinos.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	TAGGED_FROM(0.00)[bounces-7456-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.974];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yaolu@kylinos.cn,linux-fbdev@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 73BD761B3AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lu Yao <yaolu@kylinos.cn>

Don't need to do suspend/resume for fbcon in graphic mode.

Doing this may cause error, eg:
  At the beginning, starting the Xorg with single screen and then an
  external screen was plugged in. After logging out in Xorg, fbdev
  info may using screen which is connected later on for info always
  using first connected connector in list in func 'drm_setup_crtcs_fb'.
  Then, S3 executed, fbcon found that the information did not match
  and do atomic to switch fb. However, Xorg will not re-bind the crtc
  fb but continues doing ioctl. At this time, the fb is incorrect.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
v1->v2: change to '==KD_TEXT' rather than '!=KD_GRAPHICS' and add
visible judgement suggested by Helge.
  Link: https://lore.kernel.org/all/67a1f756-996c-404b-8eff-f705ff151ed3@gmx.de

 drivers/video/fbdev/core/fbcon.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b0e3e765360d..ab460ba9264c 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2602,8 +2602,9 @@ void fbcon_suspended(struct fb_info *info)
 		return;
 	vc = vc_cons[par->currcon].d;
 
-	/* Clear cursor, restore saved data */
-	fbcon_cursor(vc, false);
+	/* Only in TEXT mode and visible, need to clear cursor, restore saved data */
+	if ((vc->vc_mode == KD_TEXT) && con_is_visible(vc))
+		fbcon_cursor(vc, false);
 }
 
 void fbcon_resumed(struct fb_info *info)
@@ -2615,7 +2616,9 @@ void fbcon_resumed(struct fb_info *info)
 		return;
 	vc = vc_cons[par->currcon].d;
 
-	update_screen(vc);
+	/* Graphics mode is managed by userspace */
+	if ((vc->vc_mode == KD_TEXT) && con_is_visible(vc))
+		update_screen(vc);
 }
 
 static void fbcon_modechanged(struct fb_info *info)
-- 
2.25.1


