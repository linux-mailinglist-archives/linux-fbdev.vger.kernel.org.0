Return-Path: <linux-fbdev+bounces-5977-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLsQLB90emng6gEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5977-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 21:39:59 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BBA8B23
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 21:39:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF5C130226B7
	for <lists+linux-fbdev@lfdr.de>; Wed, 28 Jan 2026 20:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB237417D;
	Wed, 28 Jan 2026 20:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRnn5JPe"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FB7371073
	for <linux-fbdev@vger.kernel.org>; Wed, 28 Jan 2026 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632793; cv=none; b=SciNH2K5IgHghLF2HKYkjL+rk7HmmA3tULJSKlQilARpjpEn48tD/nCX+hjsbc3d2KkplUZ6airNu1fQdbxUdwgJC0cGSLMSSfAiLx2yANjA5skvxyBL9itPKaWLcr83Qyr1kAQifZ9nwdi4DrbcEd9/euZgDZj+TwL59stlaCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632793; c=relaxed/simple;
	bh=Nm5b8sgLD4sBAwSa6lg3pqm0KR82wRdBdgAP9dBu6EY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pv6zl52OcaK09+8OQMaUt1i2DaGBR+pz32AQv9rixXdZd+ZF/25hv169KRrJARB77w3qP+2iElDpGTaaZuTD3KeeeSd3zwQCIzWRnxVQAiyNs2MLBXw8N6Jv40dl5cpp92ffR29Ioe93OOUlSUPnPxnp6/bpWmnBAO1Dvds5M+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRnn5JPe; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c633984fbeeso538343a12.0
        for <linux-fbdev@vger.kernel.org>; Wed, 28 Jan 2026 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632791; x=1770237591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUtAzlicNbYpibyHmDOFcgslFGJZKtVL/UOPgB2to8g=;
        b=bRnn5JPe3UTiDCXvpu7G52LBA3vhP6H7k6AxscMVKady5fJrQ4rEjgp0TTWzmX8vvu
         Q1P4UG89awRYth7rnFQOGd3qM9Qj72eVUR43zEf30OhAwfmM6hIRDCF7FWDvUoEp1RKt
         8ZiKXELjrVS4xWdcvJt3FWqq8631zBhI/juQeGYxUSF/K8hfCxun7IGQF9oZWQzeyx/n
         gvQXKqEDS8KYBJ1K9QpBQtWhR0miVkVzan/cYQTahnb5B/5ViGun7DHO68K8pJiu2GaV
         xvdDMIcsskK8obZYSdM/IIoCjaMRKQ2VRi5aRSvo2fuCeKpB53omQoTs1g3cv5mkvF0j
         osZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632791; x=1770237591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUtAzlicNbYpibyHmDOFcgslFGJZKtVL/UOPgB2to8g=;
        b=XPpQxJrkWktW5J6c1ux/sNJGVs/NV7uyoxgUwZz3C17ltUBSdzvvv+Rm1lYPOpMuHd
         9F1Aew48FMQLG4ydDm7Atx3F4YFROP/Yuq6wl7reErvhwfjIvSZ4CLEHfiWoyB4Z4A6X
         62tLc7GWnDuF7zM92DcGePhiDNiZtVuMn27kBYzzsyI6Eju06OMDo+79U5SJbvy4FLjY
         Uk0wPCqNC6y0y/1AvgrKG4a+pzaJ7I2IgLYfeprFzPh93M51MbsIxpKOZMc5Amh83kZe
         gq9w4IWHANUH2qIygniHSacjIOhlO2wp7+QVxAuDOJ0r1UbTtrRGOgKv/9znOFQo78ci
         sRig==
X-Forwarded-Encrypted: i=1; AJvYcCVwnCx+27lWdystJS2+ig5tsp3yuP2bvfhJzkmq5XI4OEhQQqVG6d9VdX/invCOBRp3q8aD2kqX4XickA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytlsUUz9TRbT6BgIsn/F2fEMlDR7Y+nStFc/FMLFk4STGT0QgZ
	zTOJrVhSBIc1RF+OslMgbY5UC46fkWW7LJvnSG+GNv5GSM8lgBcMPE94GfyG6vVc
X-Gm-Gg: AZuq6aLgYSQnjm0wpPHha642lcUvNlGvF6CEeUFQb+KCZ00SgD/wvxwa+pvdiHKppdn
	lhPQOb0JiyBPl87kNEuIFkVAz4qc0IeAWnukQ2oJOjQfxHYEAOvH64tovHuPSQ3o2uElBSMMHvG
	nlkDS++SPZgFOu8O58lDcEPbfja2VNwyGHlkudHdp1QfhyQgk3TxEhIL+uc1uXQ418ewi4d5eWi
	NK33SmI+I8X0U0nKJqth6hAdAnVGDqiAVumEGER2xYd8ylHfWQ6/fCteT0cpbwQhNWZDUE0AkFI
	HzmyeGG/L5S4B0d3uXQ8GhF6KRHCKCT8PO3OqlcprdtdfDPnVAbeCLBMpa/nk/5PVz5bqFKzTJY
	Z5mNItGvub85fcdZRe44kCt1UoYoma0M+etzqTFxuwwDTVy5Ex42SkaeVPxWqJrnqqha79xqfuw
	TSvF38D7NMBZN4js9MsCp96T4Rpg==
X-Received: by 2002:a17:902:f683:b0:2a7:a3b3:3229 with SMTP id d9443c01a7336-2a8bd43275amr6095695ad.5.1769632791253;
        Wed, 28 Jan 2026 12:39:51 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c45c4sm29703465ad.62.2026.01.28.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:39:50 -0800 (PST)
From: ChanSoo Shin <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ChanSoo Shin <csshin9928@gmail.com>
Subject: [PATCH v5] fbtft: limit dirty rows based on damage range
Date: Thu, 29 Jan 2026 05:39:38 +0900
Message-ID: <20260128203938.962414-1-csshin9928@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-5977-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 291BBA8B23
X-Rspamd-Action: no action

Instead of marking the entire display as dirty, calculate the start
and end rows based on the damage offset and length and only mark the
affected rows dirty. This reduces unnecessary full framebuffer updates
for partial writes.

Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1d5cb45199d0 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,12 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+	__u32 height = end_row - start_row + 1;
+
+	par->fbtftops.mkdirty(info, start_row, height);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0


