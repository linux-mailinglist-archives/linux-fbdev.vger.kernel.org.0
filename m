Return-Path: <linux-fbdev+bounces-6195-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL4RClGRjGlQrAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6195-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Feb 2026 15:25:21 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA67125328
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Feb 2026 15:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4F523019515
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Feb 2026 14:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67EC29E115;
	Wed, 11 Feb 2026 14:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfpmTeJp"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D431625BEE8
	for <linux-fbdev@vger.kernel.org>; Wed, 11 Feb 2026 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770819914; cv=none; b=g549kn54vCeB/0F5F6RmqLvRo6PF/oeWnlmmtDee6+mvYXwZNHn7ePq6lbo59CZM+d1aMTNMJzW2f+SC+PRHBwZb6tziE6qs2x+nrNHIZuIyJUJeAqVFWTG9vY0Hp8pqFSivr1fleZLAAvdmISL10mDthihqeZwGItXJdRBcCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770819914; c=relaxed/simple;
	bh=MRKb64R7M2k/4tb6NUEUYyTbV9gJoZsd3aOWYmHnG9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hv/5Ri/2+lbQbQ3Mco1s4iSOKJsJE8UbnVcv8kL/RZsHFZ05tr/+Jp931wP6c6/5yA4urAvkSSia6XMHwZCvVrJc/SCFHP6kO2ZVcYDWcG0ZHLdW1rP1eWxt76b3smz7eIoZcGQV/ikvij4imNVHf01Gr9q6lMFTi+RLU4YKmgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfpmTeJp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee57c478eso6130135e9.1
        for <linux-fbdev@vger.kernel.org>; Wed, 11 Feb 2026 06:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770819911; x=1771424711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvNdR7pVcMzecfp9WHQ/bIW4OQ4XE6zPka3hTScbHhU=;
        b=nfpmTeJpgpEMDd/tIplwR6eomsKdy/ntQUpJNpSblxUf6KMVpb0za6osfVk2MrEMVy
         cdcQKfQeJ4UAC6UZBzzy1bx74JxCc4kBjiSeNLWuQn7VQHgNZr8KZa5m2iT03gVuXAYr
         oTVzMdmpMI8VFX3DcJ6mo9nTodfiE9lkxibR+c37SeAbi2QQXccoxonEsm+frje3v5aD
         3G6hpTnVTAmgBa1/fGjtngR4PqiacYqhz99wiO7PqXWIhK3i3Lfpbj0dezenTtegN4vh
         tOYZw5eZRh9jan6hh4Kv5f/LEyxDR5Ow8SCgKAIjyMU67QqZ/EOSW8isdzWEDr1wsQ2p
         pfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770819911; x=1771424711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvNdR7pVcMzecfp9WHQ/bIW4OQ4XE6zPka3hTScbHhU=;
        b=C2n3NtusT3RHs+z2XmDZlnZ9N/m14GWVe44VW/Zx+DZFq+dedhbJXl/wdVukA5pSZG
         uA/P5ETXqJwQOidovNaF80fscnupfohVORk/mfg4CeC4UUkDjl0J0I8d7NSB5WbDgf55
         LLKKiYRcKVCeaHAQNOZnZ0S5jOJtxUsgW7K1OEM35vABL5EKSy7Aywhf53p58vrLEcFx
         glh03P2Cwa+9IOcGvynwbgy/sA8/elsAeVgsEBu3BSX25JqEZhc0e4phV12P6AEvXCr0
         fN8MpRidccu/ZUQvHKmCiktjZsrccVqI/tywfdcU8UjmCPRC/dLDKyNQQswBUMgz0wtD
         4o+A==
X-Gm-Message-State: AOJu0Yx0UQQdHIeVDRQi9xXajvKbT5qQktxZPGP+xkEpeUXey2eB6TPY
	zZOrJsz18X/G3XLVsPHbEPO3AaBTSRsKuTRA3KXCy+VRcswAN41FDysk
X-Gm-Gg: AZuq6aLlMyt8ljrS2rqlGqjDT7VMBdndM/wTOKdQF1Z2rXPMQmzd/fw3aZ5GUaMqa4p
	Nr6Dob5H1eHrvFvie2ioi3D/K/Fj0QMg8Md2EKwopGiC2Uy1F/84ByWGMOzeS+Q6swak6esDIVZ
	PQKlomyJL71JkhreJN081YVO241U4xbJnb4P+BE6NvuWjElBEFinmApfPCacuqoJjHUARJQdMFF
	xNmEs23PhaV5TkYR0F6qmnq/I96m/3Caj67sfvifC6GojrzKWyd8ebnVM/yaFtSGlIVLz5jkKHa
	gv4/IRWlepIpjhd/CPSLdO1MIVnNqujHwFPni00mvwEOrfFFT0A9UHB6KbTu9lmaXVcFQwaTVkK
	8CKhEOmLow9/ncKW6TWOSm2qUTHfWO0hbDvsvVwajCTaEXj5dDQtKSL0jBx0zcCDoFFd6IzyO8b
	kZ/Q9ArFGxrammMACVsTFJm+lljUNYDZ/ctWx/1icMqrZLz0JZt+2w/kk25/5pnsoNFEIdrVQWR
	2IB712PHdeXww==
X-Received: by 2002:a05:600c:34c4:b0:47b:d992:601e with SMTP id 5b1f17b1804b1-4835dd85ad6mr19197125e9.2.1770819910883;
        Wed, 11 Feb 2026 06:25:10 -0800 (PST)
Received: from rachel-VM.. ([31.44.137.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d989165sm57573175e9.2.2026.02.11.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 06:25:10 -0800 (PST)
From: RachelOvrani <rachel.ovrani@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	RachelOvrani <rachel.ovrani@gmail.com>
Subject: [PATCH] staging: sm750fb: convert nDirection to snake_case
Date: Wed, 11 Feb 2026 16:24:22 +0200
Message-ID: <20260211142423.4922-1-rachel.ovrani@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6195-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rachelovrani@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7DA67125328
X-Rspamd-Action: no action

Convert the variable 'nDirection' to 'n_direction'
in drivers/staging/sm750fb/sm750_accel.c to comply
with Linux kernel coding style guidelines.

Checked with checkpatch.pl --strict: no warnings, no errors

Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b..e1877e5d0 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int nDirection, de_ctrl;
+	unsigned int n_direction, de_ctrl;
 
-	nDirection = LEFT_TO_RIGHT;
+	n_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = BOTTOM_TO_TOP;
+			n_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = TOP_TO_BOTTOM;
+			n_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = RIGHT_TO_LEFT;
+				n_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = LEFT_TO_RIGHT;
+				n_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((nDirection == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.43.0


