Return-Path: <linux-fbdev+bounces-6470-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCHuN57xp2mGmgAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6470-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 09:47:26 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDF91FCD54
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 09:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43214302291B
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Mar 2026 08:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335D386C23;
	Wed,  4 Mar 2026 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRsAwE/B"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F085539478E
	for <linux-fbdev@vger.kernel.org>; Wed,  4 Mar 2026 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613976; cv=none; b=NNm1D9BNPeLikurD7nDpa+X09eJBufJAOM05ibrAYQpygqsRbukX0Ycyok42v5XEWgXXNgPwcmdsuUyufMm0f8RkrZLzkbV7k1Mgn5uz4J+qeikVVTtcBk4Z3dctOTOlySsPyop52Fx2HH+pfLtgRMFOoXfkyBpVyWDfZdpvyAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613976; c=relaxed/simple;
	bh=ch9Bjf3rYYQFZ3B+gWt24r/KcnGxHyK/TdO8+vbOhlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XdAWDGClBt1W+FLg20tNjp4I524C5TaofA+lWXco4yCZwEsb0BVd1zjV+gtEUKWvVlmrXdQNw1njoYp6o3E1BPUcE+OMAynbXMSkOVdsYLjQIuc5jXVMqgP7Rrr8WOfLWb2ftlx/J8+tg/bGuW3WJ4jyjUskrUxOAGZujkoMnEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRsAwE/B; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c70eb467cfbso944212a12.3
        for <linux-fbdev@vger.kernel.org>; Wed, 04 Mar 2026 00:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613972; x=1773218772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ntj2ZFCjKKBGx8d4Pk8uGSO7QWDo31vg+Q85kRhTYF4=;
        b=dRsAwE/Bu+CHc9Ff6N87USgYCEVQ/4pkRF16NWK+TojYpCQ+LBzuVF/sZbDV7No5Hl
         n6fmy/p8MxB9TymrbFJ/+jJnJTmAWnZ144556plJQJn1EyLTOzlbsdsDdlnqoL/qU6u8
         2KqzgVjJkzqvC4UNa9YGGWf4qW3DK/jt3PciQ9ZWi2OqOdrRyi0S2bTNlTQ9IsUourJf
         tSCfnphAr3q/3IzG7Zzh3dgWGM0+eooCN8DmWyQWEmDB77xI+hkRtooGHoLTseY+60Tx
         29SHWGFhjjS/V/ZmBTGD2V5L0Zr2t6ut06ZR77QY6SRu8V1wtvkgZcGKBGGk/ZJ+RnWB
         hAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613972; x=1773218772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ntj2ZFCjKKBGx8d4Pk8uGSO7QWDo31vg+Q85kRhTYF4=;
        b=nF7v3K0xtE2TuH+SJs5x+xU1C11mhG7TPJ7i45eByS9eXbJC+dM9a6/sdMqKvoLzia
         XjlcrRVgpEgmymziztKEQ6SSTSLr6RsCqdO+FmzfSfgveYoe4+uWMz6Nl+660yKCYzG0
         zUudzGStpwAXZ9mK7W6PH1Tv5LD2QpVAHDCCnHDUMjsYEgkBmU+0VhJhMNbKj5tMUsFE
         eBzdsgUVl1IXI/3TSYYtzbw/mi3vw5Yo1ZipSA7z7eyBQDO2L+AyzzgFK7Szb+0nuyhv
         9Xq9o+NQqoZk6iKkKpbP6c6CCSFTq8HbCfPLqAogvjPDoSL/TSD7gByrUZFG6abrJnyH
         dj5w==
X-Forwarded-Encrypted: i=1; AJvYcCWTLktXw5GOUIpNadLp1HafuY1z7Q2O0WP8j4dpYvRDDBYMK+m4UCbCxwHQBXLnIqwvfBPOpe36VlIyEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypyvSn2IJlD2zMfKykh8t6NFxGAzquIJ7y0CHMqxcYKhAmAf4n
	Q+57RmbyzRfD+jf4qATzct/wGPKSwKlJAHrIxSIKJIHDAgJl9+WXwKUD
X-Gm-Gg: ATEYQzzFyedL9WqJakXx0/CXhjxZDn0X/vK9TaxJ0JBAs4zBZDZooBVRUinLs5W6lXj
	fc4Of+pZLSqGH6v2rkT2nVkUNhSzD4g2xWo5SE8JSTLvOkoZsUNSOEbOPsuSFaP+Deh5/1P+j63
	OIH5rBtxnIt2uR6oR2ZSkO387nNsxMQGCehBnDihne1yhzCC3rXQphGYHEz9b+jF5+wWcXklVNF
	W86Op5dX76p2rAXE8XJ3GG2WLz52jMidPDMriMeXGBDnfvJBvU8YoQ7TrZ68AEgCWMMH/FxvyuP
	zFMbPcJnney5OFSm3u5XpAlUju41eS2R+8UZW0myNaslb6YsB+rRzvQxWVD80cyDJyXGVzMIIPT
	aX7ofbOgE8a0Ny/IASzTC7EVLgY8wmhWlQQ8O82iXBfe5IkRFLMSBWKK9H1BowtVhclGgsdWKCy
	vcLlvvE+gtYciW3HNIt8AoJPodfUI6D9zCDjE2vMCltG1SjMrFSYinOTDsetM3LQGTHN3uvIM/M
	AW0hhuWx2wq6pw=
X-Received: by 2002:a17:902:d50f:b0:2ae:59e0:5127 with SMTP id d9443c01a7336-2ae6ab51eeamr11142715ad.3.1772613972063;
        Wed, 04 Mar 2026 00:46:12 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:11 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 4/6] staging: sm750fb: sm750_hw_imageblit: propagate de_wait() error
Date: Wed,  4 Mar 2026 14:15:43 +0530
Message-Id: <20260304084545.156170-5-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9DDF91FCD54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6470-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Propagate the error from accel->de_wait() instead of returning -1.
The caller treats all non-zero return values as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index f2fde011e7ca..7d11810864ae 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -325,15 +325,16 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	unsigned int ulBytesRemain;
 	unsigned int de_ctrl = 0;
 	unsigned char ajRemain[4];
-	int i, j;
+	int i, j, ret;
 
 	startBit &= 7; /* Just make sure the start bit is within legal range */
 	ulBytesPerScan = (width + startBit + 7) / 8;
 	ul4BytesPerScan = ulBytesPerScan & ~3;
 	ulBytesRemain = ulBytesPerScan & 3;
 
-	if (accel->de_wait() != 0)
-		return -1;
+	ret = accel->de_wait();
+	if (ret)
+		return ret;
 
 	/*
 	 * 2D Source Base.
-- 
2.34.1


