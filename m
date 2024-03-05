Return-Path: <linux-fbdev+bounces-1373-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3397787243C
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 17:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF350288FF2
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 16:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B001612E1C6;
	Tue,  5 Mar 2024 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dv/pxbwY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="li52bVwV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dv/pxbwY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="li52bVwV"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353DC1292E1;
	Tue,  5 Mar 2024 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709655890; cv=none; b=MBl0DoX2wg0hZniolqYlqtXHq0hbKaQwtFTTuiB0og5Dz4NTDYqMpZFUsYZsar62NWM88jIWi+fc/NBXcyAYO9/BSfsU1z1SLuDy1Z3CfwiP8dD10yJi0qoAxLuTn64SXlnvAbokIFJ6chVN5Mvd9ybJFXblrmDoR4h5H6pV3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709655890; c=relaxed/simple;
	bh=yB9U8pxB5LZw6YezPCdGXhKlJEofyPuV184w3Vd2mr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVzdtPSzPwTpi6BYKeJfHg5+PeW6MtqUbAYmXymJ+rFixqlEhZzMQm600ceiZDNXX/bZP+caRHtypMV4Zi3Cf1NzQQOmtSh74iOZ8zBGSkWRGKl2TrYzjBgMTTuBJVnfY2D8r1c4oMG9nQRrBP5cwOHikSAMtV0hnIR+wNFXAl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dv/pxbwY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=li52bVwV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dv/pxbwY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=li52bVwV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 700A47682A;
	Tue,  5 Mar 2024 16:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709655873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHZBh32ao496BlueMq4KcqWuXhq9l/azWpYIHeOrlrM=;
	b=Dv/pxbwY/hTAA0sNC4CPRNTfFSnQaKJ7Ij08/Ylr/DpUlXxH5jl6HbMhJ8bIPjq7UX3UDd
	4FW5ywFo87hd5aFwO+UKqYSG1elLjGQgh22aatAxEczZwBGDdRD1cwe9ztJRjdxBq98SrM
	aub2i/fMsWEHs7g0ObnNjx5dLlmnB34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709655873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHZBh32ao496BlueMq4KcqWuXhq9l/azWpYIHeOrlrM=;
	b=li52bVwVt9eD86L7h10ran4lRlXaBgPC0w0btJVrAlgzxU8yqrLqaQAyWHR7sjdJfA6QTF
	UeX09m+8vsmQPjCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709655873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHZBh32ao496BlueMq4KcqWuXhq9l/azWpYIHeOrlrM=;
	b=Dv/pxbwY/hTAA0sNC4CPRNTfFSnQaKJ7Ij08/Ylr/DpUlXxH5jl6HbMhJ8bIPjq7UX3UDd
	4FW5ywFo87hd5aFwO+UKqYSG1elLjGQgh22aatAxEczZwBGDdRD1cwe9ztJRjdxBq98SrM
	aub2i/fMsWEHs7g0ObnNjx5dLlmnB34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709655873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHZBh32ao496BlueMq4KcqWuXhq9l/azWpYIHeOrlrM=;
	b=li52bVwVt9eD86L7h10ran4lRlXaBgPC0w0btJVrAlgzxU8yqrLqaQAyWHR7sjdJfA6QTF
	UeX09m+8vsmQPjCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1AC3D13A8A;
	Tue,  5 Mar 2024 16:24:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id uIo1BUFH52WwYwAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 16:24:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	andy@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	robin@protonic.nl,
	javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 09/10] fbdev/ssd1307fb: Remove struct backlight_ops.check_fb
Date: Tue,  5 Mar 2024 17:22:42 +0100
Message-ID: <20240305162425.23845-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305162425.23845-1-tzimmermann@suse.de>
References: <20240305162425.23845-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [3.92 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,protonic.nl,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.98)[86.97%]
X-Spam-Level: ***
X-Spam-Score: 3.92
X-Spam-Flag: NO

The driver sets struct fb_info.bl_dev to the correct backlight
device. Thus rely on the backlight core code to match backlight
and framebuffer devices, and remove the extra check_fb function
from struct backlight_ops.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/ssd1307fb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
index 0d1590c61eb06..3f30af3c059e0 100644
--- a/drivers/video/fbdev/ssd1307fb.c
+++ b/drivers/video/fbdev/ssd1307fb.c
@@ -530,17 +530,10 @@ static int ssd1307fb_get_brightness(struct backlight_device *bdev)
 	return par->contrast;
 }
 
-static int ssd1307fb_check_fb(struct backlight_device *bdev,
-				   struct fb_info *info)
-{
-	return (info->bl_dev == bdev);
-}
-
 static const struct backlight_ops ssd1307fb_bl_ops = {
 	.options	= BL_CORE_SUSPENDRESUME,
 	.update_status	= ssd1307fb_update_bl,
 	.get_brightness	= ssd1307fb_get_brightness,
-	.check_fb	= ssd1307fb_check_fb,
 };
 
 static struct ssd1307fb_deviceinfo ssd1307fb_ssd1305_deviceinfo = {
-- 
2.44.0


