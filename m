Return-Path: <linux-fbdev+bounces-6824-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJEvDK7N1GmtxgcAu9opvQ
	(envelope-from <linux-fbdev+bounces-6824-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Apr 2026 11:26:06 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B930E3ABE72
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Apr 2026 11:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0EBDA3005ABD
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Apr 2026 09:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948153A1E92;
	Tue,  7 Apr 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H+41Ete4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Az44Td5M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H+41Ete4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Az44Td5M"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4583921C2
	for <linux-fbdev@vger.kernel.org>; Tue,  7 Apr 2026 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553963; cv=none; b=U2AyeYXZf91QaynffFQ7Vl0Ly3Pv3KMOrlch5HC+35roE8shJrVMl4qPNI3I3Tbl1BoxneYTxgU3wWis/l1aqEXOQKjTWkstwM30oI7IfPOrTpCdkk6K67iHKNMgM5B9MixgbfRQOlbMjsALVErd5sVlQQtIPnG4xpO01ROydaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553963; c=relaxed/simple;
	bh=Tupz15X62z9wMWLvPlc7XFJflAo7Ct6U9BlMg/oUkQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P868zPz4bnOH4zfccGKs24qqHoVrfo1pmCTub9KHJOSsIKWZOKTIR6e7b0G1chHMNoTwQYqVkfddYiubaHY35bCA2XcUHWSv0KjE/X1Avu21XVVRhvoVHuvSXOGNq1vquSnFmmnv70VIIwtrxgb/pRMDh6FS3OnRE5LbC36QIwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H+41Ete4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Az44Td5M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H+41Ete4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Az44Td5M; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 78CB14E39F;
	Tue,  7 Apr 2026 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775553960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UZZh6m9eAmL3QEIgOTi7qJiHlPvHfejMaPcq+0us21c=;
	b=H+41Ete45hQJlmJqNyrQlRqqqEFoWT765dcABGv7TKU5VSh5DkSKKd44ggwbOTGQ7SwVtj
	yKfA/IsmQk/1XDafv7q5uokNcQNvULd9lQXlqhFuNKq+YGVY6RkzVT+omlQ9ZfAhlBYBRE
	DvZ7Gyfq8bpfv9I8sAo0rGgbumSGsaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775553960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UZZh6m9eAmL3QEIgOTi7qJiHlPvHfejMaPcq+0us21c=;
	b=Az44Td5M68XkHubthspa98uLBONNf8XXp86rsd3Q7mfUMhQUbouo3qnoctX1zQxO6q56+7
	gKIBRqSBcI7WeQAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775553960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UZZh6m9eAmL3QEIgOTi7qJiHlPvHfejMaPcq+0us21c=;
	b=H+41Ete45hQJlmJqNyrQlRqqqEFoWT765dcABGv7TKU5VSh5DkSKKd44ggwbOTGQ7SwVtj
	yKfA/IsmQk/1XDafv7q5uokNcQNvULd9lQXlqhFuNKq+YGVY6RkzVT+omlQ9ZfAhlBYBRE
	DvZ7Gyfq8bpfv9I8sAo0rGgbumSGsaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775553960;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UZZh6m9eAmL3QEIgOTi7qJiHlPvHfejMaPcq+0us21c=;
	b=Az44Td5M68XkHubthspa98uLBONNf8XXp86rsd3Q7mfUMhQUbouo3qnoctX1zQxO6q56+7
	gKIBRqSBcI7WeQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 319974A0B1;
	Tue,  7 Apr 2026 09:26:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hHTrCqjN1GmDVwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 07 Apr 2026 09:26:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	geert@linux-m68k.org,
	simona@ffwll.ch,
	sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/10] fbcon,fonts: Refactor framebuffer console rotation
Date: Tue,  7 Apr 2026 11:23:11 +0200
Message-ID: <20260407092555.58816-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmx.de,linuxfoundation.org,kernel.org,linux-m68k.org,ffwll.ch,ravnborg.org];
	TAGGED_FROM(0.00)[bounces-6824-lists,linux-fbdev=lfdr.de];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B930E3ABE72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor the framebuffer console rotation into individual components
for glyphs, fonts and the overall fbcon state. Right now this is mixed
up in fbcon_rotate.{c,h}. Also build cursor rotation on top of the new
interfaces.

Start with an OOB fix in patch 1. If buffer allocation fails, fbcon
currently uses a too-small glyph buffer for output. Avoid that.

Patches 2 to 4 make a number of small improvements to the font library
and its callers.

Patches 5 to 8 refactor the font rotation. Fbcon rotation rotates each
individual glyph in a font buffer and uses the rotated buffer's glyphs
for output. The result looks like the console buffer has been rotated
as a whole. Split this into helpers that rotate individual glyphs and
a helper that rotates the font buffer of these. Then reimplement fbcon
rotation on top. Document the public font helpers.

Patch 9 rebuilds cursor rotation on top of the new glyph helpers. The
fbcon cursor is itself a glyph that has to be rotated in sync with the
font.

Patch 10 moves all state of fbcon rotation into a single place and makes
it a build-time conditional.

Tested with fbcon under bochs on Qemu.

Built upon the fbcon changes at [1].

v2:
- fix sparse truncated-bits warning
- improve font sorting in Makefile
- fix typos

[1] https://lore.kernel.org/linux-fbdev/20260309141723.137364-1-tzimmermann@suse.de/

Thomas Zimmermann (10):
  fbcon: Avoid OOB font access if console rotation fails
  vt: Implement helpers for struct vc_font in source file
  lib/fonts: Provide helpers for calculating glyph pitch and size
  lib/fonts: Clean up Makefile
  lib/fonts: Implement glyph rotation
  lib/fonts: Refactor glyph-pattern helpers
  lib/fonts: Refactor glyph-rotation helpers
  lib/fonts: Implement font rotation
  fbcon: Fill cursor mask in helper function
  fbcon: Put font-rotation state into separate struct

 drivers/tty/vt/vt.c                     |  34 +++
 drivers/video/fbdev/core/bitblit.c      |  35 +--
 drivers/video/fbdev/core/fbcon.c        |  48 ++++-
 drivers/video/fbdev/core/fbcon.h        |  14 +-
 drivers/video/fbdev/core/fbcon_ccw.c    |  70 ++----
 drivers/video/fbdev/core/fbcon_cw.c     |  70 ++----
 drivers/video/fbdev/core/fbcon_rotate.c |  88 ++------
 drivers/video/fbdev/core/fbcon_rotate.h |  71 ------
 drivers/video/fbdev/core/fbcon_ud.c     |  67 ++----
 include/linux/console_struct.h          |  30 +--
 include/linux/font.h                    |  51 +++++
 lib/fonts/Makefile                      |  36 ++--
 lib/fonts/font_rotate.c                 | 275 ++++++++++++++++++++++++
 lib/fonts/fonts.c                       |   2 +-
 14 files changed, 525 insertions(+), 366 deletions(-)
 create mode 100644 lib/fonts/font_rotate.c

-- 
2.53.0


