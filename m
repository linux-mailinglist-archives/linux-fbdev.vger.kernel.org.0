Return-Path: <linux-fbdev+bounces-6511-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGVlNy8UrmmI/QEAu9opvQ
	(envelope-from <linux-fbdev+bounces-6511-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 01:28:31 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A9B232DD7
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 01:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57665301C3FB
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Mar 2026 00:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A82226D00;
	Mon,  9 Mar 2026 00:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ned59C6I"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F2919F13F
	for <linux-fbdev@vger.kernel.org>; Mon,  9 Mar 2026 00:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773016095; cv=none; b=o17YMYC9ZTWRAo5LPn4XS4QAjbBRsGH1Kq7kigZMuF1q0Y3tIdcJWdL9kY5Q+iPK2M8wbbM6TUBQ1zZoGqEcSYOc5pdkBlSEsTUyJTuzGoWaU0xINOcpTzegEzPWMvitdsWsmHtCLHBosIFrXIoXBqfwcPicRryhbsP/u1+2Nf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773016095; c=relaxed/simple;
	bh=mBr01td4BCvpqI5GZ0lfJ69/mbIPnGmmAZ6z106k/NI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SNP+WTif8rzW+B/OREDlQR9zx3RX6MKiQ4WPAxbAQCMd1fX3k8n0/qKCEBGfdoFogEbJdCQH+HYe2f6DQnO31JrVkMPYiJB9B7dNtka3BJy+Wi6KuT4ub4TiNLiBRXmsLWZaOtSovV7zPOP6C1N5IZreJiEfmQsGh2dxaqIS5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ned59C6I; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso7249211241.1
        for <linux-fbdev@vger.kernel.org>; Sun, 08 Mar 2026 17:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773016092; x=1773620892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTPcH67gBIMYWJG75czRVYMRcOaSA8FrrCACoKPG3Vw=;
        b=ned59C6IiiGsNB6oOas5gtxdUNAiIweAyo1IozqJV2r/1z+WmFE9u5DsUAU/QyiAh+
         I0g2fe0AsBL5rMS3mshmwEXVPhJlaSXLmTyBJ+ToHxXrDHlxA+G5+z/iuzrvJlpDMFH4
         +QegfA+nDBU06VVYbcr+UQ6IjkJE3PUXNgjAnJU9Am3O4i0aragzdFuNkmO55LpI7jQx
         kW1wIt/gDuol9pR2SUJyoVOIFrDCF1aLClT9EazCl5C/4ahTXYxjAZ/uXwNR5Ra3n6ww
         5HqJ3prtq+yoAhZjXTU3dSit8J0vbyFDAT70/39DFHwMrOghu4X2RmLkJ1ygbrGdzGEl
         jfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773016092; x=1773620892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTPcH67gBIMYWJG75czRVYMRcOaSA8FrrCACoKPG3Vw=;
        b=Eekmai/SVKMU1rvZPwF696WjwScue84W1/gQhh4LtIi58f+tzejV4KjyXxbHdPPXYV
         63Axgs3Jgi+8jSQYHd/+ou+NEbA2uz+GoVJkoBd5ws35vhm3pwqjAGwsh4REIC50U+Dl
         +T9lqk1WhR+NV3uWCo72SzFb1N3ABK20VkXdC23EnsbX6N7tASUBAaexieCwLV7ZuB9w
         fKjIXGtbrvaxw/MuXEbgzjPbS3E3gAbIw43fMWreUsa+TmzvyV9CGmSWH4jMNIwA2GwX
         WhiYeHlJIHqpVECaljRhidOp9ViUaUgl0+XIy4O54y5NHWsegHN1xGd/VJ24afo2EzbU
         oa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTUi3FsyLdtAQ5l+pSaqM4/gdQGMeQrEDIvxsttu84jmjScjmah6xcHzDDqdplUSNz6EBPWQSGY+unGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMtW+/H7VV4W0DTvPxfd2cj6AkVJBAq0Mh2JqseRIPAYG8Qgi
	f5rYgssedpyAETBSSkg60XCQgXCOtx2SUfmA2UExsDDU1kexeJsIv6kR
X-Gm-Gg: ATEYQzxsHq1XPY97GJyVjGdg68vEgVNI4do0/6BcO4iQk9iTTUOecBYYNguq/80AGCK
	+gIUING9U+v2sl59rzz3Ir92cSgEa+DyK7CbdIn1Y4hpcc5/yrVxnzs4ypAiJG7+3qYCoErferk
	jwpgRp4KN0IowDZhN5Zn61W3oe067H4AO4RMvbZvfYRpRNzqQr7TCW5n9mZIJzp7R7WGjDatDCI
	L8ldzaudu/pU3r90aP6hJdj133715DAT8p0NCQ6jujOrUgOfP8VMlUQDxc1n5jX9uJRkDWXELX/
	L5cR/eY5h3//CRMWBfBCqlNUDlX4nuO9fSIO0xlUvzuWpDWKnfTvWOTRfCPQmzFpikaP9+c9Mqy
	BYtBr3IiHrXK4nUu590b8JXyZpVASHVmxTY7+ZYZbjDF90xnzO/LDu+IDRndZ338IBIouRVQ9OY
	gyU53hJjcy5AFrVw==
X-Received: by 2002:a05:6102:50a6:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-5ffe6124a7bmr4227595137.23.1773016092039;
        Sun, 08 Mar 2026 17:28:12 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b38e378sm7523203241.7.2026.03.08.17.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:28:11 -0700 (PDT)
From: sluisr <luistermc789@gmail.com>
X-Google-Original-From: sluisr <contact@sluisr.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sluisr <contact@sluisr.com>
Subject: [PATCH] staging: sm750fb: fix static const char * warning
Date: Sun,  8 Mar 2026 18:28:09 -0600
Message-ID: <20260309002809.15746-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 44A9B232DD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-6511-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luistermc789@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.984];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sluisr.com:mid,sluisr.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.60:email,checkpatch.pl:url]
X-Rspamd-Action: no action

This patch fixes a checkpatch.pl warning:
WARNING: static const char * array should probably be static const char * const
by adding the missing const keyword to the g_fbmode array declaration.

Signed-off-by: sluisr <contact@sluisr.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index dec1f6b88..08d4979c6 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.53.0


