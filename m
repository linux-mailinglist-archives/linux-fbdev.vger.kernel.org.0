Return-Path: <linux-fbdev+bounces-7023-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKYlDAiX42muIwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7023-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 18 Apr 2026 16:36:56 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51942152A
	for <lists+linux-fbdev@lfdr.de>; Sat, 18 Apr 2026 16:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBBA1304B2A0
	for <lists+linux-fbdev@lfdr.de>; Sat, 18 Apr 2026 14:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C16396B73;
	Sat, 18 Apr 2026 14:36:31 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B048D395DBC
	for <linux-fbdev@vger.kernel.org>; Sat, 18 Apr 2026 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776522991; cv=none; b=QA1+lJ2z/0rMOKSDmiqlaH8PmGyRVYQJy+yo2BZvAER7lQPcFeHAMgxuW4KZOeFUXnZCy0vt9jbCNRoFzXnFYhuR7BPW4FUXIFE0rAetLrOpaABDghXMwejuoMOBaxz6KnG59fQUpTm9NR30GlK1QODYXp/qFDX1jU5x87NFmO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776522991; c=relaxed/simple;
	bh=s1QiCuvO/yxnom0YdaAgahlW+22nZ8MdjRUuFA4w6ME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+FwYs0MysLgOZ/H9Ulq/npk6rAHe5a97Qs1QFv17Ab5k9wcUtMpL0Tvrr22BHwVOtJb8V40Lfi0PzsJrw++Wj5nVLKFJnM+uIqM3RN8D/pHhtXea/776dQKvZqZd+2gKjfLF32vs3esHyRnhC4HOk/oEhtL+A0hD+RmJ+WeuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=crimson.net.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488d2079582so17839465e9.2
        for <linux-fbdev@vger.kernel.org>; Sat, 18 Apr 2026 07:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776522987; x=1777127787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8Myl5eTPvtfBTYrdmzc0XSzpZs+RgyOgv0qYMVJpcU=;
        b=JvabbpapaG2mOjmhZvVJuUCSkGaTOGFs4bRSAJ/YCZ2/BQ97Ybh0aT4yfqU+BDVJpW
         H/NxXoGWprwn5Nqzd8lWWMYi1vH7A8OdExlvhBBTzs4+baJUBs8Bl0/rDfjC2KgKHnM4
         4/ffEBg2D9yrolYf0WProKPpAprr9r6llD24T7BDa7RKpxB4UDSThIYAMZyoPQQ6TUW2
         gCEIWKGrsNK4P/lcccKdoT1qExNGfQB1JH8fdzY42VcXEXpcl46TZ7xE5T2S9t1cWjWb
         tP54TB9z3x3RBdNyY81ohvrQfLg8t0IkfivahdjnpWDB4KCR3jg8Rmb3v81BY+/mrcOB
         5xRA==
X-Gm-Message-State: AOJu0YxrpKi/3brCBfoniNlJ5TWDfzrn3kbJvgWsV9jOLGEBNTziPZyc
	6JPef95CqL6NSRAknJ/HlfaJtfYUyWp0Rx0800NWTjMQ0OpvWElv0clu
X-Gm-Gg: AeBDietU5tNy9zHeYRsTxNIvupYWsNVZCW1iVF8uXoS/BE4Nca59xHTMv7AgX44JjmR
	zz3QJT7VOYubNroTckWjEO7ie69QgsuTu3LZYUqMdWeu42/GAg2dJi6lhB7IoW9nTPYr/7FTWG5
	vQocLpCun5BHcHCLLEf+8NrwKFHUjVnFnulQvsY74lku8BeZfYyArI54mYejUjgYl3duRFnAQJc
	2AIY9TZ1eqBf5wPUAW5B4TV5MP0lvyHcJhwjjoYBUnlV2DhgV8c6WJA9zde2XoylsN/cPkf+sXa
	T7r2Rzk9RMqySJYKltT2QZvYvw9WzWMd7JZ79yW3+9v98dJtmLGmDTxjDSbiq48ZiJSUUzt5zmo
	ZHIiH2Lc8GZaLARXRCTd2YP/Ls0bh6a2KWBOB2no2NY1d+Rh9diYG1xmn5pUgUtD5tEtnPBh7Kd
	P31GttmSEAca+YA8IWp0TB0AyNVI2YlqdZxyedUVIQz8lXbuDnhKCIza7iYKPa4ns80N4EjrXsr
	nrERH7ihZcKfvO2N4wlbrISSOf5UCc5IQ==
