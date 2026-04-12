Return-Path: <linux-fbdev+bounces-6928-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ++TYBbjU22kzHQkAu9opvQ
	(envelope-from <linux-fbdev+bounces-6928-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Apr 2026 19:22:00 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C13E50F4
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Apr 2026 19:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA40F300103A
	for <lists+linux-fbdev@lfdr.de>; Sun, 12 Apr 2026 17:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1462DCF57;
	Sun, 12 Apr 2026 17:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvNsoH4K"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF5B4315A
	for <linux-fbdev@vger.kernel.org>; Sun, 12 Apr 2026 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014517; cv=none; b=isl6UszDpUdKZqAIjdKoyMxQmgPGh91SQQhiBqKEif3FIqhLZLwJEHgKTmkXx3iPhMlOA54d00Sj1aP2o01ia0TzybPQvggPsQxN9t26mQP7YwJtrEs6LAqnyQPU8KnTxbm1NpUmvTi1A6k23Ut0ob+tR5VR/WxPqjV99Us9fe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014517; c=relaxed/simple;
	bh=/fq4vDr56CO2k+npiEa+6hwzqLAU9ijIhxkJrtFIYjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7jkbvN2sP1oBn1zBvQAwGAA6zTmawzH77xJXtRQbne6ra0XEO+18NTigAMBbdrVX2KFW1s91gPpLsQoVjYdkDtxdb3Z5ZrT5zQEUC7WCbAU8nwINlvc3bXRy0aHjGJmhyq9Yag2Y/Lj7bwjw1swMPgCiCqa3b0rYhszTxKybOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvNsoH4K; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so13959415e9.2
        for <linux-fbdev@vger.kernel.org>; Sun, 12 Apr 2026 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776014514; x=1776619314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=DvNsoH4KTwXF+8mqaqg0j7iaztmaJB2rvg7bWzXyisI2PBKLSYgnFJLXd/FVGiJ98M
         KhcYXrDiW49vCW+kWDXxdiUom3KzroW4raMHh6kqT9Z32A0WD2eO4Qv1DQYsrcTfdE+F
         EznpZhZuoc7TtPbOX8CCZyZHHoEGyyRjp+z5CBkQxmDNd7BqcjH+UxTrS4PIOj4+y68T
         GK1+AaZV2RuagoVrl4bYZd+DDInlsnLztjKpIT72zJL/mo/hAuepioP7SLKcsuuTgDi0
         wSr/nBaoY/K8UeOvy5LsuHVoHtQgHXVmykWOvs6ef43Yr3k+CkhIvfq5HGL3Ueq71OKY
         2tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776014514; x=1776619314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=mWM9IAjLqoUwXz5MF4faTvQkKJ9KEZRKYPpZdFsW74QG3lQyhVZcw0n0ln8iXlyPTq
         kRlj38eoKthMhuP49dbh83swU3sxPgTEWZnjiGcivUxqEDPRDADZN4i7gYZdMsFYUN7/
         c4rn8nPEkuzYbH1gZ8UKFVLd/JJJ8ohtHExtF+IaQDBYsBsP04pCkQ92/I4Zuq8Ru5zg
         uDMeiSCqRwjAz0tQx4J5nm/ClxvLw4uMldCl8SBnU6bPqC18ADmE7WYqCMm5uN8c28Fp
         l4twnt9/k7vRxn5PluddtOXdCIp3c4vJveDWnrUD1LfGZBhmFcbxo6wwvikvyxHcjgHL
         MWnA==
X-Forwarded-Encrypted: i=1; AJvYcCUXvfXqX7c+orOOlbEVLMDWKbKuilae/ZpfQ8uEir85LilKATKA0QpaKy/JMRN59XrKOBhPqPt7ULr0eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuSg3DvadqAsVkV9loQladhUtwFogcCJ3u0GHd5h2EYtRkJnRo
	n+jqHKwQuJoBJyZIdChIAWLYz4yjdBZQsSMhrFeksXNpxLlHkWTiplE9
X-Gm-Gg: AeBDievp/lqtv2Z3X+YkPJVYY8MzTuxVlZNAyVIiNbIYac5HKXZhKUHVFB3ORpMwu4q
	0UE65AWGoxz6Ubvg+k70vrxicTPMfVb7MlgJoQH6zKhhWTp8FSylkqZeC5vhUXZKUi7TM1zqBGY
	ZaXqktL4JodJ9eqif3fpqSUEWT+G0pvrFiP6TvLVTo5UaT+8gdP0sTUah8xL7HMQmp629BVNAD8
	cOyWON9ZqOQJwrIO0oRgJM2CfsgRj0FpVGOo+mRgIKlrFdnpI7dRtMqH8rYdudqVA1+LWzXkcED
	Ul9B5B58jtWbu1QczBlkAIVQSmAomuTA01PfoTkyNk0S/N2FfePuMViG7oMXMycVcPmHHY+u28K
	CZ8VBsrzDvhNKkKItxmqqs7V2SVfNdQB8ANr9hcyjGneWxrDa/1RrfF31ndtjuuUnjTMQ4HJ+n/
	RFPm/2uMPj8ngOGqHIvYOf
X-Received: by 2002:a05:600c:c0c8:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488d67bbc13mr104496465e9.4.1776014513771;
        Sun, 12 Apr 2026 10:21:53 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:58be:2682::3d6:8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5380feesm287047045e9.9.2026.04.12.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:21:53 -0700 (PDT)
From: Baker <mzndmzn@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baker <mzndmzn@gmail.com>
Subject: [PATCH] staging: fbtft: fix coding style issue in fbtft-bus.c
Date: Sun, 12 Apr 2026 12:21:46 -0500
Message-ID: <20260412172147.2817-1-mzndmzn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6928-lists,linux-fbdev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mzndmzn@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9C9C13E50F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove trailing space and comma before closing parenthesis ')' in
define_fbtft_write_reg macro as reported by checkpatch.pl.

Signed-off-by: Baker <mzndmzn@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..409770891c54 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.47.3


