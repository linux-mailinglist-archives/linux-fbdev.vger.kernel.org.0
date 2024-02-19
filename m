Return-Path: <linux-fbdev+bounces-1142-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E56859FF4
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Feb 2024 10:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16A61B22711
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Feb 2024 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D11249FA;
	Mon, 19 Feb 2024 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KS9EJdm5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TSibsf8D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h2B+8jrx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qlpAfIBS"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08300250EC
	for <linux-fbdev@vger.kernel.org>; Mon, 19 Feb 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708335593; cv=none; b=TB7AaiFmcycmjA4ZQjYdw5tgYR9PazhsguUkZjFHmwDbpmcZFqRystaI05BxMEoNazY+fPcmxEHBnVebRYXPnGJ4Ox+YJrYnzHg1jWhpSnwPp1dnKSxM9J1oqkSWcvTEkripHllPB76RRx5PTmoMdF2yuqTPZ0aqe/fjhi3tdG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708335593; c=relaxed/simple;
	bh=bS2R9xSBAbZLx3d0LH3p6ZqxHYGte6Pa3qoxEVWtuoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNI/KPVquMMAd1QzGuxy9mkfaRdASAEa7hN99HKumjvdKJHzssXCQ/IwhaFJD6UGyaiHfMwX+wDmmYuiB4qK27w6D0WI8wFVXW5SchRS+dNGk3AWvEISOTZgSBLIWFkJONiDobDSKzVq62JBQ+BtJYTom2wLeuM6GE76BZldjng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KS9EJdm5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TSibsf8D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h2B+8jrx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qlpAfIBS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D64B1F7E5;
	Mon, 19 Feb 2024 09:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708335589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPK+z4L5DLKy6DrrMUUcoDp6pY4YUO+89+xBPb3li+c=;
	b=KS9EJdm5FazPb92iAUrQzgkWJ4SI+P+ZgWToqMxfEC27GoYvaG1Fg/uXvkLqGPLAVUQJXg
	bEXv9rP1oNxjHSLIvM81t3v62BIVEasyTs4+rkdFsYiA2Tg8OAkMOMv9TosHAXp2Ps4tRP
	gO3OuYhC9a6ExmghrafykZ2PZpzOcUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708335589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPK+z4L5DLKy6DrrMUUcoDp6pY4YUO+89+xBPb3li+c=;
	b=TSibsf8DiQIqSoD3gaP7joKkxeaKYaJEEF7VA0cNx3cxbkAlk6WvLDIJYUtSzcOYcyU3wl
	cJ2GfA0Q5Lhfi4Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708335587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPK+z4L5DLKy6DrrMUUcoDp6pY4YUO+89+xBPb3li+c=;
	b=h2B+8jrxIMSVvYg6cJ2PZ65T+V0nrptIvcqr79bSp02spahON3GmNnfTC8DVH9RtwxISvj
	aUurb8fHJr2zZjX5u4kLRHECDKTAgYKGN+fQurgQGmJluMepJPn0+jKy2U9QysyOCY/eLG
	8xMdDbXAFjH+me58IEeslBLXRhC/73g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708335587;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPK+z4L5DLKy6DrrMUUcoDp6pY4YUO+89+xBPb3li+c=;
	b=qlpAfIBSAnDahndhv0nxYZiuA5yvxZbU/6a79rei+FRrBUqdJVimCyp/myL44oWTHNI1DT
	xVz8Bi8DDi9eIYAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D624613585;
	Mon, 19 Feb 2024 09:39:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id CE20MuIh02XlUAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 19 Feb 2024 09:39:46 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 1/9] backlight/corgi-lcd: Include <linux/backlight.h>
Date: Mon, 19 Feb 2024 10:37:26 +0100
Message-ID: <20240219093941.3684-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219093941.3684-1-tzimmermann@suse.de>
References: <20240219093941.3684-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=h2B+8jrx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qlpAfIBS
X-Spamd-Result: default: False [0.56 / 50.00];
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
	 R_RATELIMIT(0.00)[to_ip_from(RLw1715dab7ink4c1kuyfofm5y)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com,linux.intel.com,ffwll.ch,gmail.com,linuxfoundation.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.13)[95.80%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 0.56
X-Rspamd-Queue-Id: 3D64B1F7E5
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

Resolves the proxy include via <linux/fb.h>, which does not require the
backlight header.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/corgi_lcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index 0a57033ae31d1..dd765098ad989 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -11,6 +11,7 @@
  *	by Eric Miao <eric.miao@marvell.com>
  */
 
+#include <linux/backlight.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
-- 
2.43.0


