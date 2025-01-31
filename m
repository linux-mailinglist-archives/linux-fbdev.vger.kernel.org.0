Return-Path: <linux-fbdev+bounces-3618-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F3FA23EC9
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2025 15:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23258166EB5
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2025 14:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8901C760A;
	Fri, 31 Jan 2025 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wzd8FjwE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xKdpx5gJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wzd8FjwE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xKdpx5gJ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C91C4A3D
	for <linux-fbdev@vger.kernel.org>; Fri, 31 Jan 2025 14:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332073; cv=none; b=HRyniZRgjABR/zw+SJ+nTPaW7I6MxnezAMjbONpypQ8S+RsYlTV9RHIH4DJWEelBqcTYJlQmWu2w/Y8ue4mk9DfdI8R+ilOe/6WiZFUnRU9P25qV/Qs65D1pV50PmdpESdgya37pk5ql8u4oeqfIIvDj4tW1fvLOIlnZQyFJt9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332073; c=relaxed/simple;
	bh=aXZJ2xg0C8H1H+yCCqyGUsDd5I1yXxfRidSUstKepSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YDe5KlF61Rd4/u7KLRDts8QryDv4Bpbc4826EmLsXg67Ue/R0BxOlVSO0udLpw6YGFT1kF3lCgQ8e5iSBmEvdJlTgq9tfMQdIVb3pfOrQP9J2w8vaB2qor0AYZOY9kuTeNuq4hXFA7QAGeS+/icAZsizx+IgaOOyzmd2lzPd7Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wzd8FjwE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xKdpx5gJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wzd8FjwE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xKdpx5gJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 877CD1F393;
	Fri, 31 Jan 2025 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738332069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S153l6B3AduIBZNfDiyEhzgGOzMGd5A1xHyAvVsNPy8=;
	b=Wzd8FjwEAw2KoQXYHFFYbhxcKUjuXGpj0tNdMlrQ0VbUem0qsVD5be2rmFxC0d+V8cMJhV
	t6AaQnNtG+0IlUCyK/YWbOPkz+i41lEkdw4mezoL5LwXRAvOSpsd9PK42mgPcsms/nMuAW
	7GznnUeoCGauCx8GtTex3CUdCg6rBlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738332069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S153l6B3AduIBZNfDiyEhzgGOzMGd5A1xHyAvVsNPy8=;
	b=xKdpx5gJnG7dizMZflIsrtsmERreHoo6us32XrUVtpMuRNFJJfj+CVOUBg3D+mVlSstV7o
	7XTyBUH/KhtOetAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738332069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S153l6B3AduIBZNfDiyEhzgGOzMGd5A1xHyAvVsNPy8=;
	b=Wzd8FjwEAw2KoQXYHFFYbhxcKUjuXGpj0tNdMlrQ0VbUem0qsVD5be2rmFxC0d+V8cMJhV
	t6AaQnNtG+0IlUCyK/YWbOPkz+i41lEkdw4mezoL5LwXRAvOSpsd9PK42mgPcsms/nMuAW
	7GznnUeoCGauCx8GtTex3CUdCg6rBlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738332069;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S153l6B3AduIBZNfDiyEhzgGOzMGd5A1xHyAvVsNPy8=;
	b=xKdpx5gJnG7dizMZflIsrtsmERreHoo6us32XrUVtpMuRNFJJfj+CVOUBg3D+mVlSstV7o
	7XTyBUH/KhtOetAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3873F13AF2;
	Fri, 31 Jan 2025 14:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uItzDKXXnGfbcQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 14:01:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	michael.hennerich@analog.com,
	support.opensource@diasemi.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/16] backlight: as3711_bl: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 14:58:36 +0100
Message-ID: <20250131140103.278158-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131140103.278158-1-tzimmermann@suse.de>
References: <20250131140103.278158-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,analog.com,diasemi.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLegg5g4pk98t76ga9u9jr5icm)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 

This driver does not require <linux/fb.h>. Remove the include
statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/as3711_bl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
index e6f66bb35ef59..9f89eb19894e3 100644
--- a/drivers/video/backlight/as3711_bl.c
+++ b/drivers/video/backlight/as3711_bl.c
@@ -10,7 +10,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/fb.h>
 #include <linux/kernel.h>
 #include <linux/mfd/as3711.h>
 #include <linux/module.h>
-- 
2.48.1


