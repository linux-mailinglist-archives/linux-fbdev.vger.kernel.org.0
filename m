Return-Path: <linux-fbdev+bounces-5978-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNZ+GlaBemnx7AEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5978-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 22:36:22 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E652A9254
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 22:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6ECF23005A91
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 21:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C471532E739;
	Wed, 28 Jan 2026 21:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="i1/0Za00"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D6C32E732;
	Wed, 28 Jan 2026 21:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769636179; cv=none; b=FKG/0dREWqMZVRBPfYJMZRt/odgSP9ctHaRaBpboEuyDr3ycqYzq6CY90HL/akkjWGtcLassbW9bLMYMcMV0K70ixxeGhMRt/rZOspcimk1fhXedhDIqIHZO1VUN0ypuRzPtHMphTrFV4Dw1haINGzKWV9YSoB62KCJ2qokaZdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769636179; c=relaxed/simple;
	bh=DxIIjQuFx2X5vwctTB73xzLfmTjQiro48BHWprUY6kE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AZ5TkDrZckZItK19/c08A+WMxpl+t7E+5qpBdOq+L43/8SuPMlCA4mCcQT5ESUXZWtQ7ooWbcyYQw1Y8R/OwJ/KXfAR7c/K0qd/qB7waNzjVw/iRbtthrhjEJZo0H6iTFAMM9pJqk5Kl3pGJsrqxqi9kkwalG+eSls5+blRAVNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=i1/0Za00; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Received: from cyber-villager.home
 ([IPv6:2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38])
	by smtp.orange.fr with ESMTPA
	id lD4SvI2AvEcXwlD4Svk1IB; Wed, 28 Jan 2026 22:27:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1769635650;
	bh=esahnId/W+bwrnYCC8NREjRi6iSOW0UNlTcA4g2FuLk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=i1/0Za00yQcwQ8kzuBpu4B/eky+iIvduq/rDDVCPbGdwU2k28XmQCxFNTNb0B3cB8
	 k3q9yP+BSsqC926s3ILm9A7eFiERVma+qC8SKnz6XZoN1z2F/pYYRABFE5SFCbQbie
	 a0J2Zitmd2KrUKrDXXQSzcrFbt5mGEnUAyH4UCC/HGQ22Nv7PP5/L1YylFvdoXkE7S
	 Ardxjjqm2Uih8Y4l2Ve0IVnB6cOcM6kiAy2E/yoRz0mLOq1m1vl3vg8Sp1rqz6pCEJ
	 6lRkVBoRxv63lUxEbv9Dzi9H69TPU7oc6wf99eUt30gPAbbduxSK7U9vSSEwL0Qp5/
	 foBI3NGbJNzxw==
X-ME-Helo: cyber-villager.home
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Wed, 28 Jan 2026 22:27:30 +0100
X-ME-IP: 2a01:cb1c:8326:c500:bfc0:b7c5:d0ed:4f38
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: use guard() to simplify code
Date: Wed, 28 Jan 2026 22:26:42 +0100
Message-ID: <20260128212644.1170970-1-paul.retourne@orange.fr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[orange.fr,quarantine];
	R_DKIM_ALLOW(-0.20)[orange.fr:s=t20230301];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[orange.fr,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-5978-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[orange.fr];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.retourne@orange.fr,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[orange.fr:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[orange.fr:email,orange.fr:dkim,orange.fr:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E652A9254
X-Rspamd-Action: no action

Use guard() to simplify mutex locking. No functional change.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/fbtft/fb_ssd1305.c  | 4 ++--
 drivers/staging/fbtft/fb_ssd1306.c  | 4 ++--
 drivers/staging/fbtft/fbtft-sysfs.c | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1305.c b/drivers/staging/fbtft/fb_ssd1305.c
index 020fe48fed0be..d9215cb35e8f8 100644
--- a/drivers/staging/fbtft/fb_ssd1305.c
+++ b/drivers/staging/fbtft/fb_ssd1305.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
+#include <linux/cleanup.h>
 
 #include "fbtft.h"
 
@@ -35,12 +36,11 @@ static int init_display(struct fbtft_par *par)
 	par->fbtftops.reset(par);
 
 	if (par->gamma.curves[0] == 0) {
-		mutex_lock(&par->gamma.lock);
+		guard(mutex)(&par->gamma.lock);
 		if (par->info->var.yres == 64)
 			par->gamma.curves[0] = 0xCF;
 		else
 			par->gamma.curves[0] = 0x8F;
-		mutex_unlock(&par->gamma.lock);
 	}
 
 	/* Set Display OFF */
diff --git a/drivers/staging/fbtft/fb_ssd1306.c b/drivers/staging/fbtft/fb_ssd1306.c
index 478d710469b91..c230d599ff928 100644
--- a/drivers/staging/fbtft/fb_ssd1306.c
+++ b/drivers/staging/fbtft/fb_ssd1306.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
+#include <linux/cleanup.h>
 
 #include "fbtft.h"
 
@@ -34,12 +35,11 @@ static int init_display(struct fbtft_par *par)
 	par->fbtftops.reset(par);
 
 	if (par->gamma.curves[0] == 0) {
-		mutex_lock(&par->gamma.lock);
+		guard(mutex)(&par->gamma.lock);
 		if (par->info->var.yres == 64)
 			par->gamma.curves[0] = 0xCF;
 		else
 			par->gamma.curves[0] = 0x8F;
-		mutex_unlock(&par->gamma.lock);
 	}
 
 	/* Set Display OFF */
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index e45c90a03a903..72d6cf899336e 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/cleanup.h>
+
 #include "fbtft.h"
 #include "internal.h"
 
@@ -95,14 +97,13 @@ sprintf_gamma(struct fbtft_par *par, u32 *curves, char *buf)
 	ssize_t len = 0;
 	unsigned int i, j;
 
-	mutex_lock(&par->gamma.lock);
+	guard(mutex)(&par->gamma.lock);
 	for (i = 0; i < par->gamma.num_curves; i++) {
 		for (j = 0; j < par->gamma.num_values; j++)
 			len += scnprintf(&buf[len], PAGE_SIZE,
 			     "%04x ", curves[i * par->gamma.num_values + j]);
 		buf[len - 1] = '\n';
 	}
-	mutex_unlock(&par->gamma.lock);
 
 	return len;
 }
@@ -124,11 +125,10 @@ static ssize_t store_gamma_curve(struct device *device,
 	if (ret)
 		return ret;
 
-	mutex_lock(&par->gamma.lock);
+	guard(mutex)(&par->gamma.lock);
 	memcpy(par->gamma.curves, tmp_curves,
 	       par->gamma.num_curves * par->gamma.num_values *
 	       sizeof(tmp_curves[0]));
-	mutex_unlock(&par->gamma.lock);
 
 	return count;
 }
-- 
2.52.0


