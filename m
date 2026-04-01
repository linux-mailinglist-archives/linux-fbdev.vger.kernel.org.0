Return-Path: <linux-fbdev+bounces-6778-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDImNm79zGnRYgYAu9opvQ
	(envelope-from <linux-fbdev+bounces-6778-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 13:11:42 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B1379296
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 13:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D708A301D04D
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Apr 2026 11:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B1F4035CD;
	Wed,  1 Apr 2026 11:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAPEprqO"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F31F4035A7
	for <linux-fbdev@vger.kernel.org>; Wed,  1 Apr 2026 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041451; cv=none; b=ftZf3ZRC/l+XctEczWcgNOtVwqF9U6ShYb7rwDW/VvIbvAhAJBu0BoM5f5HO9VFod9MxZ98EdC+04qoJ1RfLRoj/fo/+mxsv3US3cTtYaumyovuBpYE1PTNqXyMH1wvbrcEbXW8uxjyWvR93ay67MhoAQBZTvXPt1ZUI4Bz8fsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041451; c=relaxed/simple;
	bh=dzDStz9iwV5MYYX5o9CgzczsBHcxFhovrgPsu4tsRUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQ7jOI0sgwaW7UikVctY7Kkw+YIB2QZm8db2pXzDYvx9ZIrq2xFdW/PoZI9xAvBANbvwfwMi5V0AJYpcPCCI42HOZ0iSLJyqy7Py/KdVshVbQ91kosQsnNH92PNOZn/NwnQK1cPChNvQ5nfUK1tLAmdAZpRUR1Of4VlAFc9LbJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAPEprqO; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-12732165d1eso9329927c88.1
        for <linux-fbdev@vger.kernel.org>; Wed, 01 Apr 2026 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775041447; x=1775646247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMfeRu9b749Njl/7ShAl1WSebaqWTLPdrShnRNZLrUE=;
        b=UAPEprqOumqZoYYrhmfWop42uJr5IrozS4cb3W4h0UuO5svnybcxJo/GuBMwkQS4/A
         FIRLeJkqKrYTCFuAvP19RANpEN9M/8KBCd2oMQD7LhoqHV6OeXb9iKHe/J5xBURjpAdF
         PTuKr+HC1vhMaTGL7zPHtXT/Qt2ElaEqm+B2X89KpP3a+7JRQa4XQIDIc7JXWT/HzuNo
         XpS4bY41/RezogdnRpkebUwUdxFCnlqfDxqgoLS6k/Ac/8Qu7JX+8gJdROa5mFgak/wS
         o+sF+KyUHVjtZAAxypBCWcnlHxJ/AZUpT+grC0ZnkxO+5t2eoQhcuw2XW5Aaqxgu/OoC
         bCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041447; x=1775646247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMfeRu9b749Njl/7ShAl1WSebaqWTLPdrShnRNZLrUE=;
        b=dMv7ck0tFRLZIQ9+hWg/d5h2xu5qXcMyidC+DtPpG9EBAPUTSqwqg/WYgaqlgGR2XI
         nw77qdf4SwOPjjO72CZLfkSlbkOWhao8YjHANB/Vlmxci0uxY7v0fWL+5+wzU16UoE2Z
         xgvQeHYLud1uKUS/FsXx8DiWYroJNkVtQT7XM01VAwCsH6hkCXJ1hk5ueREoQb72+3Ch
         a/Ehv0HiVTL1YMBNhGNMlhPXAX50+2C1JBkTUMjSPP+GnSDcxEEDKRK0hL8sw03rS1xN
         VRfVi70nlaBfP6C5YNtNQORb5HIgdTK904Q+QS1UOWHznvgR6n31jLAwVMvMwDtWVy7/
         G3CQ==
X-Gm-Message-State: AOJu0YyEOKlqtZn1hh6pxoSZwsSfi1oU2UjQwfEhikJq0dVBnPtxgfYY
	qkBK329bAWtLcJquhgGaoLK6bE/4IY0VhX4YXfEl+i3s8WxyIqQyH9h6
X-Gm-Gg: ATEYQzzLFXLyMK1LVZphQ2D3JheHnDHZcpXMcbg/i5haD5kIi+/1l/3WfwAJOwiiIzM
	6j3r5LG7XTNJPUDwbJxgx+2EU4QCZNDcT/l+s6QQ8zEouWekHsRXkJl4fAX8LVvCo5CLBbNLst+
	h1Z6KmmzGBQqohOAJVIzte0gzVO7OvSNYk4MQioIGYvmnKyADhdF3XeoRmKwWAXdSVhtc+cqO6H
	FcydsYzm90ZUc74CxZ/HgY0xJbLAih2+btxsg3DC3T7EsblUCXpLQyQS5Foy43ECOZF1JhVSalH
	iZIPOd7kxcSblubyCez2QVarncxTbNaOqkNpurQu3zy7uPB9KMZ8sRWtus9bNbBoEDIOB/mvIvD
	CLdUgezPn6j7dHpFWKr8Lxtmp6NDviDS54nw+LQhHrozTjHDVt6l+rI404qs4GZHreYTA4olxT2
	E0/JmCgyFrv05W5WDC3uLjR5Sz0A/J35m81FPXrJXcrTSmxdoOUnJLCZsMoCucfJAnnQ==
X-Received: by 2002:a05:7022:698e:b0:12a:6902:ddce with SMTP id a92af1059eb24-12be6495948mr1916007c88.10.1775041446808;
        Wed, 01 Apr 2026 04:04:06 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c8a1de559csm3023432eec.22.2026.04.01.04.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:04:06 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] staging: sm750fb: constify fix_id array
Date: Wed,  1 Apr 2026 11:03:33 +0000
Message-Id: <20260401110333.2535-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6778-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 455B1379296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make the static fix_id array const-qualified so it can be placed
in read-only memory.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

---
Changes in v3:
- Drop g_fbmode change as it is modified at runtime.
- Resend as a new thread as requested.
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9a42a08c8..f7b5b22f1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -728,7 +728,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		lynx750_ext, NULL, vesa_modes,
 	};
 	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1


