Return-Path: <linux-fbdev+bounces-6434-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCZKNXWcpWmfEwYAu9opvQ
	(envelope-from <linux-fbdev+bounces-6434-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 02 Mar 2026 15:19:33 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EF1DA929
	for <lists+linux-fbdev@lfdr.de>; Mon, 02 Mar 2026 15:19:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6FA330B00D1
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Mar 2026 14:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99A73FD13F;
	Mon,  2 Mar 2026 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b/u9Tzrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2bzrEPAw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b/u9Tzrl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2bzrEPAw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4D383C6B
	for <linux-fbdev@vger.kernel.org>; Mon,  2 Mar 2026 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460789; cv=none; b=YLL7QyyJvtItXkQfb0iBdK4Latd3zSSKHpVSbCOTsNECYjp8nXzGyERUAxWas939zWJ94KWw3tN45LHwPEyB3Hu99VlK9lTdb1vpzf/Z1z+UNVBYRufyl6g2rRY2Q3FWs/FAlVyJC3N0Lg8IoU5xYKgWlkjwkw6N55yP8rNMVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460789; c=relaxed/simple;
	bh=y5XmvC6gfj9Y6OOeaLySFj7KBmblfrGrs0BAJ/FBFH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzocjIaxx5hK6JSkGwIctztEMm/TQnydZViE/Td6jGP/gDFKM8wWxcAahkPticFAZZgILxyZIgcUYHMM3qzkcRDFmJWwD5/5MhlEvjlvj5mBhZxVdm4Y0cKUqE/vKBXkGZFYoVQs1f7Mu/+N4R1y6/Mqw1Cb+C6VF/A2zdRIKAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b/u9Tzrl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2bzrEPAw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b/u9Tzrl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2bzrEPAw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 509533F7F5;
	Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
	b=b/u9Tzrl23HDfTAr90zvkPHr63R035p7r+FyICMT8ZQumcqWU7eL5ecb8SV9Qj707+IxWd
	0mG2lZPPuPv7AWQ+RFmu9jqwilsqx2tnYrQnFQnL3q59u+iJe7RfoxlnjS77aYfgSpilN/
	8F1+6GWa42fXkNqlOaeAtjY0TTco9Tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772460781;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
	b=2bzrEPAw0didfkJOyLaWaBHQqwWbt6TQuxMZyJFJg7tRuKaPumkoNQnUl9UElDqZMcuxS9
	2yJmNa3twN6Rq/Bw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="b/u9Tzrl";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2bzrEPAw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772460781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
	b=b/u9Tzrl23HDfTAr90zvkPHr63R035p7r+FyICMT8ZQumcqWU7eL5ecb8SV9Qj707+IxWd
	0mG2lZPPuPv7AWQ+RFmu9jqwilsqx2tnYrQnFQnL3q59u+iJe7RfoxlnjS77aYfgSpilN/
	8F1+6GWa42fXkNqlOaeAtjY0TTco9Tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772460781;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDq/cW2yhQBHf4nLvdY7/6+Jg/oVSc5PEO9Oi8OztLE=;
	b=2bzrEPAw0didfkJOyLaWaBHQqwWbt6TQuxMZyJFJg7tRuKaPumkoNQnUl9UElDqZMcuxS9
	2yJmNa3twN6Rq/Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E39B3EA6C;
	Mon,  2 Mar 2026 14:13:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QND9Be2apWleKQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 02 Mar 2026 14:13:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: gregkh@linuxfoundation.org,
	deller@gmx.de,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/13] lib/fonts: Remove trailing whitespaces
Date: Mon,  2 Mar 2026 15:08:39 +0100
Message-ID: <20260302141255.518657-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302141255.518657-1-tzimmermann@suse.de>
References: <20260302141255.518657-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6434-lists,linux-fbdev=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmx.de,ravnborg.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F4EF1DA929
X-Rspamd-Action: no action

Fix coding style. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 lib/fonts/font_acorn_8x8.c | 2 +-
 lib/fonts/font_mini_4x6.c  | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index 18755c33d249..af5fa72aa8b7 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -68,7 +68,7 @@ static const struct font_data acorndata_8x8 = {
 /* 3A */  0x00, 0x00, 0x18, 0x18, 0x00, 0x18, 0x18, 0x00, /* : */
 /* 3B */  0x00, 0x00, 0x18, 0x18, 0x00, 0x18, 0x18, 0x30, /* ; */
 /* 3C */  0x0C, 0x18, 0x30, 0x60, 0x30, 0x18, 0x0C, 0x00, /* < */
-/* 3D */  0x00, 0x00, 0x7E, 0x00, 0x7E, 0x00, 0x00, 0x00, /* = */ 
+/* 3D */  0x00, 0x00, 0x7E, 0x00, 0x7E, 0x00, 0x00, 0x00, /* = */
 /* 3E */  0x30, 0x18, 0x0C, 0x06, 0x0C, 0x18, 0x30, 0x00, /* > */
 /* 3F */  0x3C, 0x66, 0x0C, 0x18, 0x18, 0x00, 0x18, 0x00, /* ? */
 /* 40 */  0x3C, 0x66, 0x6E, 0x6A, 0x6E, 0x60, 0x3C, 0x00, /* @ */
diff --git a/lib/fonts/font_mini_4x6.c b/lib/fonts/font_mini_4x6.c
index 8d39fd447952..cc21dc70cfd1 100644
--- a/lib/fonts/font_mini_4x6.c
+++ b/lib/fonts/font_mini_4x6.c
@@ -18,15 +18,15 @@
 s{((0x)?[0-9a-fA-F]+)(.*\[([\*\ ]{4})\])}{
 
 	($num,$pat,$bits) = ($1,$3,$4);
-	
+
 	$bits =~ s/([^\s0])|(.)/ defined($1) + 0 /ge;
-	
+
 	$num = ord(pack("B8", $bits));
 	$num |= $num >> 4;
 	$num = sprintf("0x%.2x", $num);
-	
+
 	#print "$num,$pat,$bits\n";
-	
+
 	$num . $pat;
 }ge;
 
-- 
2.53.0


