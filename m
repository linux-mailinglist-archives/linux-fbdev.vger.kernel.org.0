Return-Path: <linux-fbdev+bounces-7111-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAFsNglz8GldTgEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7111-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Apr 2026 10:42:49 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6174805C3
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Apr 2026 10:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EABFF318DC9C
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 Apr 2026 08:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91713D410D;
	Tue, 28 Apr 2026 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="La15iDXL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i+7il6vj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M0c5fwLy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pmS+6yVb"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB7D3D4112
	for <linux-fbdev@vger.kernel.org>; Tue, 28 Apr 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365040; cv=none; b=K2TFFskw2eL0VY/OeaSkaA2dl2fNz5C0Z26mzDUJzZkYHysFypURTFLLabvbmyyUNjKSne0Nh6qudmetNjFSZq/kABWcPWEtty1sUn2IvL4OVwZJp1Ki4czw5b7BMaMT9z4jupSHJYXrY4Kj0L9JqImJU++2+iGby+sy/W9rT04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365040; c=relaxed/simple;
	bh=yoDZs1lTj1dgBgldtgiEbrRFBO9bd6HkObkP4m4ox+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q7xJbepTh5S14GCVgrtj93LmWHxsc/d8cjqDiJtKU6uLbYrCM4bzm2aG8gJG6QJyLsGvFKoZyHiPlMn02+QSdrFEaNVY43HhUp4rRN7nXHZT3No11oX36TZCHeUgXKaA9YQ4Ec4NSKxnhEjQ0aGz9XwpzI6Cg/8e8O7fpQbck+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=La15iDXL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i+7il6vj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M0c5fwLy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pmS+6yVb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AFBAD6A82C;
	Tue, 28 Apr 2026 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777365032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=avm3G1/rI1tDyvC+d6vGtEifUZQ0JEUFACZWJztxcWQ=;
	b=La15iDXLw+V2yyUgQg3+rRHYkTuzlf82dRVYa1CzjIBYfrzfn8jxyfFrv/tMFsOaV4Nvdh
	CM6fMfhmk9j/9AVDqqNkcNnCS30gLr+/WlIByAgz/O1Wmq05ZdKDofamNYkPzC/CYteEeG
	f6P1YYRZ9l94JwgDI2a2zGMNDBfpsn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777365032;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=avm3G1/rI1tDyvC+d6vGtEifUZQ0JEUFACZWJztxcWQ=;
	b=i+7il6vjAYxBHlaxb0ZKxxICBbE7iOPjsM6qQh19PPZwHqBIA6N2KhXZQyLWINF7/Y+fJs
	0bpBC5UWPECyd8Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777365031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=avm3G1/rI1tDyvC+d6vGtEifUZQ0JEUFACZWJztxcWQ=;
	b=M0c5fwLyj8v4JkryWbsPvBacdpl7u/E2TG+0Lnz0lZjF93d0bQNp7aooWxL/i3yHUw890h
	R6+B6dTmCXj6ORB+ACvUMlOmg/wV8ydEAd57lqsDvUTNZYS+QG6SCsp40rcYfQ5Z+uDQ8S
	UQOwBE2lJXwV2XaAPJzgJY9jzd2dszg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777365031;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=avm3G1/rI1tDyvC+d6vGtEifUZQ0JEUFACZWJztxcWQ=;
	b=pmS+6yVbblX+Bv05AS951GRwYjBxtudDtLVItHtbfXUxFZjv3Nk+pVEu9TIi3cw7YdJNev
	uKxDzctQ7ap44VDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85555593B0;
	Tue, 28 Apr 2026 08:30:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nCAqHydw8GnROAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 28 Apr 2026 08:30:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] lib/fonts: Fix bit position when rotating by 180 degrees
Date: Tue, 28 Apr 2026 10:28:43 +0200
Message-ID: <20260428083025.63663-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3E6174805C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7111-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid,gitlab.freedesktop.org:url,lists.freedesktop.org:email]

Fix the horizontal bit position when rotating a glyph by 180°. The
original code in rotate_ud() rounded the value in width up to a
multiple of 8, aka the bit pitch, and calculated the rotated pixel
from that value. The new code stores the glyph's pitch in bit_pitch,
but fails to update the rotated pixel's output accordingly. Simply
replacing the variable does this.

The bug can be reproduced by setting a font with an unaligned width,
such as sun12x22, like this:

 setfont sun12x22
 echo 2 > /sys/class/graphics/fbcon/rotate

Without the fix, the font looks distorted.

Fixes: a30e9e6b018f ("lib/fonts: Refactor glyph-rotation helpers")
Closes: https://lore.gitlab.freedesktop.org/drm-ai-reviews/review-patch7-20260407092555.58816-8-tzimmermann@suse.de/
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 lib/fonts/font_rotate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/fonts/font_rotate.c b/lib/fonts/font_rotate.c
index 065e0fc0667b..275406008823 100644
--- a/lib/fonts/font_rotate.c
+++ b/lib/fonts/font_rotate.c
@@ -106,7 +106,7 @@ static void __font_glyph_rotate_180(const unsigned char *glyph,
 	for (y = 0; y < height; y++) {
 		for (x = 0; x < width; x++) {
 			if (font_glyph_test_bit(glyph, x, y, bit_pitch)) {
-				font_glyph_set_bit(out, width - (1 + x + shift), height - (1 + y),
+				font_glyph_set_bit(out, bit_pitch - 1 - x - shift, height - 1 - y,
 						   bit_pitch);
 			}
 		}
-- 
2.54.0


