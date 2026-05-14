Return-Path: <linux-fbdev+bounces-7239-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPHQJFepBWrtZQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7239-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 12:52:07 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD115409DB
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 12:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44EF73029AE2
	for <lists+linux-fbdev@lfdr.de>; Thu, 14 May 2026 10:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2581D3B0AE1;
	Thu, 14 May 2026 10:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a26RCYjb"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964693A875B
	for <linux-fbdev@vger.kernel.org>; Thu, 14 May 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755772; cv=none; b=qTIouOFCKcAd3j6NmRroFHVPgRRuksVergKRsBM5RbbJr5ARHvQJSypn/pRwTEERahbgmxtfSZfNvA+UPetxW+/Z+OfUzY4DphSunDWYjAS1qfqI1vr9oBQbsTpE0/7MB9Nt1wdJkeOn7Y2Ai5AHKOZtpyIWVElcEGLqJq8nYBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755772; c=relaxed/simple;
	bh=QAH2odHI2FrYS4lYka64fcQ+kW9oHVF1M5JOgNxHZvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NS9tFqA0jvMRmLlMmboxW+xTqqJ0R3Z4R0u6bm+sJfoDCWUpyEhdQS+85FQ2/G3nAcJEbpYjCAJNcmuMJDK3kTfI9qxcWhPBm0SsVGW1ctRNjtw9dJ9K2f9zHUMWidbbnex0ZS5i9azFWG01fmcInR7dm06/hj7PyNVw02gSTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a26RCYjb; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8025f1c227so5881185a12.2
        for <linux-fbdev@vger.kernel.org>; Thu, 14 May 2026 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778755769; x=1779360569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WgMYeBno8yeZbjbrEdqh/ghu0I/sZGqr1DQ7BMWpFMY=;
        b=a26RCYjbqhc4CY1aYakdvC7TAiC8/UBPcQqcATJpTssDqXfatmQZTyQAg6Ku6oNOJj
         sMwu1fvDpDh43dr7Kpabk7eL9wNf6ZPsT/KOk00QhXsqENbtysqYA9VfeGxEAcU6Tkgi
         BgDTyKQUmc3qJedul20FZ7ct9jZJDprNGY3wqBnBu6kGlU/oW+vGLPc/AEqY1uQ90kRd
         0bh0iU0O44et5qG6ZToJurgFVm98p88UzBnu635gEMAmonKxNiLflsa8riRUfqAeMIEC
         y1rdC3PceauI4pKWEvp0PiNZFOjc7PgR28u/iQVGUJN5hhr47gjIT6H08HXH8pKq9Zcx
         8w8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755769; x=1779360569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgMYeBno8yeZbjbrEdqh/ghu0I/sZGqr1DQ7BMWpFMY=;
        b=PeTT9G5AcW5cPRYhBz/w1muxbd5J9VDbvbylBx2CwMQPJ+PehCrZnmB7zKOM0glDdh
         teSZcKqSNH8IDur4b5bfMxF4y3DVGQUj2OHMnMGMe4emmJfTw782U1rN+qy16tj7sQKo
         hZ4LLaYnA4yQyO/Q6GERQV5dEiW7BloAutienSwYGO8F66Az/lG2vAkwxPj9rKz7hN2Y
         8nt3TrgboB+jU6UOw0MvB7DzYWovOQvg1y99S8fUBRZT391AUnl1wm9XQarXTTpanKda
         pjgD7AZLH/1BzkHB3/NqeS/VGQsZ2+oxOzAXW8gIivf9EriySG9IpPwoPZWuWGet8trO
         H8wg==
X-Gm-Message-State: AOJu0YzjD++oOrnQT2d10isJJhSCWQ6Xj6z2/5y/H5iEUhjt1qI7m7A9
	nQ8iuMEDld27lk8g8RyOmfK+Zk2342YhVAbc4kOs1s1HCjjIVTad4wqy
X-Gm-Gg: Acq92OEicHftQ/TD++/rcn2N8opmQRt5TEoVxEcf2z1z0dt+Yk5ADTi6MtIK72GgwSt
	q0JzzbhjcqxkREOFE0d2UmWHvxosNID4cwWX1qpV4znWGt+hfh8FhDuU31RzK7+skIW63jF9zvp
	bF/JwW1i3vov5d0JuYTyOGbBGyjTLRYX+MJmghIcd+tBeOTaKR0QbH3oaQK3nM95MHsZwnXBeHS
	QlhQwKJdhZ2phalpkLQlmCy2fru5EkhJqvZAV9f8Uc/JnllYRsoszbVBcsn93JoWScuSSnhFz+x
	pGWZldFkqLHVbE9SCnPxktYyqKd0iZa5nL2IkfDIBc00YXq4P6LZpw+Yx1dlYiVyaNibwInig/E
	8bHWVrHTGcmXVYHSJ0yQjCl9StwyeXrRTspaBzXPB3uRYcStcTEB8y22ZRkSu5V7uMcHDag/TXs
	1NkHxKJeCGoEvpdkAz0lkpzGJUxKhRmudQmd2uDZe/lvEO+UonVLhCjKAUzDxLBjz+9q9Jj1o=
X-Received: by 2002:a05:6a20:a10a:b0:3a7:1d55:b634 with SMTP id adf61e73a8af0-3af83091accmr8500303637.38.1778755768745;
        Thu, 14 May 2026 03:49:28 -0700 (PDT)
Received: from localhost ([2404:7c00:52:8f0e:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1156absm2079845a12.27.2026.05.14.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:49:28 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: linux-fbdev@vger.kernel.org,
	devel@driverdev.osuosl.org,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: sm750fb: Add suspend checks to copyarea and imageblit
Date: Thu, 14 May 2026 16:34:24 +0545
Message-ID: <20260514104924.60296-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2CD115409DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7239-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,driverdev.osuosl.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yogeshdangal66@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

lynxfb_ops_fillrect() already checks info->state before accessing
the hardware 2D engine, but lynxfb_ops_copyarea() and
lynxfb_ops_imageblit() do not.

The suspend path calls fb_set_suspend(), which sets the framebuffer
state to FBINFO_STATE_SUSPENDED. Add matching state checks in the
remaining accelerated callbacks for consistency with fillrect().

This patch was developed with AI assistance and is compile-tested only.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..025ac8fe3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -204,6 +204,9 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 	struct sm750_dev *sm750_dev;
 	unsigned int base, pitch, bpp;
 
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
 	par = info->par;
 	sm750_dev = par->dev;
 
@@ -239,6 +242,9 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
 
+	if (info->state != FBINFO_STATE_RUNNING)
+		return;
+
 	par = info->par;
 	sm750_dev = par->dev;
 	/*
-- 
2.54.0


