Return-Path: <linux-fbdev+bounces-7546-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eI0+KcKRJmpzYwIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7546-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 08 Jun 2026 11:56:18 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4155D654C59
	for <lists+linux-fbdev@lfdr.de>; Mon, 08 Jun 2026 11:56:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=runbox.com header.s=selector1 header.b="ss2jFu U";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7546-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7546-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 312F2300A4BA
	for <lists+linux-fbdev@lfdr.de>; Mon,  8 Jun 2026 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BF03BADB5;
	Mon,  8 Jun 2026 09:55:47 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569083B961F
	for <linux-fbdev@vger.kernel.org>; Mon,  8 Jun 2026 09:55:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912547; cv=none; b=gF1jRKAA5HVJY2ljL0RuB+++qecX23mitsCbIjmBnGJXwYxocez7/X8AHnwcepC8hL3NsesawiK6JLTtiurHDTDixxmKYaGF0R350koss/GzpVRR8dRxWgFxrB7GmZtEwWsmZOU57tyCOteDfk5BpmMLLsvmIn40Qrruipcn9A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912547; c=relaxed/simple;
	bh=lG+l0nz/ofB6PBeznJSwBYG0oHFN3QzTOtQ++iVjL58=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k8UWae4IOFQ7u+JW53KapRv9ZJcXMVSeHt9r0Pt0toj08+7EnC/2g7HOHFUZ5tBRg7HX958Wlqa8n7XiXhmm86Ny6fFAo9kqoDCBgcpTznn+8HZc4aXFe9TAef1ioFjcF+h8Bv+kPjuEvlp9tgq6+W5o87AODrHr08kfoxTdsIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=ss2jFuUo; arc=none smtp.client-ip=185.226.149.37
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhn-00BRwV-76; Mon, 08 Jun 2026 11:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=xVqIb0lvImaOng2149ntOf4c24J0oVttsRUjwn998OA=; b=ss2jFu
	UoSPCSfsvNjOtKrKuBsaSmNNXpZzPLZ1OPg3SSZn90OQzIZHR1k6Ho5AYn895gXTd37Wvao53SUTT
	1eSo+QKS8hk1QzJs6ZfLPrudDBjavGd8aiRLyYOe23MtifvfbiV0IMXimPno8HsfSIq93c9Y4+bJ/
	lnjaudWvPqENSfYuMShPZxJ6WdW5xV4bbhIuDq0StU0O8bLnEDlT6DYyjRJNoF9NhnMVUA6UDKApe
	ym6cQige3cy9e1tMqlUO3aYRv29xx2YG7iPCqaOrE0CuxuLpsZb/HCcYp8Nfid18FDMthzqRliaR2
	QBdKueAJOD4HfFOZvuRePAzxWDJA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhm-0000Cn-HZ; Mon, 08 Jun 2026 11:55:38 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wWWhd-00Ag6G-RJ;
	Mon, 08 Jun 2026 11:55:29 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Helge Deller <deller@gmx.de>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/video/fbdev/s3fb: Use strscpy() to copy strings into arrays
Date: Mon,  8 Jun 2026 10:54:55 +0100
Message-Id: <20260608095523.2606-11-david.laight.linux@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7546-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-fbdev@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmx.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:linux-hardening@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arnd@kernel.org,m:deller@gmx.de,m:david.laight.linux@gmail.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[runbox.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4155D654C59

From: David Laight <david.laight.linux@gmail.com>

Replacing strcpy() with strscpy() ensures that overflow of the target
buffer cannot happen.

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

 drivers/video/fbdev/s3fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index ba30e5568cab..b679ccdb38e2 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1333,7 +1333,7 @@ static int s3_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	vga_wcrt(par->state.vgabase, 0x38, cr38);
 	vga_wcrt(par->state.vgabase, 0x39, cr39);
 
-	strcpy(info->fix.id, s3_names [par->chip]);
+	strscpy(info->fix.id, s3_names[par->chip]);
 	info->fix.mmio_start = 0;
 	info->fix.mmio_len = 0;
 	info->fix.type = FB_TYPE_PACKED_PIXELS;
-- 
2.39.5


