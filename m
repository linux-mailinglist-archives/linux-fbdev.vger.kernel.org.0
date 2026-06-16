Return-Path: <linux-fbdev+bounces-7629-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NNFWAIHRMGqbXgUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7629-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2026 06:30:57 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2F468BE8F
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2026 06:30:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TccNYtMI;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7629-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7629-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74235301A50C
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jun 2026 04:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4A73C2BAC;
	Tue, 16 Jun 2026 04:30:54 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73A1D5CC6
	for <linux-fbdev@vger.kernel.org>; Tue, 16 Jun 2026 04:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781584254; cv=none; b=eQ3pOVGiJawXk0HTujMybYoFsySI4J5cb7nRU3mRo9S+3l9KtcjfNesGcWgCwjBa6GgvqvitUjVeq0Brq66s/qEiZQAg+QqUqrAjD1PxuG8hT83f7YXMJzcsunzoLpFC3sbmT0/cXXLr+KnL/Y0eNczNh5wUE6OHnwI85/BNHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781584254; c=relaxed/simple;
	bh=DaEco1NmRJ0y/rWTYffs7dP6iGjY0Lc5lC0Z/SBdC2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VdluCE3ebiqWW4Nye4NYbVkuK6n55CFX9ROC/MfmX1HRB4mqFdFX3UCmQLNnZO+1JjXSn86Mu+ddXNZbtI+YV5xg0jFcRwhbW7XryR/+peyD4e0VnVfjVYNQf0EFqBYgHCqmpss9s0hLXvxf1BBElWqQGAt0ceC7mUHQ/AUWAXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TccNYtMI; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so32007195ad.2
        for <linux-fbdev@vger.kernel.org>; Mon, 15 Jun 2026 21:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781584252; x=1782189052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDHkAn/riVOcTXXqBqO3TP0uWOPCnLzIZS8n/LO+QSE=;
        b=TccNYtMIz1cn2fEkEzDZoMb4qIOzO5ALHWIzM15Uz/o+t1JUhvQ55NHiHNp0fMg2f/
         3xqWIuMTeEHjxBOVaQhXncd1EeHm8BosTI592xMRjc41pT1NQ/V4cPvim0tGvGBB1+Ms
         dPfDEToWd67fT2zPNiDYFXLwNpzJDqa5xkOa93CTCR7dBJ+vOkGJ1hoSCT/kNY0Nczp4
         nimCLlWGXH+emEhgUups3sk3s2VaiYHNNuVRsJXoxImKtTlUI/iajcuknegsWibrb/n+
         +lwBRXD4DcaAIfMhqUHpqqpwkYY4xLXn8K6g1WhED9D7a+lfOadgvSJJaIlGGSkiyaB+
         j3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781584252; x=1782189052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDHkAn/riVOcTXXqBqO3TP0uWOPCnLzIZS8n/LO+QSE=;
        b=URkGfVK9xu6k2zJkMWD5CDKeWbnVj0vDbXf9blrIfrSmZ9RO5oG4GVVBtZf2UdoLVJ
         LuDXjEcSinfdNBnD0R3gVt8h9KGEZx2lEW32OrnNGejsikDm/iUmqZiJ2Upi1z9bnZ7V
         PyJ+JtsZ0i9imhYUcM4cJCoYWVLHrGyLFWaRBMkUOddnhvZMT5hG56DGAsVIWrs9qeMV
         vlI1q8xctwz6ZMruVDMvPYE50+EhjVl34HU5rv5ZSnLztEmBx6EJchgfJ1laDY7GVof3
         toS3NozElPQx3I92TFW9+TgAV8P/Lx0PCvEtNQtET2yhC5RJn+kXRz8KUbjeTfwZvOLI
         fshg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ua20eJbpcDyUbntbQ1hm9RNCFroWQ7UHXJJOVZKp0p5hAhFHjQVSdCafISovTikFJXzS30p2DNStIqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtPnZ9qkkWaSTRVYAqB3oKbI/2gztFA+/m2sLyxK8KXpVEPXU
	e35hUpRtAB7/RNlMGpJs41Mo80WqCfri+4Wuh6aqRd0at3HWO+MvnXD8
X-Gm-Gg: Acq92OHTsEU57p9AQp78Nt5rh9Tznvl3N+rI3xnzRC/IsJHyrCc419aNRrqJ4ykfq7n
	oWkg9pHr8Aj/ayGDOgCwnW6uKJenLvyo/0pgQNP8syIeGVweq6FCmY1lfTjN2o80/GsZ6+GASdC
	ncLRjAzl+JvhZkLHwEoXtJAzXW1YwdegdCAqiN6D31G9xv3KnRNOo1qVmc89a/n3ROZSjQz3Hpm
	t03hf4onlnsTZnVmF4geEC7ZHrW9i/syg5jxqbaoXZczYLOJnivEQ5jxsi9HVlMYNI/yQRJ7tsU
	23O3e/D5VtaKMp82JO8MH4Z17rZ2ye0oVSMsb136nr2lG/P3EV9gac3OSj/igHv17w+fdomad+o
	UjJpgqcYAN33EslqEmygWsDPYAX5FJ4eEVO9jNdb0fDCtEZp06n8iQML/MViOv4V+56MxHqLOdA
	3niuCIuSHSS4cWDESlH/6YjD02UXO7RwlLec8wIBDD89KPmVYdyb11bKkXB/FsjKe/0X5XD/yat
	rMFHkiNMEV7BUU/tdvhTk0/sqnqfXt0a1tPLGyGygD7xkJQLGIXmuRHXPKbReLwlD/uq3p1Kas8
	qR1uRWuzYQQeYitx
X-Received: by 2002:a17:902:cf07:b0:2c2:5446:30dd with SMTP id d9443c01a7336-2c410bdb849mr205880405ad.7.1781584252505;
        Mon, 15 Jun 2026 21:30:52 -0700 (PDT)
Received: from cmpatel-home.hsd1.or.comcast.net ([2601:1c0:5780:9200:9445:e681:a5ae:95ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5374sm112635475ad.5.2026.06.15.21.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 21:30:52 -0700 (PDT)
From: Chintan Patel <chintanlike@gmail.com>
To: linux@armlinux.org.uk
Cc: deller@gmx.de,
	tzimmermann@suse.de,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3] fbdev: claim Cyber2000 SPARC I/O aperture before ioremap
Date: Mon, 15 Jun 2026 21:30:35 -0700
Message-ID: <20260616043035.11952-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,suse.de,vger.kernel.org,lists.freedesktop.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7629-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:deller@gmx.de,m:tzimmermann@suse.de,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:chintanlike@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B2F468BE8F

Claim the memory resource associated with the Cyber2000 SPARC MMIO
aperture before accessing it.

This is part of the effort to request memory regions in fbdev drivers.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
v3:
 - Use pr_err() instead of pci_err()
v2:
- Use pci_err() for error reporting instead of printk().

 drivers/video/fbdev/cyber2000fb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 2d12f8e96c7e..9fced6bf6ffd 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -47,6 +47,7 @@
 #include <linux/io.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
+#include <linux/ioport.h>
 
 #ifdef __arm__
 #include <asm/mach-types.h>
@@ -1620,9 +1621,14 @@ static int cyberpro_pci_enable_mmio(struct cfb_info *cfb)
 	 */
 	unsigned char __iomem *iop;
 
+	if (!request_mem_region(0x3000000, 0x5000, "cyber2000fb iop")) {
+		pr_err("iga5000: cannot reserve I/O area 0x3000000\n");
+		return -EBUSY;
+	}
 	iop = ioremap(0x3000000, 0x5000);
 	if (iop == NULL) {
-		printk(KERN_ERR "iga5000: cannot map I/O\n");
+		pr_err("iga5000: cannot map I/O area\n");
+		release_mem_region(0x3000000, 0x5000);
 		return -ENOMEM;
 	}
 
@@ -1633,6 +1639,7 @@ static int cyberpro_pci_enable_mmio(struct cfb_info *cfb)
 	writeb(EXT_BIU_MISC_LIN_ENABLE, iop + 0x3cf);
 
 	iounmap(iop);
+	release_mem_region(0x3000000, 0x5000);
 #else
 	/*
 	 * Most other machine types are "normal", so
-- 
2.43.0


