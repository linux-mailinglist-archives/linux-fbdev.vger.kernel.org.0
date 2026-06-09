Return-Path: <linux-fbdev+bounces-7554-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NAqgGW6KJ2rfygIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7554-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 05:37:18 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C765C136
	for <lists+linux-fbdev@lfdr.de>; Tue, 09 Jun 2026 05:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="A+dRn/Qu";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7554-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7554-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4304308155F
	for <lists+linux-fbdev@lfdr.de>; Tue,  9 Jun 2026 03:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB36379C53;
	Tue,  9 Jun 2026 03:35:09 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC1377009
	for <linux-fbdev@vger.kernel.org>; Tue,  9 Jun 2026 03:35:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780976109; cv=none; b=F0UR4qwq9AiUHWvESreTGEfiP5OYsLuP8Rz7ImwPJmKfB/jGpejeU/a5uw2F29O5n5TO5vpBVXuSGrvCvv2P6zJyjOfYzCwYk/hS6HxxyImhHVmNPUhBdliF5rbrK5QejamaqlSHXOpNx9icepDpPBjeB3fUY40ZeouLifix4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780976109; c=relaxed/simple;
	bh=QsQueFw37kXDbAmyr891bkVvaKKgXOEBtdQZoqCQrh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qK9/q0A+l6JKEJIHgqHaO06jc+dwHuVAlizmM+Fz61D4eEjgMHIu/080HRI4iehmhthomripk+YWY2WDWxDFjA1mNLrT95V3d9EWW6zarfnO620TFGqqoDeylOoOVhABONr+ZNUwFxkPnGhDJIYqNbVou0oTOiKI9bXqgOH7GvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+dRn/Qu; arc=none smtp.client-ip=74.125.82.195
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-304d0ac5e3cso9210865eec.0
        for <linux-fbdev@vger.kernel.org>; Mon, 08 Jun 2026 20:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780976107; x=1781580907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l0FrDzqtpvFgOtY7tXcpwwbPEIGNUsVT1eB/jZYLDxM=;
        b=A+dRn/QurObOTPLQl+zbvKiFm0PdLNuLXPlgV/Fh6qd4NZf9Bt6T8iLsodB1YJkqPJ
         altQmnHsdAlsJgYsAkPwzZ2DLnQ1ihiSQPbuLu44fVIQQAItG7KqQIJnSvEOi3IJ40ju
         Lv33OgvfzxpNVJQRy3+GrWTaq7NZVJYCN6gwnsrOW4FYuhomhZjCice+syXBBPTkbp2g
         ntbthR7V53dsotzNaeuPv6jsa9NpYWU+1Ri3GBQFBtf8fwLvqI5getgzo+FVRXwPDdAJ
         u4m4/iUKQE+QU9U/+1ADe6Rug4eIZMlT8TRNk4APizgyREaOW7mt+71m4bhpLQ83Ust7
         y5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780976107; x=1781580907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0FrDzqtpvFgOtY7tXcpwwbPEIGNUsVT1eB/jZYLDxM=;
        b=J72396gHXHwgSoFzF/7zErYkrHDN+MXflco2pkVJY1SZ6Bgwm15S6FlB4amK99nUfe
         SwG2im2SyCBv2nHjj7UOv5s3e4pjOovBNCRDUUkZvK91XA/ZiSAjuLcHk6+HApCmO4aA
         bcGMAL0HZ1TKviNDmbmQjl9vYtYfuKFlhz96P6HTEwMMQI/PRJmO9TAM5gjCnUJ7y3GP
         a+uS1QPt4WGWeDu9e4krhcBA22Y9HGXOX5MscEuN0JIY+SlHiYnL7xADtqoOEqpfIH6h
         erK72qjJr/L27Dm/uQZxHj2R775yWykvIFZ26t+4r/9txUCevaZkMtNSDgSp+XCD7Ma3
         wBFw==
X-Gm-Message-State: AOJu0Yw0AChQRjAs3nsVU/hbNhiTCr3Rrjvo5kcg1ECmdWuc1kQr4s3a
	mafxypOeCB5yEBn4jDqSEkQhPqyJ56vruOpMiPOmsHyzt2L5HMO9Flt8sKv8Wqlv
X-Gm-Gg: Acq92OGxwRJ9JIE1Q0qoyqowWbufPET0m0xp2+HvLMJEQ1TzqR9BO9aSRvmlm5xoKF9
	x6czkIkOeAnsmevSPh0w1dz//2v4bVMUEHEokxGwcXCHLEhWv173pjl23dwPrXDP6dhUYxL9yPr
	OagOK6zdIlREKdYcKf9KaABr5wGevlGW5xnuNnot7DxbxSK1U/i8OW7QEM4DuS+8DAHeuUrZoIt
	6pqJj0BSXXK/1kuiqWFtnN9rXOC9ycYpcjoU7SjhWHvr5ORKgRocfjDeZyFvM4UP9JyPdPl0vPP
	+WFkq4Zjk19/2AoWihWrVq0L6pFbyo+dXE8mxP0CH61Ccmec1GAydi+t8Q3YYsmZLzLtYSibLhG
	weVjMCNahMwIQnvSahCwG3TM+TwQitJJrx0+iMe3paCEj0v5foCb0VWxNCVCv2WbCkLUxTFNWAq
	IMoVU5djooAJl0N0+WQf1hNbh/G50cSFX6613AoaokQeRVb9vmNbNyYGJJCehGPMl754RMsJ5i2
	H+HGj7nUi3rW7X7xEu60lPGB2pV4bIGhsbDzWdlaTsrntbNus0JtqgwMfEFdLKNpiRZf6Kos1pu
	DWVDxXoWEjA0/LpQhujx7fQXHf6i
X-Received: by 2002:a05:7300:3216:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-3077af39140mr10750847eec.8.1780976106557;
        Mon, 08 Jun 2026 20:35:06 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm24362844eec.8.2026.06.08.20.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 20:35:06 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] fbcon: correct CONFIG_FB_TILEBLITTING macro name in #endif comment
Date: Mon,  8 Jun 2026 20:35:02 -0700
Message-ID: <20260609033503.23428-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,gmx.de,suse.de,ffwll.ch];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7554-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fbdev@vger.kernel.org,m:enelsonmoore@gmail.com,m:deller@gmx.de,m:tzimmermann@suse.de,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 059C765C136

A comment in drivers/video/fbdev/core/fbcon.c incorrectly refers to
CONFIG_MISC_TILEBLITTING instead of CONFIG_FB_TILEBLITTING. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b0e3e765360d..07eab2729895 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -769,7 +769,7 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
 	return 0;
 }
 
-#endif /* CONFIG_MISC_TILEBLITTING */
+#endif /* CONFIG_FB_TILEBLITTING */
 
 static void fbcon_release(struct fb_info *info)
 {
-- 
2.43.0


