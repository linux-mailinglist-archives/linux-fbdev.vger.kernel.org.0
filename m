Return-Path: <linux-fbdev+bounces-1054-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D07851902
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 17:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C7EFB21444
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 16:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7DFB3D55F;
	Mon, 12 Feb 2024 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="apwABlUF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h+kBDd7W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="apwABlUF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h+kBDd7W"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBFE3D3B1;
	Mon, 12 Feb 2024 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707755214; cv=none; b=j12t0eNO7gXA1NLnNjBu/n2guG5vAJc7x4/sDt5q4xs4JvM0D9ucqNOwS/K+DhEtcDyy8hVsmSCHGZa+lyJk6QghKp2DfjKDwotIu/JgSe/lsbFIuDhoEs00CKrTXF0QH1x1gxf25zraOsN7iN/WFgxEUYBHzGROgiJtQNchgUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707755214; c=relaxed/simple;
	bh=XNnNJLnyGQzHvM/K968wp9eTcL5XIIdEMbBVIBH0usk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z8ToPtpAMShO/ffF1dH9IWDoAL93X2CXpowYBQXZ33vbisiUnKCWytxN3Me5tQrSzmgztO2XvZCeiArXyNoZ+PMKEi1I0mJRHE4iajB1F3xjyjt3olirg947hwacVndSabzzbMmQILiRD1poLpkuGOAkUJbEyJC9fbuo3+E4tac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=apwABlUF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h+kBDd7W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=apwABlUF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h+kBDd7W; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B9EA1FD57;
	Mon, 12 Feb 2024 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707755211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro4snmsEnHJB29EgpEEblL2WKrNaOw8ZqXzEeIQrbUU=;
	b=apwABlUFtTWOvox6/NgvvHBe8AVk3/m/WiDsWo2dLEJgmHQKlPAqk0Vz3iSsJfSMeodoXY
	NfNKG3MYi1plYxfOlRgMyKVko0IMn8zYjv1CE4lXyIaf/HYQh9TbXmA7N/zPYve4bMX7oc
	LXyr9khZ6JhJ4pJVeSGeQIr96xsEDYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707755211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro4snmsEnHJB29EgpEEblL2WKrNaOw8ZqXzEeIQrbUU=;
	b=h+kBDd7WYZtMODOk7ikksp0F+H+i7GbnOJ1WMGsoAHaHnKnNPQNXUPok8Ly6bOkhNYyeWQ
	VXWQzegvohAqljAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707755211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro4snmsEnHJB29EgpEEblL2WKrNaOw8ZqXzEeIQrbUU=;
	b=apwABlUFtTWOvox6/NgvvHBe8AVk3/m/WiDsWo2dLEJgmHQKlPAqk0Vz3iSsJfSMeodoXY
	NfNKG3MYi1plYxfOlRgMyKVko0IMn8zYjv1CE4lXyIaf/HYQh9TbXmA7N/zPYve4bMX7oc
	LXyr9khZ6JhJ4pJVeSGeQIr96xsEDYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707755211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ro4snmsEnHJB29EgpEEblL2WKrNaOw8ZqXzEeIQrbUU=;
	b=h+kBDd7WYZtMODOk7ikksp0F+H+i7GbnOJ1WMGsoAHaHnKnNPQNXUPok8Ly6bOkhNYyeWQ
	VXWQzegvohAqljAQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 09F8F13A3D;
	Mon, 12 Feb 2024 16:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id kC4YActGymXmXgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 16:26:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/10] fbdev/sh_mobile_lcdc_fb: Remove struct backlight_ops.check_fb
Date: Mon, 12 Feb 2024 17:16:40 +0100
Message-ID: <20240212162645.5661-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212162645.5661-1-tzimmermann@suse.de>
References: <20240212162645.5661-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.28
X-Spamd-Result: default: False [-3.28 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLbrmj4aennmrpd7btm9n9zy3k)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.98)[99.92%]
X-Spam-Flag: NO

The driver sets struct fb_info.bl_dev to the correct backlight
device. Thus rely on the backlight core code to match backlight
and framebuffer devices, and remove the extra check_fb function
from struct backlight_ops.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index eb2297b37504c..bf34c8ec1a26c 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -2140,17 +2140,10 @@ static int sh_mobile_lcdc_get_brightness(struct backlight_device *bdev)
 	return ch->bl_brightness;
 }
 
-static int sh_mobile_lcdc_check_fb(struct backlight_device *bdev,
-				   struct fb_info *info)
-{
-	return (info->bl_dev == bdev);
-}
-
 static const struct backlight_ops sh_mobile_lcdc_bl_ops = {
 	.options	= BL_CORE_SUSPENDRESUME,
 	.update_status	= sh_mobile_lcdc_update_bl,
 	.get_brightness	= sh_mobile_lcdc_get_brightness,
-	.check_fb	= sh_mobile_lcdc_check_fb,
 };
 
 static struct backlight_device *sh_mobile_lcdc_bl_probe(struct device *parent,
-- 
2.43.0


