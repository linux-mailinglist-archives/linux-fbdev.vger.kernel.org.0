Return-Path: <linux-fbdev+bounces-6074-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIztJb+8hGnG4wMAu9opvQ
	(envelope-from <linux-fbdev+bounces-6074-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Feb 2026 16:52:31 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F32F4CAE
	for <lists+linux-fbdev@lfdr.de>; Thu, 05 Feb 2026 16:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E0CE307A94E
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Feb 2026 15:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AB5429803;
	Thu,  5 Feb 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="S9q2AiTZ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6D429801
	for <linux-fbdev@vger.kernel.org>; Thu,  5 Feb 2026 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306545; cv=none; b=ruL1I3KbdpwPdSRfbcermybEjyVCmHjlazA3Mze6Dyp4CcyZ6gJbiDYnQQ0K1Uu9Rq3oM1WG49txo5VGwGU46lKN24Qgi/NCt1aE+UP85tDYHRdTc/Iwa69GICUz81FprpVCUzfBZEN+xbXaqP21xKF5KSZzLjtDl7qf/WJZPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306545; c=relaxed/simple;
	bh=KT9vt4/AuJB9gnyPFQWott9snEVDGPGSLzizzMFJTaQ=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=XomkApspbXw9BKEuBwfyCBWvDt1ov4PceLos9yLu52UlIwwjx3pAVSo7k+DEa8UrIWs5sLlbmWUIo+XT6BpuhmYf9vmR7jMEAxulReuq4SGnOcEJTpy8kONdmYoON6igMnw7ksk6KLBcsenRz1N5Jg9wqTAu9VL8Hlv0I5Uy6lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=S9q2AiTZ; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=0YPh/HjmuvU7JMRUiylnukr4OEpJwBqfBarHhnlUUw8=; b=S
	9q2AiTZbEn+Weh2OKU7NGTBk2QeGXellZkMWii70Pui7etiZZvzj8F5QLkhzRAv92xZQuP4qVZba7
	Sh7v+W9Wnbs+2CRK4ULQMyFOm103Ag9YTpVxtVjAxo4ILrxPvh07UJMYQxF7WT5VgOZkX2ZR8WlhC
	mZGiEV4Po5aFG1Du84rDhXDfbI2nbnz5dtw1hQpPjyKBCSLHO0nV1lMLXxwHRaXxYvYGTHV5eQtLp
	7mU79iZmM5IqmgLQKcrQPxWLWOc6EqvSQy0BBV1HDSnvUdVWrzS2fmDwgMz401epJJn/fe80aTtym
	fVgxcfSEdZ8JKj97lepo/LwuIv2HKG8Mg==;
Date: Thu, 05 Feb 2026 16:49:58 +0100 (CET)
Message-Id: <20260205.164958.765506119384437798.rene@exactco.de>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Subject: [PATCH] fbdev/ffb: fix corrupted video output on FFB1
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	R_DKIM_REJECT(1.00)[exactco.de:s=x];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[exactco.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6074-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rene@exactco.de,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[exactco.de:-];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[instagram.com:url,patreon.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,exactco.de:email,exactco.de:url,exactco.de:mid]
X-Rspamd-Queue-Id: B8F32F4CAE
X-Rspamd-Action: no action

Fix Sun FFB1 corrupted video out [1] by disabling overlay and
initializing window mode to a known state. The issue never appeared on
my FFB2+/vertical nor Elite3D/M6. It could also depend on the PROM
version.

/SUNW,ffb@1e,0: FFB at 000001fc00000000, type 11, DAC pnum[236c] rev[10] manuf_rev[4]
X (II) /dev/fb0: Detected FFB1, Z-buffer, Single-buffered.
X (II) /dev/fb0: BT9068 (PAC1) ramdac detected (with normal cursor control)
X (II) /dev/fb0: Detected Creator/Creator3D

[1] https://www.instagram.com/p/DUTcSmSjSem/

Signed-off-by: René Rebe <rene@exactco.de>
Cc: stable@kernel.org
---
Tested on Sun Ultra 2 w/ FFB1 BT9068 (PAC1) ramdac running T2/Linux.
Defines re-used from xf86-video-sunffb.
---
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index 34b6abff9493..8d77f102dd82 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -335,6 +335,9 @@ struct ffb_dac {
 };
 
 #define FFB_DAC_UCTRL		0x1001 /* User Control */
+#define FFB_DAC_UCTRL_OVENAB	0x00000008 /* Overlay Enable */
+#define FFB_DAC_UCTRL_WMODE	0x00000030 /* Window Mode */
+#define FFB_DAC_UCTRL_WM_COMB	0x00000000 /* Window Mode = Combined */
 #define FFB_DAC_UCTRL_MANREV	0x00000f00 /* 4-bit Manufacturing Revision */
 #define FFB_DAC_UCTRL_MANREV_SHIFT 8
 #define FFB_DAC_TGEN		0x6000 /* Timing Generator */
@@ -425,7 +428,7 @@ static void ffb_switch_from_graph(struct ffb_par *par)
 {
 	struct ffb_fbc __iomem *fbc = par->fbc;
 	struct ffb_dac __iomem *dac = par->dac;
-	unsigned long flags;
+	unsigned long flags, uctrl;
 
 	spin_lock_irqsave(&par->lock, flags);
 	FFBWait(par);
@@ -442,7 +445,7 @@ static void ffb_switch_from_graph(struct ffb_par *par)
 	upa_writel(par->bg_cache, &fbc->bg);
 	FFBWait(par);
 
-	/* Disable cursor.  */
+	/* Disable cursor. */
 	upa_writel(FFB_DAC_CUR_CTRL, &dac->type2);
 	if (par->flags & FFB_FLAG_INVCURSOR)
 		upa_writel(0, &dac->value2);
@@ -450,6 +453,15 @@ static void ffb_switch_from_graph(struct ffb_par *par)
 		upa_writel((FFB_DAC_CUR_CTRL_P0 |
 			    FFB_DAC_CUR_CTRL_P1), &dac->value2);
 
+	/* Disable overlay and window modes. */
+	upa_writel(FFB_DAC_UCTRL, &dac->type);
+	uctrl = upa_readl(&dac->value);
+	uctrl &= ~FFB_DAC_UCTRL_WMODE;
+	uctrl |= FFB_DAC_UCTRL_WM_COMB;
+	uctrl &= ~FFB_DAC_UCTRL_OVENAB;
+	upa_writel(FFB_DAC_UCTRL, &dac->type);
+	upa_writel(uctrl, &dac->value);
+
 	spin_unlock_irqrestore(&par->lock, flags);
 }
 

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe

