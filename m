Return-Path: <linux-fbdev+bounces-7968-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iHggOde7VGonqQMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7968-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 12:20:07 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D781B749B7D
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 12:20:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=URLUURKQ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7968-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7968-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF9BF3008FCA
	for <lists+linux-fbdev@lfdr.de>; Mon, 13 Jul 2026 10:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487F33D9545;
	Mon, 13 Jul 2026 10:20:01 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8426E36404D
	for <linux-fbdev@vger.kernel.org>; Mon, 13 Jul 2026 10:19:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938000; cv=none; b=GNDJUwpd5XmcTFTIepSlPBN3RdhmCULYLqKfmZBVsJ/XS/zIKmXKeiPDYpgmxRmqfayAXJxnrzNVRo/qItLUXOrg/f3rRkaoQcls16eq7p8Zlu7AbZ+Qb9waoeJqJT68MbMVm7MhVgmN6rHrIXFFa7aPFpvwU17C7QPqYd/9Ob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938000; c=relaxed/simple;
	bh=DbIl8eyUDTcDG004poG9cmmxee7SHYKNKOEke/947Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNzqCA20SJVQzrc1QuKEowMpAJrbmNsj4Igo3xVVon1ZJF330sYbswAI1YaGn55fUGg4SANc4o4O+I6pgv8dsPymRTkQl+H+Hsnx/4IzGLdnta97tBxhVz3YxqPvAbMdzR4x/Hb6y+FiTYJsSYERjhTEeHs1f5jsiI9vE/e1vwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URLUURKQ; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47362928f65so2905670f8f.2
        for <linux-fbdev@vger.kernel.org>; Mon, 13 Jul 2026 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783937998; x=1784542798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N9jAAyHAI2D1PucdtnorXSHGwmyQhG7HWP4Mt9DkiF0=;
        b=URLUURKQxH6/IDBw/Edk+PoecvMkAIGZJ/wj+3mtyMzZoDs09AgZiIkiTyxv3tyOJN
         QitwnPn5klRiXbmjekmiCuuaE7XQIB41pg9yP690iLO5GasgxFp7XCytwAMSLTo6fuFX
         ImxG0AmhmrDfcGmNi68XIhcH8M+lwXEEwVGVWkbeODZ3ZANIU0QkM0ewCTMvWayrY0E9
         hcBzQg1VjeuPIZoHpRu9OgNQ+OuOo6XV1E7HR9DsIHItOrkC3zN063SxlqrOlpft+Yw4
         jUFvEASPhbsTrlVFmn/OXUA7tPY0tFKMhf8BPYhhSMMyRaxemTsXXldwotl8JZ7QvLs3
         Duyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783937998; x=1784542798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N9jAAyHAI2D1PucdtnorXSHGwmyQhG7HWP4Mt9DkiF0=;
        b=h2rP9Hx2ng5PWnTMi4NnJ/7VH9IBLnsDYCgp0meE6A1tJz2vaRJnFwjRJQ57w/KlXT
         G5VTFiLeqL7xPaljQc1uFScMysh35gKaGNoBTBq3lQcjeJQHDjtbbhS+m5E/Z6o7W9Xg
         Yfwt+oAgFxSfeYI8U+2elG7UiGaLFNh7afAZ/WPGGCkUxdqPc/eYXC2zWZjtqr05Z3H1
         z8z9WgWB+tSupEcWnu46/zuPxUevNxKT4X64eTCoGD9vMoU18hxwgL1VnPlmyh7m/Njj
         S0w3xtIxxAYpkHKYDuRzQX/hYcNubYyX2jyoWGIvS1zqjWqykk9uR7KjxZV3mOFe7YKM
         ZMFA==
X-Forwarded-Encrypted: i=1; AHgh+RpBHYuAUYrmvSg3ML+JX+fO692m5++87qsBrQgU2IfIqWPEyvxrFMwfW5W8e7yCgvxmPSB7SBRLoupR4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw32xUhXkpdHy+RlbGAajXugUT2FD+QMySZbJdLN2BL9MtpZfJ
	KIEcdXs+Vb3P05h7BsSP1Yhxyqu4a7RCxEo0urVSzuvsCFyYsJhvxLY=
X-Gm-Gg: AfdE7cm0mpBPuEY9MRVHbD9GtQqdXTTzoTql+R4PM2NbSDdvkUZh0ur3MWG0lfqUF8d
	kztOe/O+kgGtx9ImXhW82Y7vkTj6LmZBdwwqANDDR01BfUcjlyyPYQk8AF3lcqlyHgxvXAB4k9a
	P5lNai8rGWroxuHwTIcz5M6HZ9Llnc4bjCPOLxpXsDORO16dvOcJ8lzrFQoMblsQe6vOFO4B2/h
	k7RaJ3q1y9sdwXEX+kiEaO/bEnOgJhRRmKMNOPczAfLX3LDsG86pxbGSyehi0mp7isItlsZqwzq
	sJivJrExZ001rEYKKRmlFKwRGGpMnyOwFVKTWNMCTzQFpOwASjujm1d5hb8DTvuUdbltDFvEOPi
	39lR6GaZNFrjMaVMf2PWF7RPZaS49c3ZqmlzflNG7KP22LFOJMc0XddVRns3U5qZAkiTdI2iSPf
	Ft8h/uYOTjdJ/DQ4QCYHAOwQKvLW8+2yYXnLJc6AVAM1wLMRhJfkQIa7tKWWuj06pf9vRQwQ==
X-Received: by 2002:a05:6000:22c7:b0:472:8343:7f5e with SMTP id ffacd0b85a97d-47f2dc8ce54mr9184872f8f.5.1783937997743;
        Mon, 13 Jul 2026 03:19:57 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:ceac:ba6c:1653:e93a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm83332478f8f.34.2026.07.13.03.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:19:57 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Helge Deller <deller@gmx.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Florian Fuchs <fuchsfl@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] fbdev: pvr2fb: correct user pointer annotation and sentinel initializer
Date: Mon, 13 Jul 2026 12:16:38 +0200
Message-ID: <20260713101638.600333-1-fuchsfl@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,vger.kernel.org,lists.freedesktop.org,gmail.com,intel.com];
	TAGGED_FROM(0.00)[bounces-7968-lists,linux-fbdev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:glaubitz@physik.fu-berlin.de,m:u.kleine-koenig@baylibre.com,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:fuchsfl@gmail.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fuchsfl@gmail.com,linux-fbdev@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,physik.fu-berlin.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fuchsfl@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D781B749B7D

Add __user annotation to buf, as it is passed as a user pointer in
pin_user_pages_fast(). Use an empty initializer for the sentinel
board-table entry to avoid initializing a function pointer with an
integer literal.

Fixes: 5f566c0ac51c ("fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607131247.fpQ6eTc7-lkp@intel.com/
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
Not sure, if we do such changes, but as I received a test robot email, I
leave it up to you all :) (I also compiled and tested the change)

 drivers/video/fbdev/pvr2fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 9428716e2dc4..a6e7abca7a06 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -639,7 +639,7 @@ static irqreturn_t __maybe_unused pvr2fb_interrupt(int irq, void *dev_id)
 }
 
 #ifdef CONFIG_PVR2_DMA
-static ssize_t pvr2fb_write(struct fb_info *info, const char *buf,
+static ssize_t pvr2fb_write(struct fb_info *info, const char __user *buf,
 			    size_t count, loff_t *ppos)
 {
 	unsigned long dst, start, end, len;
@@ -1077,7 +1077,7 @@ static struct pvr2_board {
 #ifdef CONFIG_PCI
 	{ pvr2fb_pci_init, pvr2fb_pci_exit, "PCI PVR2" },
 #endif
-	{ 0, },
+	{ },
 };
 
 static int __init pvr2fb_init(void)
-- 
2.43.0


