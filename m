Return-Path: <linux-fbdev+bounces-1035-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C6C851079
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 11:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0971C21DF6
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 10:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D6017C69;
	Mon, 12 Feb 2024 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ryzjXKVx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FcUi8Fm1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ryzjXKVx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FcUi8Fm1"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F1182C5
	for <linux-fbdev@vger.kernel.org>; Mon, 12 Feb 2024 10:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733039; cv=none; b=dQ205oBfJmFDyP+9evnlza6bcc2EIMkZ8yJ28TM17H+ZMQREx4aZbpjNpEq4Bnm8ycnHxULZfMnRuZkvJZTV5XZvEqprNZh29P8qqiOUbqDB9ODapkL6Bu/joPCnuweV8jepzklNJx3tcdZPDyuamFMsvo+I2p3ObnnhymsACy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733039; c=relaxed/simple;
	bh=6cX/X3hsN8T5r82oy+xl73kBf48/v8PwepGu/nPI6is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=muO4ZfzfTdCw/gueiweOWv+hqTXgLrnGRz0PFYHKSY2QTHB/7ObwLdAl/CcOTc5U7cr/WdacnQA0nyVx8UcBs4ovpupZYf05LLQ0gFDIiJ1v+kZMiUnT7mp4PEaJTys7n2POGUMJhC8NdzO6J9iohqu1Ig1HI14OVU9F7CneYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ryzjXKVx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FcUi8Fm1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ryzjXKVx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FcUi8Fm1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5270F1F460;
	Mon, 12 Feb 2024 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707733036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
	b=ryzjXKVxVyivz8X+4s04GmNvCMAYSpn/MhtM1FQXRNWg6sd+zNgEskFY29ckMNLqhkOF0k
	1/FqdEWFfkLoTDEavrdM3TIyYr4y7j+RpFLWTB1RzmOmmnE8VmHqvJE41yB33eSI5WLOTl
	HC0ACK32pG7aTDvY5OiwbffAC6ohQZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707733036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
	b=FcUi8Fm1S40Wg4ISOVuq2pgpeJ+0DVfhSraJv91TV3aVMr88DrrqCZN7lhR0IMJuT5fj+L
	AFAJxj8xRsfBGoCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707733036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
	b=ryzjXKVxVyivz8X+4s04GmNvCMAYSpn/MhtM1FQXRNWg6sd+zNgEskFY29ckMNLqhkOF0k
	1/FqdEWFfkLoTDEavrdM3TIyYr4y7j+RpFLWTB1RzmOmmnE8VmHqvJE41yB33eSI5WLOTl
	HC0ACK32pG7aTDvY5OiwbffAC6ohQZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707733036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
	b=FcUi8Fm1S40Wg4ISOVuq2pgpeJ+0DVfhSraJv91TV3aVMr88DrrqCZN7lhR0IMJuT5fj+L
	AFAJxj8xRsfBGoCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0368D13A0E;
	Mon, 12 Feb 2024 10:17:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id h7YgOyvwyWVdBgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 10:17:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	daniel@ffwll.ch,
	airlied@gmail.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] fbdev: Clean up include dependencies in header
Date: Mon, 12 Feb 2024 11:13:12 +0100
Message-ID: <20240212101712.23675-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ryzjXKVx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FcUi8Fm1
X-Spamd-Result: default: False [2.67 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com,ffwll.ch,gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.02)[52.36%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.67
X-Rspamd-Queue-Id: 5270F1F460
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++

Remove unnecessary dependencies in the include statements of the
header file <linux/fb.h>. Several files throughout the kernel include
the fbdev header, so reducing dependencies positively affects other
subsystems as well. Also fix up nouveau, which needs backlight.h in
one of its source files.

Thomas Zimmermann (7):
  drm/nouveau: Include <linux/backlight.h>
  fbdev: Do not include <linux/backlight.h> in header
  fbdev: Do not include <linux/fs.h> in header
  fbdev: Do not include <linux/notifier.h> in header
  fbdev: Do not include <linux/slab.h> in header
  fbdev: Clean up forward declarations in header file
  fbdev: Clean up include statements in header file

 drivers/gpu/drm/nouveau/dispnv50/disp.c |  1 +
 include/linux/fb.h                      | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.43.0


