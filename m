Return-Path: <linux-fbdev+bounces-1072-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A5852B80
	for <lists+linux-fbdev@lfdr.de>; Tue, 13 Feb 2024 09:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E597B22424
	for <lists+linux-fbdev@lfdr.de>; Tue, 13 Feb 2024 08:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1124E21A04;
	Tue, 13 Feb 2024 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qi3mYYwV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T/Fqr9QH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qi3mYYwV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T/Fqr9QH"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5975520DD2
	for <linux-fbdev@vger.kernel.org>; Tue, 13 Feb 2024 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707813851; cv=none; b=W05Bepv8afxQ1HWk7q8YWwI1mdVavm12qdFTsFJoXpWzZPhBWVosqLJCIEaF5OJwpVWu2mJ1L+Kcr3y6IuWeJVETJnoYEjhXJB6WvtbKQGYO9SG7XN1n2nmC+Srm3inhrFrleob/gQoPx46MkNEcU64Nbx0oBIjr2W3cQRgZUVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707813851; c=relaxed/simple;
	bh=ckOhVLD4GAvUk09pNUZqVXHNjW8O0kmxMG2Gj96rTNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5R3SjBMu1/thqO+FtcGoW0gqNySr8//Yj+8XLsFettgK/pl1n6MbWpgglrtvv8wjarsJ18k1J15Kms6F8+rWklMcSPhbzQEUykDvKKVonhlClNV8nVY39686zw5bS8ZhaVWdqfLNgc817OH42tsWzFU4sMD6JlqeCnH9tFwkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qi3mYYwV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T/Fqr9QH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qi3mYYwV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T/Fqr9QH; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 856532216E;
	Tue, 13 Feb 2024 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707813847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvh7S5/Y3R1JOaPard9CKd4SFyheHVqb00bq4QBKXA8=;
	b=Qi3mYYwVc542iVeyOwLNFtMCKHV3y2Jcov/wItJ/20z+MmgSdzMWkTMvxQgy4MUAHeZmEp
	IzG0342T4c7NcVV45BjkzKMq31JbA3IMcmTdGyQQ+eVuRCuTuFR1MEHVfHOr3+1a86CE/8
	N9uTdH2ejB52HpalpR1ZKUE5cgshvLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707813847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvh7S5/Y3R1JOaPard9CKd4SFyheHVqb00bq4QBKXA8=;
	b=T/Fqr9QHTZMZaJ51mjUy33GuiJzYLz9aO1/o1djrz6B3j+TL1aPPoxKIW+S3vNJDoGxOt7
	QVu6EXBUn1HWxqDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707813847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvh7S5/Y3R1JOaPard9CKd4SFyheHVqb00bq4QBKXA8=;
	b=Qi3mYYwVc542iVeyOwLNFtMCKHV3y2Jcov/wItJ/20z+MmgSdzMWkTMvxQgy4MUAHeZmEp
	IzG0342T4c7NcVV45BjkzKMq31JbA3IMcmTdGyQQ+eVuRCuTuFR1MEHVfHOr3+1a86CE/8
	N9uTdH2ejB52HpalpR1ZKUE5cgshvLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707813847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvh7S5/Y3R1JOaPard9CKd4SFyheHVqb00bq4QBKXA8=;
	b=T/Fqr9QHTZMZaJ51mjUy33GuiJzYLz9aO1/o1djrz6B3j+TL1aPPoxKIW+S3vNJDoGxOt7
	QVu6EXBUn1HWxqDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 2359013A2C;
	Tue, 13 Feb 2024 08:44:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id uIk+B9cry2VOFwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 13 Feb 2024 08:44:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	jani.nikula@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 3/8] fbdev: Do not include <linux/backlight.h> in header
Date: Tue, 13 Feb 2024 09:42:21 +0100
Message-ID: <20240213084403.20995-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213084403.20995-1-tzimmermann@suse.de>
References: <20240213084403.20995-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com,linux.intel.com,ffwll.ch,gmail.com,linuxfoundation.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[18.08%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.90

Forward declare struct backlight_device and remove the include
statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 2ce2f5c2fca9a..7380d959c5d53 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -13,11 +13,11 @@
 #include <linux/workqueue.h>
 #include <linux/notifier.h>
 #include <linux/list.h>
-#include <linux/backlight.h>
 #include <linux/slab.h>
 
 #include <asm/fb.h>
 
+struct backlight_device;
 struct vm_area_struct;
 struct fb_info;
 struct device;
-- 
2.43.0


