Return-Path: <linux-fbdev+bounces-2751-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE73942E9A
	for <lists+linux-fbdev@lfdr.de>; Wed, 31 Jul 2024 14:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C1528BDE0
	for <lists+linux-fbdev@lfdr.de>; Wed, 31 Jul 2024 12:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60CB1B013F;
	Wed, 31 Jul 2024 12:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fYYrAlWq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+5j8ocxo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fYYrAlWq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+5j8ocxo"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052E11AE87A;
	Wed, 31 Jul 2024 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429311; cv=none; b=gQAliu8ROTNRePNGQ31AHuck09OmfBwn5jwD+TnonDkPzivTsl4BhRAKnZX0igb2gmUm+x6OUim9cowreVKm/MZQqfww3ZgASEa4mC8iAmiaUTGVj2UIoVGeHftNl5rt2pQ/huPQHLceRkLVrfSFmpPxaFFQI7Win5PnArB4tdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429311; c=relaxed/simple;
	bh=2WHx77HsEkQ7U3D1P5RhWTFbezs3soCvv+8yj0uqEOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TtffYEVN6psrXD4Vs7c9TPaQEW80QrWDJjyN8pC+lwlrrKFczulQUJLzwJyQVWWlO5zv/J78GOqqb+O7qy0rp71M7YQZ/gfmLvwhZpHOpumtHXHkIudL6z36G3vQLK2kjo7SWFkXyPhl2Ii49/2F+dHuORVy0WtiiPl5MP60Phw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fYYrAlWq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+5j8ocxo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fYYrAlWq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+5j8ocxo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FBFC1F84B;
	Wed, 31 Jul 2024 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjiHfI0semFY8a+KjXeEwfXVWlYMbTDLKBUPSK/6Iak=;
	b=fYYrAlWqubWr1XMeTH57eUHyLGbQAaUOXQ++v/Cegk9KYl5z2frphhPK6BMxVUfHdjqem3
	UWoc2c5uoR9D2gaCOoUOFw4uV0kXy2WNmCsklqwQZNtb7qsBHNgI0wP5mwhqfGnVhCl5IE
	Q+lg6bP9klxazQwiDpJpkvw5MSwEKOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjiHfI0semFY8a+KjXeEwfXVWlYMbTDLKBUPSK/6Iak=;
	b=+5j8ocxoAcMi13+xFXYMkGMaJAPczNuNHKb3oiopDNLR1GWbxindH8b49Z/OmXM27DvhrT
	w5XBC0jNVwzhIzAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722429307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjiHfI0semFY8a+KjXeEwfXVWlYMbTDLKBUPSK/6Iak=;
	b=fYYrAlWqubWr1XMeTH57eUHyLGbQAaUOXQ++v/Cegk9KYl5z2frphhPK6BMxVUfHdjqem3
	UWoc2c5uoR9D2gaCOoUOFw4uV0kXy2WNmCsklqwQZNtb7qsBHNgI0wP5mwhqfGnVhCl5IE
	Q+lg6bP9klxazQwiDpJpkvw5MSwEKOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722429307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CjiHfI0semFY8a+KjXeEwfXVWlYMbTDLKBUPSK/6Iak=;
	b=+5j8ocxoAcMi13+xFXYMkGMaJAPczNuNHKb3oiopDNLR1GWbxindH8b49Z/OmXM27DvhrT
	w5XBC0jNVwzhIzAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEFE213AD8;
	Wed, 31 Jul 2024 12:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UGobOXovqmYiUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:35:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 7/9] fbdev: radeonfb: Use backlight power constants
Date: Wed, 31 Jul 2024 14:33:48 +0200
Message-ID: <20240731123502.1145082-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731123502.1145082-1-tzimmermann@suse.de>
References: <20240731123502.1145082-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/aty/radeon_backlight.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/aty/radeon_backlight.c b/drivers/video/fbdev/aty/radeon_backlight.c
index 23a38c3f3977..9e41d2a18649 100644
--- a/drivers/video/fbdev/aty/radeon_backlight.c
+++ b/drivers/video/fbdev/aty/radeon_backlight.c
@@ -179,7 +179,7 @@ void radeonfb_bl_init(struct radeonfb_info *rinfo)
 		217 * FB_BACKLIGHT_MAX / MAX_RADEON_LEVEL);
 
 	bd->props.brightness = bd->props.max_brightness;
-	bd->props.power = FB_BLANK_UNBLANK;
+	bd->props.power = BACKLIGHT_POWER_ON;
 	backlight_update_status(bd);
 
 	printk("radeonfb: Backlight initialized (%s)\n", name);
-- 
2.45.2


