Return-Path: <linux-fbdev+bounces-6727-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IyJB4/7x2mIfwUAu9opvQ
	(envelope-from <linux-fbdev+bounces-6727-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 28 Mar 2026 17:02:23 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98A34F144
	for <lists+linux-fbdev@lfdr.de>; Sat, 28 Mar 2026 17:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3687D301DECC
	for <lists+linux-fbdev@lfdr.de>; Sat, 28 Mar 2026 16:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D88A3939A6;
	Sat, 28 Mar 2026 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYIrOQsl"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C399392837
	for <linux-fbdev@vger.kernel.org>; Sat, 28 Mar 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713737; cv=none; b=JIqZm5V2cvzOeGgKmmTnwFo5xgXJK6f+qLyV3V8ysn/STD2ziMb9Z4USICw7/GWwI2pCyBfqVtcd8glf0AXATcxjq7v/9bi2Bm4+hTIGLrM0GBB+Hgu1qhODAf8MiSwcZbMyNP69eaxd2yq9UYLR8TzuTz9gQNzVN7aX0DbirfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713737; c=relaxed/simple;
	bh=X1e5+2xfs4vfM75r0Fko0oq6sN4zv6V/0nqGiFN4IXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FIR8tp4Y124Mtr8ewPeCBwyMtRugd1c0NSbAqfyVtg67HXEawqfu4k3WjIgAX7wKGFYzi3+IcaqJ4rhen/vGRKouDghvaOZ+W/SGTGJ8zL3RzMfxRrkWa43hexZdX96xnyGkqfiq91jVMUz99r4TbYh7p8+9kGRfG0ClvDZ8GyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYIrOQsl; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1887011a91.3
        for <linux-fbdev@vger.kernel.org>; Sat, 28 Mar 2026 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774713734; x=1775318534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zO3fzyE74uT1xNOETXZiW8HFjDihl3ZHhtgFTBMYTAU=;
        b=JYIrOQslpDWClTYnjS6PhCBJ365ba9t3Gd7ocgnWEEUpqj/djBW9YHczjzUcU0XxJp
         ZIowBe+tUWdivi+cdi/J02Xl8bD4Qt6Qqt15Xc3qeXdmShn7FFCTlrFA1PeybqMI65GG
         m61fd840d6U2883yqmQSSYig6IaxX16oSnjGTxm7gQFWMf9nRvC0vhrP6V4DW+eu4N3i
         iyQl7Oled28UVS+ukLqGasNWFxFCy/Sqojc/vR4nmKhtj7sUejd71I+G3uuypT1UfcNt
         +oc0trgPRJHRimbOhEmKIZUT0ijo5zgw0bvVFrogqwAKmawZNy3Juj488C4Fl/WszlrS
         ZZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713734; x=1775318534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO3fzyE74uT1xNOETXZiW8HFjDihl3ZHhtgFTBMYTAU=;
        b=MKUkRabRszDlgY6C0EtJPIhyUCHWXMK7ycfLkftj+FXp5FeR+LaqinXWTV2tyZRywQ
         gqcaNeSymJnxINDfwtD1ZhV+EFarpJVq1ws5ZP0BTWkFkzDJ9+lwok23oItO1kDQ2u37
         DsfP8U04jt+TZrUY93gNyggDaVONU7C0Pg9M8tLNhXjG9+ghtatnBs0mMN2Nrxyc90Rm
         tKJdCYFe4AjOi4z1bmc1OLPSWMPRfxtmCezcBaL/Cjr8k52kANlBL4FdfAS3Woij1FMu
         zTxiD9RHbZ5n1of4TuE5s8w5OETon+zUbhVWTd101bV2xrFd8Z7pa7GmLFbc3UsT3TmU
         Eozw==
X-Forwarded-Encrypted: i=1; AJvYcCXAdy7+nNKJ/NvgzUHstTaPx5pTPgaYyooJ+mL4MFu9Tu6ETlqiXlOHda/UlhkadKFr3XE2P5mCIG4O0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/LUOQpShSPjTV++L6/e2pxjCDGowk4el9uxXXISYTnuxrDxiq
	W1a+8T1+PpCIQRQCBRbutFT3D1XVu2cTAMC/J/6M0Okajqp9DvCwWD0/
X-Gm-Gg: ATEYQzwfLSS+er6WxXX7tmzIteD75UtDbFSNnpOPrWy9+/5nDrJ4Z+t+kR2o+7dUY6i
	3BCbkVPIP9vJB6Ji6wkv8viswKQwmlscCUS1/eHrH2zGeqmTroB5mqq2mwsdQ8V66JnC9gAplrc
	y/5hZRgb3eFEWQh7ODegccT7tLSZp0A06Hij3oll0RZuPlXiHV0vrS64K4XEAU4YPurNzdd/WOm
	HT6X27v742Dq+fAbstwzWBv54HkTFwvy9NNH3ExgKm1+3tewqhjTwpZSBsL3ARThP7jbMtdFP4W
	Na1YAanmMvBWdJ9zO8yG8Q32NhtaCXRvhKT4MmBh8SuX7EWpxlSHeTtlzyJc7pTZrfMgwkFVKeL
	HqQA2wXWYgi4N9E181agw1Kz6uRuGeQFEd56CwWZgUtNasgui5uO8ZXUm3oyHAUQCTzOGYHgjqx
	/CIz3fYareqNwdrGEVaqhJuVkfW3CE6WvZnBWPyD23Eg==
X-Received: by 2002:a17:90a:da8d:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-35c2ff1be2cmr6546483a91.7.1774713734243;
        Sat, 28 Mar 2026 09:02:14 -0700 (PDT)
Received: from Panzergrenadier.localdomain ([222.205.46.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9509cf33sm2266914a91.13.2026.03.28.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:02:13 -0700 (PDT)
From: amanohina1 <caiyuhe80@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amanohina1 <caiyuhe80@gmail.com>
Subject: [PATCH] staging: fbtft: avoid empty macro argument
Date: Sun, 29 Mar 2026 00:01:14 +0800
Message-Id: <20260328160114.1143108-1-caiyuhe80@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-6727-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[caiyuhe80@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8B98A34F144
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: amanohina1 <caiyuhe80@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..d1eb3fc03d7a 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,11 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+#define fbtft_nop(x) (x)
+
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, fbtft_nop)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, fbtft_nop)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.34.1


