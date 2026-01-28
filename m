Return-Path: <linux-fbdev+bounces-5955-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPV1FV3VeWntzwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5955-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 10:22:37 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E18C19EC1E
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 10:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08B253019803
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 09:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B904833DEF7;
	Wed, 28 Jan 2026 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dI0/K6Rp"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E56342519
	for <linux-fbdev@vger.kernel.org>; Wed, 28 Jan 2026 09:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769592146; cv=none; b=ZvSqTuL71eH6sgxdPhufay87IwX0lhF5fvnTblRfk/DnlY63Bkvi0IAn+18sUSMrFa7CaST8E5IT6uIaXZ2Pnnk9Z0CIUU1hKVZllu21UksjZpYC3aqWyHYu1dDjH0p8gXbwxMRaEUUhFDP+C3O3tMelw4UyqlK3U62rWX8j3W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769592146; c=relaxed/simple;
	bh=J4xPd1IfrfMwRUhA35VU8gwe3m4oudk3ftkWf8tejlM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXo5YSF9Lc67hbB17i3vOUn7OVdAoV7SKIOU+brIQPEry1xO8oJuZ/ZjyQO1v5eOZ1P3fxbz28ABIwuI5Whba41xFh0cFSEty+EErur2F9vsnBg4HX/9F/P4Tr7hthhLcqee7EmQnWrNvcB6kRs3ZVnRqHtXE27GDjEs9qFqMk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dI0/K6Rp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-823081bb15fso3715749b3a.3
        for <linux-fbdev@vger.kernel.org>; Wed, 28 Jan 2026 01:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769592143; x=1770196943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/20MeRTWa/ulLtC3Qbnsogn/fAwzsjqDT77al9NCJDw=;
        b=dI0/K6RpByOAV1e56krtt8Sk6EuAq6ppgtCIG6myrlow7Xykqr4bg3BmHdooHS2mMv
         ErkznYdcz0y30zVNRB8KOTkhctPCz5KRWWMF+FExU++jlSNt2mb43tEmtsbQ6AKzNCnN
         jDPyBWZVNaO4Mkm2pgLiAkTRDRQUx2040VgePn3p2SgTIXwyyffNrfxkAIYgH5PAu1Dg
         7YtzVv/oNuQaSooqX2Q6edE26Y+7ZliCsYXppqRMcK4ymtlgkOAFBU7W1Mf3Cz+AxmeS
         bXDrwXP1AvFEQcnbdryROnIkvecF1izGh5vGvdNgiqifjJS1xy+/bsBxar8XWlUDlULN
         QNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769592143; x=1770196943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/20MeRTWa/ulLtC3Qbnsogn/fAwzsjqDT77al9NCJDw=;
        b=Xwf/LyrlDgHAuOz6gg+qUYOZbdHbqCX8dq5o9J2bNyifNlBKnO+lnHPhY1m9UJWmOF
         il2LmZYAv9FgyZtCQsj5+eBQcnz+goTD5c9HQwFXjG9kOssWMRGCOUm1ITfrvtPMwnzL
         PbhgXzz/TjJ0EPWfgQ7//C5VXCYIoSYOLZzzitwKmOZ0JQQMYL2RBR+roiBPED5yJQCJ
         uYvEdr0MOUxgGy6txX24Y7zVCAeCxqpcIK315s7EbY5ZMmXSQs558D3wi6xAaYZ6XorO
         wACfyWIacYCwPjd9Az5wNHo/xJed0e45dsKPt/HBZXyZu+QcpI87Gg1AhN9vU3ywJhrs
         mPyw==
X-Forwarded-Encrypted: i=1; AJvYcCWfoPd/FxSZ8uvNa6BTZOKIezp0abDMQGSO362nhGWDwwUpAOHp5O14ozAh4+vc6Uzq8nDWu2bosqA/oA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydkb/sA8GSYlBCWR7prI/nBhAHB3jUezgY4TJntwhxS5zuapnR
	IFL7yHPbXrIHarG7egzcQvpa7/eA15aVvSdwGtt7/m2iPIqXd/e/H6zC
X-Gm-Gg: AZuq6aIZzhyk2g/65aOdjayPJ4PSijfoL4wFEtGzUQL/vgtP5Nm28YGHRNWhMTKfEgU
	UBIBMRzoiyEUeJEVG4ROObln5Bqejo2vnaKUdgsWHpCbqx+lewnPvgG4Fa6jqXvLcaB/5/PuoPO
	dGAHPIO7TKPd6aZ7by+wmlsLZn8BK9RtH20cVMFEub0uoGplHOigOPIAar5o3oAav2eVhcBVLWP
	nbelwUjUvYlPMYd1qQNhWGsIawMkOUKZxtitVU3E1J8OK2DL5eMV+8WxCVE3MzY2sFMqo0PiPzP
	EBFehiX2nj5imoJ2fmU8jdWcV3O2n65svpWVxAKfz8XkexlNv7x88x39XTAt7ysk9s0jA4SMWEw
	B1sGmUy1ZCqFa4qkERlKY1x4w+R4B+YPoWaMAhl9+0VQzJa+6YkGKU22/G6Wu9NlsPvK2lfabaU
	hPz8nMUrKrvobdGxkGJ1E1OsRz0g==
X-Received: by 2002:a05:6a21:6b0d:b0:364:13ab:d4c5 with SMTP id adf61e73a8af0-38ec629f950mr4457135637.26.1769592143279;
        Wed, 28 Jan 2026 01:22:23 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642b0b4c07sm1758138a12.36.2026.01.28.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:22:22 -0800 (PST)
From: Waffle0823 <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Waffle0823 <csshin9928@gmail.com>
Subject: [PATCH] fbtft: Improve damage_range to mark only changed rows
Date: Wed, 28 Jan 2026 18:22:10 +0900
Message-ID: <20260128092210.864021-1-csshin9928@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-5955-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[csshin9928@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E18C19EC1E
X-Rspamd-Action: no action

Instead of marking the entire display as dirty, calculate
start_row and end_row based on off/len and mark only those rows.
This improves performance for partial framebuffer updates.

Signed-off-by: Waffle0823 <csshin9928@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+
+	par->fbtftops.mkdirty(info, start_row, end_row);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0


