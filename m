Return-Path: <linux-fbdev+bounces-6607-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKujCCXJtmn6IgEAu9opvQ
	(envelope-from <linux-fbdev+bounces-6607-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sun, 15 Mar 2026 15:58:45 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A5329118E
	for <lists+linux-fbdev@lfdr.de>; Sun, 15 Mar 2026 15:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AF57B301726F
	for <lists+linux-fbdev@lfdr.de>; Sun, 15 Mar 2026 14:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8187935F610;
	Sun, 15 Mar 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIV7uCdf"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF736D50A
	for <linux-fbdev@vger.kernel.org>; Sun, 15 Mar 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773586695; cv=none; b=Rsp3o6I/Ei0/Js4mVOs9AV6n7I0/IczRUnZ/j7MrJWs0PYTODpvWk/7gq14fw2VtMwt403eEYZ3i6E8W5VYu5+MdCqNqTda9se3Qg1X53Ky+OVR8aTgNCa6U6uQ0BmceIH1m1aKmR5m1llwLwSJXcScXA99Eu87whY/OUfyon4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773586695; c=relaxed/simple;
	bh=f7uo+vLBkH0QhVXxQ5yUIUF/Y47ehtCVoJP/aO1cA30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dP7WfbCxGTqpDlcNoL3RIujoFLBoLWaftLhOAlZrOp3onwkHrG4pSehOUjJOI7JX7bUdpQcaV/bVje56h3F4xdV4gynab3IWegutr9Rfl0xc9aC0Z5irTFge9VYeyfXmTExMyjOGyJE+pHvUUN0zPPfWQJvmG7VfvHDX1BoaW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIV7uCdf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so29173755e9.0
        for <linux-fbdev@vger.kernel.org>; Sun, 15 Mar 2026 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773586693; x=1774191493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zPStZFLXZ4Dkse9i5qAiZ3opia5BJZtkwKvg+f1kXhY=;
        b=bIV7uCdfZlsRlZRV9xX1BmvFU14at0Cng7yRyeU+hpylqdh+JOmxViR7FcAId/E3C0
         frs9ojitYl/aJQUr4/BOJwL5u+kzcsrhRmnEL0herHvHZSjrNz7NrcmL/9FouQWL+UW5
         +/84iPDNXICPOlu+juX4m/G66jmH+8YzKK784o/DMzWwauTuh8tFBg+F7RTeAN58oDa1
         EoNSU8p0IBqs/QuurLHeIiw6FS7OF8ts9PVOrAPmiENB+KhbWDsP+3ARPdz0jggvyLqr
         51JXz0IHzMlEz6E8HTiIPNsbRETHIdtxTUAVgnqGX83liPkRC/BOsVX/zgZtHOtylyeQ
         H5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773586693; x=1774191493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPStZFLXZ4Dkse9i5qAiZ3opia5BJZtkwKvg+f1kXhY=;
        b=ioahbWwyiOakQqiBJD6kQ0xhA4rDIebqFkJi5RV1LoufgM7lScJ86rk+6QXa2D/vzX
         TAo5clCUGhUh3nkxvwyoWfvvCVeWdgZmhrUEq2cF+hDoEEdCqyZY+NwPaxQux/ASdM9A
         OiZpNOO4HtVLgFcjhgWPpjrhPgPnai2o2ZewCXWFDuQUCjffXnl0HM+lYfybXlt4fDsi
         8Prrk4P/V0bc05mfVzlcZmyWo7Yh2wnBLxIU3DHUTuOcwmUhNR4lNR1/KAQo/qSPvk8U
         G8/Y6Ppg4hpom6N72/L5II85n2nJhln9DrpWeETPKgbY/4f5PCP9t7bFSLAPHgjjli6X
         1IXA==
X-Forwarded-Encrypted: i=1; AJvYcCX0nyvRv6xwBaRZ6C4o3QLOAZSTbPB4GxVy+dWYTRY4EBwWpS6owHIo+O4rjoZXavILiL4hnlqYmSXUIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNP2LsXkMgrLbiCEbcRVS/YFdXqN2mYZuhF7gquozjsrodAsM4
	VDG8KfyjMYbp30WMyBx1gZg0gmcJQGcQ4Oyu0zrSVmpY7JapWcur/Bxg
X-Gm-Gg: ATEYQzwgUM/ey+Z/oLOKCdkxl0P8B6UNsFyCTo/9u4heU8N3SshrjOFmLgc50rG6BVI
	jvZ26MkohxDSFU8g74F8fZE64umL9gBA/CN7GMNcsFR/g83Rg7VGtjcoDFYAfWaNwX++f7XKu2r
	cQPf1dXzAe4tQzU8NhemJMzeO2qmkn1WF8QvozsfXscR8Bbfv//sSJIaFvCmQ8RtqrAofWn6HYV
	g0wnWbH0ZUvHUJwxHNP6u6x1664V8hMJEQysxo89TjSBdlCca4u/Z+2Rm+B2KYCqh2jhHiRBCkR
	XNAo+DyVFA2mBuLgTWa6c6DxhaBf+hg1/ghiH5eG189DdpqMPGzpQjgnIbUlFb8g/4ul16KVcbP
	wB0A/5GThBUvlL1eHfKyVa8ErFyJr109WLymgl1ljARnQDW5Hr33bqDOBf8ytuqhhmfFGy0UyJM
	GFUblC0DuqB9EKDidpi59JLpec9j2odUZp12jIqGcOUEqYpv3gYkjb9IhkfKGIG+3jdbMW8ox30
	QZ3JzF76lRtRQEPRyx/F6P94IKzLw==
X-Received: by 2002:a05:600c:4689:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-485566cf80dmr161809475e9.3.1773586692556;
        Sun, 15 Mar 2026 07:58:12 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f708sm763476945e9.11.2026.03.15.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 07:58:12 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH 4/5] backlight: cgbc_bl: fix kernel-doc comment for struct cgbc_bl_data
Date: Sun, 15 Mar 2026 15:58:02 +0100
Message-ID: <20260315145802.24224-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6607-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[xaumio@gmail.com,linux-fbdev@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91A5329118E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the required 'struct cgbc_bl_data -' prefix to the kernel-doc
comment so it is properly recognized as struct documentation.

This fixes the following warning:

  drivers/video/backlight/cgbc_bl.c:29: This comment starts with '/**', but isn't a kernel-doc comment

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
Signed-off-by: kovan <xaum.io@gmail.com>
---
 drivers/video/backlight/cgbc_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/cgbc_bl.c b/drivers/video/backlight/cgbc_bl.c
index ab27e14338a8..6b70cd2f0ddd 100644
--- a/drivers/video/backlight/cgbc_bl.c
+++ b/drivers/video/backlight/cgbc_bl.c
@@ -27,7 +27,7 @@
 #define CGBC_BL_MAX_BRIGHTNESS     100
 
 /**
- * CGBC backlight driver data
+ * struct cgbc_bl_data - CGBC backlight driver data
  * @dev: Pointer to the platform device
  * @cgbc: Pointer to the parent CGBC device data
  * @current_brightness: Current brightness level (0-100)
-- 
2.53.0


