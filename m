Return-Path: <linux-fbdev+bounces-7351-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uoOZLEE5EWoEjAYAu9opvQ
	(envelope-from <linux-fbdev+bounces-7351-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 07:21:05 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD5B5BD460
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 07:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE35230180AE
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 05:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2306430498E;
	Sat, 23 May 2026 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="cLmbDDjY"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward206d.mail.yandex.net (forward206d.mail.yandex.net [178.154.239.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A1A50276;
	Sat, 23 May 2026 05:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779513661; cv=none; b=mmIu88tNEqKcEak9uN9FmNQR2tIVTAEGFNo1asdWuiHLbMkJ6Crb3nHYpvcrPOihsw1imHkCQAIQsKHrlOAtNnAZ5gE1fH5oD8prosRkH0JEvCNvRmGvK5kGBPWZ2PowHlVBYq0FkWxkdYRTjkxqndKDElz+12quWdJKUxN/tGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779513661; c=relaxed/simple;
	bh=jhAZhwYyH3z/UIhyB6X6iqPxCoGsOadQwL2r0JLKflQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAdmnffR3tedJo2SK78ymjxNt5W6inc0RYkuxZcyzekBqCDJic9itcvuoOnDSjcUHjcbU+lrmjI5BrkPOjLjre1AlDYMtH+l/9rwtZGsPLdux33reC4mLSDfePcowRzGibniFmme+pAw9/XEZudoko8+V5sf3UagNlMjeG9JWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=cLmbDDjY; arc=none smtp.client-ip=178.154.239.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward206d.mail.yandex.net (Yandex) with ESMTPS id E607881017;
	Sat, 23 May 2026 08:15:26 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:27a5:0:640:93ca:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id 08CA3C0040;
	Sat, 23 May 2026 08:15:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp) with ESMTPSA id DFNL0fJe2Ko0-PKEWkJ2t;
	Sat, 23 May 2026 08:15:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779513318;
	bh=fXeUhCQGKvbFptJcpXo4xTKVP8cMRRXUXFFOsgvWJ34=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=cLmbDDjYqM0/s3FszkQA4FXuZZCutTFV9FhaWenSkoa+ZUNgkqjXYyPjh3/u7TjW5
	 8RKhbnrkBchgpUHq2WpBWYreGQPLbpNQWy962O+0h206H/Xf+RRsD63KEB4dg4718N
	 bTbyr9+6+IdwsWEmIjoPWFZRQSPwAT+JtJa1wVZQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 1/5] staging: sm750fb: remove commented-out forward declarations
Date: Sat, 23 May 2026 05:15:05 +0000
Message-ID: <20260523051509.166152-2-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523051509.166152-1-ahmet@sezginduran.net>
References: <20260523051509.166152-1-ahmet@sezginduran.net>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sezginduran.net];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7351-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sezginduran.net:email,sezginduran.net:mid,sezginduran.net:dkim]
X-Rspamd-Queue-Id: 0AD5B5BD460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The block at the top of sm750.c declares lynxfb_ops_write() and
lynxfb_ops_read() inside a commented-out #ifdef __BIG_ENDIAN guard.
Neither function is defined anywhere in the driver, so the block
is dead. Remove it.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..02db1418476b 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -8,15 +8,6 @@
 #include "sm750_accel.h"
 #include "sm750_cursor.h"
 
-/*
- * #ifdef __BIG_ENDIAN
- * ssize_t lynxfb_ops_write(struct fb_info *info, const char __user *buf,
- * size_t count, loff_t *ppos);
- * ssize_t lynxfb_ops_read(struct fb_info *info, char __user *buf,
- * size_t count, loff_t *ppos);
- * #endif
- */
-
 /* common var for all device */
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
-- 
2.53.0


