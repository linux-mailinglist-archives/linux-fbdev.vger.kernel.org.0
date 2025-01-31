Return-Path: <linux-fbdev+bounces-3628-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3CEA23ED9
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2025 15:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DB577A3ADE
	for <lists+linux-fbdev@lfdr.de>; Fri, 31 Jan 2025 14:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCF51CB9E2;
	Fri, 31 Jan 2025 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bh2OhAZM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2AKc5D6j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bh2OhAZM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2AKc5D6j"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802651CAA70
	for <linux-fbdev@vger.kernel.org>; Fri, 31 Jan 2025 14:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332077; cv=none; b=ZVHaSoQPk+pRQZXiZRNlsPa7I8s7Ii64nPVKVYo+qlzdI5TeBPRHpZZg5k9NsOLWfwdRqSBIabxDPNWE0mvZx3Wp0aO986BGQPbw4bd2o0n9HSV1RW4cw8dWu5NBmZg60zwmhbh1q/KRE74IuFy/OF6LUJnIEPivNagHrxEJEJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332077; c=relaxed/simple;
	bh=q95dTmv9gzZbHKzoZC5zU8neUK7HF8WNlFgFtuSVm8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eenQI6e1TPp2u5SRpfVunqTh5uCH2aZP7PIH4rfy7RrJto2yhiiIypdOBoZBkAmdEAKy+bosqInwhSEg7tZIiN/Vq1/hGPWMLt6cWeCYP5XKMUP3BwtIwnk1WQcx7kZ51gfEpr2DwYsZGdiEgsEaI29FEVdcH8ShUrUCAYQG9uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bh2OhAZM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2AKc5D6j; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bh2OhAZM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2AKc5D6j; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 203A31F394;
	Fri, 31 Jan 2025 14:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738332070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKv3SXdA94yp0UQtHSS9uJDWnpHaqoMXoxCuYxznM+Y=;
	b=Bh2OhAZMjOoNBuFPnh2LEzWVbLaLCLQrixtb+T79MGaAmhoV9HgJOqZUPBSMqQa29jMEh9
	w8gIphvyLGqZm9ykhhEYyi4ihBtIc4tu0Ng0Z9OWWuvbng9zZz6I3aWVRpMGtADorUomfK
	vFWmSX5V06FlboMaa2fQ27hlMpLa2O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738332070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKv3SXdA94yp0UQtHSS9uJDWnpHaqoMXoxCuYxznM+Y=;
	b=2AKc5D6jknnrbTlLvq1d/gQ/TT4CkRRHhJ1i408/jnq/LqboMhEb20Lf1WeY+ALUlWNQl2
	5bHlv1t/pMX20iCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738332070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKv3SXdA94yp0UQtHSS9uJDWnpHaqoMXoxCuYxznM+Y=;
	b=Bh2OhAZMjOoNBuFPnh2LEzWVbLaLCLQrixtb+T79MGaAmhoV9HgJOqZUPBSMqQa29jMEh9
	w8gIphvyLGqZm9ykhhEYyi4ihBtIc4tu0Ng0Z9OWWuvbng9zZz6I3aWVRpMGtADorUomfK
	vFWmSX5V06FlboMaa2fQ27hlMpLa2O4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738332070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKv3SXdA94yp0UQtHSS9uJDWnpHaqoMXoxCuYxznM+Y=;
	b=2AKc5D6jknnrbTlLvq1d/gQ/TT4CkRRHhJ1i408/jnq/LqboMhEb20Lf1WeY+ALUlWNQl2
	5bHlv1t/pMX20iCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD478139B1;
	Fri, 31 Jan 2025 14:01:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sAbcMKXXnGfbcQAAD6G6ig
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
Subject: [PATCH 07/16] backlight: da903x_bl: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 14:58:38 +0100
Message-ID: <20250131140103.278158-8-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
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
 drivers/video/backlight/da903x_bl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/da903x_bl.c b/drivers/video/backlight/da903x_bl.c
index 71f21bbc7a9fc..81ff42bec0ad4 100644
--- a/drivers/video/backlight/da903x_bl.c
+++ b/drivers/video/backlight/da903x_bl.c
@@ -12,7 +12,6 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
-#include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/mfd/da903x.h>
 #include <linux/slab.h>
-- 
2.48.1