X-Received: by 2002:a05:600c:674f:b0:488:be21:54ae with SMTP id 5b1f17b1804b1-488fb6e9cecmr107092205e9.0.1776522987033;
        Sat, 18 Apr 2026 07:36:27 -0700 (PDT)
Received: from localhost.localdomain ([151.41.34.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm144271375e9.2.2026.04.18.07.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 07:36:26 -0700 (PDT)
From: deep@crimson.net.eu.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kenet Jovan Sokoli <deep@crimson.net.eu.org>
Subject: [PATCH] staging: sm750fb: remove unused functions
Date: Sat, 18 Apr 2026 16:36:20 +0200
Message-ID: <20260418143620.845355-1-deep@crimson.net.eu.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[crimson.net.eu.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-7023-lists,linux-fbdev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[deep@crimson.net.eu.org,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.401];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,crimson.net.eu.org:mid,crimson.net.eu.org:email]
X-Rspamd-Queue-Id: 7A51942152A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kenet Jovan Sokoli <deep@crimson.net.eu.org>

The functions sm750_enable_i2c() and sm750_hw_cursor_set_data2() are
defined and declared but never used. Following the driver's TODO list
to remove unused code, this patch deletes these dead functions.

Verified by compilation and cppcheck.

Signed-off-by: Kenet Jovan Sokoli <deep@crimson.net.eu.org>
---
 drivers/staging/sm750fb/ddk750_power.c | 17 ----------
 drivers/staging/sm750fb/ddk750_power.h |  5 ---
 drivers/staging/sm750fb/sm750_cursor.c | 43 --------------------------
 drivers/staging/sm750fb/sm750_cursor.h |  2 --
 4 files changed, 67 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
index 12834f78eef7..eaba3bc2e01a 100644
--- a/drivers/staging/sm750fb/ddk750_power.c
+++ b/drivers/staging/sm750fb/ddk750_power.c
@@ -126,20 +126,3 @@ void sm750_enable_gpio(unsigned int enable)
 
 	sm750_set_current_gate(gate);
 }
-
-/*
- * This function enable/disable the I2C Engine
- */
-void sm750_enable_i2c(unsigned int enable)
-{
-	u32 gate;
-
-	/* Enable I2C Gate */
-	gate = peek32(CURRENT_GATE);
-	if (enable)
-		gate |= CURRENT_GATE_I2C;
-	else
-		gate &= ~CURRENT_GATE_I2C;
-
-	sm750_set_current_gate(gate);
-}
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 5cbb11986bb8..1c4f054d7276 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -33,9 +33,4 @@ void sm750_enable_dma(unsigned int enable);
  */
 void sm750_enable_gpio(unsigned int enable);
 
-/*
- * This function enable/disable the I2C Engine
- */
-void sm750_enable_i2c(unsigned int enable);
-
 #endif
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index 7ede144905c9..f0338e6e76b1 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -130,46 +130,3 @@ void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 		}
 	}
 }
-
-void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
-			       const u8 *pcol, const u8 *pmsk)
-{
-	int i, j, count, pitch, offset;
-	u8 color, mask;
-	u16 data;
-	void __iomem *pbuffer, *pstart;
-
-	/*  in byte*/
-	pitch = cursor->w >> 3;
-
-	/* in byte	*/
-	count = pitch * cursor->h;
-
-	/* in byte */
-	offset = cursor->max_w * 2 / 8;
-
-	data = 0;
-	pstart = cursor->vstart;
-	pbuffer = pstart;
-
-	for (i = 0; i < count; i++) {
-		color = *pcol++;
-		mask = *pmsk++;
-		data = 0;
-
-		for (j = 0; j < 8; j++) {
-			if (mask & (1 << j))
-				data |= ((color & (1 << j)) ? 1 : 2) << (j * 2);
-		}
-		iowrite16(data, pbuffer);
-
-		/* assume pitch is 1,2,4,8,...*/
-		if (!(i & (pitch - 1))) {
-			/* need a return */
-			pstart += offset;
-			pbuffer = pstart;
-		} else {
-			pbuffer += sizeof(u16);
-		}
-	}
-}
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index 88fa02f6377a..51ba0da0270c 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -10,6 +10,4 @@ void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
 void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
 void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
-void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
-			       const u8 *data, const u8 *mask);
 #endif
-- 
2.43.0


