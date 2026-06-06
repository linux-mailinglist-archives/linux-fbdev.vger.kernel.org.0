Return-Path: <linux-fbdev+bounces-7531-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yrMFCFWGJGoa8AEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7531-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 06 Jun 2026 22:43:01 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6F64E526
	for <lists+linux-fbdev@lfdr.de>; Sat, 06 Jun 2026 22:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=runbox.com header.s=selector1 header.b="g8NobX q";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7531-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7531-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8421F3100DD3
	for <lists+linux-fbdev@lfdr.de>; Sat,  6 Jun 2026 20:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2E23EEAF7;
	Sat,  6 Jun 2026 20:28:02 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A893CEB9B
	for <linux-fbdev@vger.kernel.org>; Sat,  6 Jun 2026 20:28:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780777682; cv=none; b=SLN3U/WtlzSw71gYA1HjJAwE/3JH1ZpXoXClw4hMp7Oz6MwhJtSaBM1gX/sEisrPzO5mMXbH1ybUzgVLmDhsbXAwNWnz09vzDNdrqBH7NmI9vSxhVbA56s4wTvJBZZEJ2xYoqKRdfiA10gCbJCvy7Ue4qNUVAarNSu76ranTkzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780777682; c=relaxed/simple;
	bh=uOBtuBXG1NR1T3WLW02bOCfhg8z/JVE2MOuVzIlDmgg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VnaIjb7BwjJS3/jh2J71RRlntgf83Hbb1hi81LhpMAosrB8PRDF5okD1a3dRrTicS9jO+2nD/tVsxaM3pi41NFrAlO5Guhu7JWv/15DKoEK0DmOw/4ICoQQC1l8HoIiBTU5Vr9GVgwakPd5obrz4K4P7yYXstRgkAEO0BmENxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=g8NobXqt; arc=none smtp.client-ip=185.226.149.37
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxcb-007NWf-5J; Sat, 06 Jun 2026 22:27:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=w9rfQJKe+zMqlTtxFH4kG9pticirwoJsZRsMjcLrr3M=; b=g8NobX
	qtYWBBba5XBa9T5+Aw9bQksIMtU6/TN4yIclBY4ZpUdbRddz+FPA41ptxkEnBQ3sTFjeuzjxO68rQ
	LRmlr8y2lXUz3DcOcpNsjGJQCMl+Ew4NcCFGRLVRBmP2qWsc6bQCi462DBU3V6CEyPCRUhboqFRm6
	XlnXYfZAQ60S/ryRYsIwkV33z6TH+47/JusWKBRcWnZrGZ9I58UdjhnS5cwfYMR4Wr90EFRQSKP8F
	SQGzqILzWVesD2SKnS89mAbjl2TKpWhNahTe7+j0XRU/cW6ag7hZM6uhy1ZNeQqr6czEyM8FuOcXW
	gSOuvN8cVHBTesSCV/JLfC+QQvhQ==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxca-0000vh-QW; Sat, 06 Jun 2026 22:27:56 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wVxcU-006elj-DT;
	Sat, 06 Jun 2026 22:27:50 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/video/fbdev/sis: Replace strlen() strcpy() pair with strscpy()
Date: Sat,  6 Jun 2026 21:27:41 +0100
Message-Id: <20260606202744.5113-2-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7531-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-fbdev@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmx.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:arnd@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:deller@gmx.de,m:david.laight.linux@gmail.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[runbox.com:+];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[runbox.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2E6F64E526

From: David Laight <david.laight.linux@gmail.com>

Use the result of strscpy() for the overflow check.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
This is one of a group of patches that remove potentially unbounded
strcpy() calls.

They are mostly replaced by strscpy() or, when strlen() has just been
called, with memcpy() (usually including the '\0').

Calls with copy string literals into arrays are left unchanged.
They are safe and easily detected as such.

The changes were made by getting the compiler to detect the calls and
then fixing the code by hand.

Note that all the changes are only compile tested.

Some Makefiles were changed to allow files to contain strcpy().
As well as 'difficult to fix' files, this included 'show' functions
as they really need to use sysfs_emit() or seq_printf().

All the patches are being sent individually to avoid very long cc lists.
Apologies for the terse commit messages and likely unexpected tags.
(There are about 100 patches in total.)

 drivers/video/fbdev/sis/sis_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 84567d67f71d..95f976b49143 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -204,8 +204,7 @@ static void sisfb_search_mode(char *name, bool quiet)
 		return;
 	}
 
-	if(strlen(name) <= 19) {
-		strcpy(strbuf1, name);
+	if (strscpy(strbuf1, name) > 0) {
 		for(i = 0; i < strlen(strbuf1); i++) {
 			if(strbuf1[i] < '0' || strbuf1[i] > '9') strbuf1[i] = ' ';
 		}
-- 
2.39.5


