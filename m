Return-Path: <linux-fbdev+bounces-6735-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLVlCwhXy2leGgYAu9opvQ
	(envelope-from <linux-fbdev+bounces-6735-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 31 Mar 2026 07:09:28 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F736401A
	for <lists+linux-fbdev@lfdr.de>; Tue, 31 Mar 2026 07:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F1893037ED5
	for <lists+linux-fbdev@lfdr.de>; Tue, 31 Mar 2026 05:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122EB36BCE8;
	Tue, 31 Mar 2026 05:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/9V5qNr"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD7C368269
	for <linux-fbdev@vger.kernel.org>; Tue, 31 Mar 2026 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933705; cv=none; b=rgY8J6Hyl7NQanQo0HDpArfJ0jEP7Et0LIY0Q+WlDFze/0m89J7z2x7ko3Rrq4pt192in5NruDBnr2CKuSZBluIr8cl2pt3xdgeZ7S+0Fv5eH4nTRBnaWkXRBuqP8mdOr3IWddoBJ5le3uPiNM7yYjo94FdHUJhsDsLOut763tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933705; c=relaxed/simple;
	bh=LXEuqItetIyC36SRGyr01AJ1CujZsWBrwlP6yxLTRqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gJvHN0Gj+Aem6oh/H5FHAhjaf3r+xuZSvUn4XVQV/724pdgrFttHK4PbYCTWd7Z+ItVU6o8rMCQRMbj9VPiMfLnp0mccDbvyVXrnGnL18WJFuLAgilc0C2l0wuLjl8QonRyarHSJtXbjpO9/3D5szCmThtIhCf9a+sv8gcyW4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/9V5qNr; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-128b9b7e3edso446995c88.0
        for <linux-fbdev@vger.kernel.org>; Mon, 30 Mar 2026 22:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774933703; x=1775538503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GajVOgXFeznoULOZxEt/ReDxJPJQFCuRah3mOyfADoQ=;
        b=J/9V5qNr80zKJCdfnfh48n+n3uEET6osmR0JpP0RG25yKG86ILxN6YQnHpwy48XyYf
         rqN6Q/J4MgWCeHK2lqrXmMHSjEjD3P0STelRMCD53YAPy/SotUG+AOBtitRiZIiapxZT
         D9Do3eu4W6NoM9UjuMSC4lrh8em5tltNQ7OiSczBlsl+qi6v0E4qEQxooSJqa1d9yJpF
         48idDiqterKrG0loDcgEe+O+MlyA3DD10bygmuQArBNFpJTjVnvAdSSBOxWDPsWfxdWu
         AzS03GCIVJhWJyJyW3ASIT4/oksa+LLUBFAZpqMUkjKeaBK3xApCBWAF7UxcYkUTtC7I
         C5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933703; x=1775538503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GajVOgXFeznoULOZxEt/ReDxJPJQFCuRah3mOyfADoQ=;
        b=IVAOOFX7qOyfxLQi0+KiDULditBuSaYvKxdrfY4fooqSeQlfFzdNtm7nYdPS5FhKXe
         9FePW5UQTNkw1jN+mgW80jwgaxqMVl9BVYM+V3kr1uBCKvl1WkSXQKtFzE+fjmlJ1c13
         1msDH3nkGyYOTszzjIjjiv+olJR/U73DCOQBETw90ae8OzFdoxdD8Schxac724ORQRvr
         YNoe5VYIR/zCv7SjUipVdOr5xDEXb2mcd8NKVW+XjbZNn2F6Jlt1Wdqq40/yIFClUppe
         oGiv2nGeagGZMbgkECzbSk1ik1yp8kbzgi93ckF9EkK8jQEwyaHZbV6GHAxGCWYe8m73
         kW3A==
X-Gm-Message-State: AOJu0Yzrj0JNHa4/QiAVRwcix5BTq+qPrZptTrCSuahB/gs0MQdIdBY/
	hTT/tgK57RbdrpYYsetKqeakw7kisUqaccHmoCJm9EiyJ8eNorIIwN4z
X-Gm-Gg: ATEYQzzw0hLj5DZGhTjXqyv9amf0NWuoUUfIYi+bEeKxMO6k0jb+lce8z27Vgsg36nU
	rG7ff0JnsqN8knMliu36hxi9gjaiXVO0KWrDMzn7lCBo1rgEhrsUu5DHbwVHKW70Iswvxk8rQ9/
	0SKtLWrNve0q/Nv+w68jyhqrmj5X+B58RhhfmnSSrycKB8LeJa3DEBdqlKUA4+6JB4wX6bpBdrz
	eXt2z+hcXN8eSwJBsT5TnvVjk4Lo3O3/tCNR8LcKod0Qrtq/mN0On0yLIiXP3Q4I5MFIANZGQxV
	svrAVji8lba+j8GlIEZ5SNBTB9oUXv/OJrZIi6Lt8m7INtmSQUelJRfoTHXIIBDLRoh8HzVIxY+
	3KAPCZmJfpF+Ixjou18OY9lSVEmJrr8mmFTAgxD8rztBJm33jgay3Qz5rnAgsboldPMo5QHY64y
	IhKzxFQCqjEDr1VrUwIIoF+LpUqVZA2q+VQ20iILJy1+rvM49cINJBkcyxG693rpL0qw==
X-Received: by 2002:a05:7022:1a83:b0:123:348d:8576 with SMTP id a92af1059eb24-12ab28a1df7mr8751727c88.6.1774933702964;
        Mon, 30 Mar 2026 22:08:22 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4aac86esm9214883eec.12.2026.03.30.22.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:08:22 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: sm750fb: constify static char pointer arrays
Date: Tue, 31 Mar 2026 05:07:38 +0000
Message-Id: <20260331050738.1547-1-dennylin0707@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6735-lists,linux-fbdev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.60:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 859F736401A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The static const char * arrays 'g_fbmode' and 'fix_id' should be
defined as 'static const char * const' to make the pointer arrays
themselves constant. This allows the compiler to place them in the
read-only data section.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9a42a08c8..b0bdfaeca 100644
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


