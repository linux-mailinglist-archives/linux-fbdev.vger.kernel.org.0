Return-Path: <linux-fbdev+bounces-6202-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKA3B7ykjWlh5gAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6202-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Feb 2026 11:00:28 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8F112C221
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Feb 2026 11:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 497B030DA9C4
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Feb 2026 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B652E6CD9;
	Thu, 12 Feb 2026 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrhP+Gcp"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22992E54CC
	for <linux-fbdev@vger.kernel.org>; Thu, 12 Feb 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890249; cv=none; b=T5jL2GI1Ix6Qz/XCDy3x4b3fMpYSiTsWflN4U4VhQJ4lTwaLBV4JwvPosavbkeKBfAO+8jF5uagrBVL0lyD4HbhbZnKPW0Yup2dWUX2sUY95+ttLuUEifTTZCyeNmGSXylLm2ZHgLeXGeYEQ700KWVozAHPfHwmGn8FNOuJTbIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890249; c=relaxed/simple;
	bh=A5kxwkb9pyLuOZSYwAnJI78nrDm6G7P38RMcwSN8fek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nWZjcLZXNVtNKuY9Lo5uc/HCQRX4WC5LJkwsVDvf2u0XxSQwuKC5CPO6XIpdPLfA4qHUNfKRy1hyG2iZj5Qs+Y6ylMJFLj1fo7nAXJ/+mkLO6jrhrsTOCsMCDqfS1RVgPGAWix2tLibNKR46DOn/ecZNYklTQRuMOjFbYsFkETI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrhP+Gcp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4376bd50b01so528201f8f.3
        for <linux-fbdev@vger.kernel.org>; Thu, 12 Feb 2026 01:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770890246; x=1771495046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytyEs1/YnZxnv9lnNRonE6+DQR6UbuV0ywPhF1Dur1A=;
        b=UrhP+GcpIVYTCWwiDafI1AzRubUxe7lKA1dsE6DTjwwScS/2IRQvaNqggI7HHwubDf
         Gi14/XAJVrQX9ykJBuaaoO3BJa/+ZXwx91JTw8/pypp6wBaoydInzuKecUaolGOct8jA
         F/JlJnvqWMwTsQAZeMjRDdkPc52pq4qa/vVt1qZEtEn9NBgPYQ6+qICGqZJT2NMeuvYU
         VK7L8lS58A8VGOeiRcGwIztV431W4IivnQzLbX8UhJ+78/MJfdcIvRhBbdCJlhk98ZTv
         5eOPAe+66X0gVoq3MGsI2P/LE0JJ5ZcAyBzR086PXOo2afiEq6TozInHXcScThWGuNKn
         v7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890246; x=1771495046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytyEs1/YnZxnv9lnNRonE6+DQR6UbuV0ywPhF1Dur1A=;
        b=HPlXeZX/d4PPb956hi32drCJZwpj+xJSm5nIc53u3vI4mII9Hg59e2UZqgaJSIDwLc
         rVGGtdKmuWFbL5747c9B/D10LBYnYl46+NiJZLdCcc6TNR/m+9TmPx3NORUw+NV7XfKA
         BmsSTSbMP/uH9WsZc1y7C8w0uD9skGe2mHlW1NkqvioCl69EPH7uJpIPJpJoYTzXO5jH
         pSzImb8VdBs58kIJWi3iFdJmW1mpZ1oWfNYqzNefs1KZ8i21Tf76RHlSsVVHMalutYit
         2VuC4qfwkqEw5pnpq3jkoCgw6cMPCWnOlKyZXDI8xoXt3uZCHIzeJd4LU+OZrmjudZdq
         0k+A==
X-Forwarded-Encrypted: i=1; AJvYcCXb5pM5SElfp5ztvkKwlqcI4hYG+AMY91tFbeBfBtR/AevFkRdszNti54s09PyXUjufBpB5OZ/0o5xdYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/l/d//nFHOp4yH42KRmAnhdlIAaVw4cHCv/iX1ViowNQZ4hwf
	Iv/LTgpOc4fs66/trebBH8ITJhT3BNPK6p9gg4DLMaqug0EOsXd+LhbA
X-Gm-Gg: AZuq6aIviv+VLTBx3zaNmYAkjxi+j0mpGoIZ/m7LiHJZqRyYUKa70r08RTaDkeQmv5k
	76Rxld62g/35BCmeotrEbCkk258Jw++wKY7ucyL19W7OrpFqohHdRKoR2jyR4+lspiUm94cOoEc
	LO4jrStbcyy8FN7yrijTfEO4bpVUUP9AMluxb0oF7ESM6l9xo/9rc/jCVpFLU4f8CxECV9KlgxH
	WzjOwWu+zrtlXrN1u5+03dGZHOBzlNdLwmjH4iWj5JZ59WvaQgtnM3wZUCn46AC6k59/zzKrQRj
	VLpd9IQoMCUyqdRs7txyy5HzuFl1Ope4aQX5LvkWQdJgfYgLaz7hHYf0dr38ofVxs1VI4fxFLp8
	5XsYjh2SWEYjoOYfrFxmpYIGaNl2HVKpsj1ffqXFaK0NtTLEDEVP9oTjlF14eTOMCmQrPEZ915P
	L4YW/mlDavDKqwivaduZos05Lkq/L3K4cfdktZLBWMq2qmwdN45WV/ypf90isWEM8mdj296ST1y
	OiFXVm9RHAbxw==
X-Received: by 2002:a05:600c:4e91:b0:477:9c73:268a with SMTP id 5b1f17b1804b1-4836571e7d0mr19202025e9.6.1770890245776;
        Thu, 12 Feb 2026 01:57:25 -0800 (PST)
Received: from rachel-VM.. ([31.44.137.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836131d48fsm27902405e9.24.2026.02.12.01.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:57:25 -0800 (PST)
From: RachelOvrani <rachel.ovrani@gmail.com>
To: dan.carpenter@linaro.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	RachelOvrani <rachel.ovrani@gmail.com>
Subject: [PATCH v2] staging: sm750fb: Rename nDirection to new_direction
Date: Thu, 12 Feb 2026 11:57:15 +0200
Message-ID: <20260212095715.2844-1-rachel.ovrani@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6202-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rachelovrani@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 0B8F112C221
X-Rspamd-Action: no action

Convert the variable 'nDirection' to 'new_direction'
in drivers/staging/sm750fb/sm750_accel.c to comply
with Linux kernel coding style guidelines.

The variable holds a newly calculated direction value,
so 'new_direction' makes the intent clearer than 'n_direction'.

Checked with checkpatch.pl --strict: no warnings, no errors

Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index e1877e5d0..c796d410c 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int n_direction, de_ctrl;
+	unsigned int new_direction, de_ctrl;
 
-	n_direction = LEFT_TO_RIGHT;
+	new_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			n_direction = BOTTOM_TO_TOP;
+			new_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			n_direction = TOP_TO_BOTTOM;
+			new_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				n_direction = RIGHT_TO_LEFT;
+				new_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				n_direction = LEFT_TO_RIGHT;
+				new_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
+	if ((new_direction == BOTTOM_TO_TOP) || (new_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((new_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.43.0


