Return-Path: <linux-fbdev+bounces-3427-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 765AA9EB314
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Dec 2024 15:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51F18283802
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Dec 2024 14:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8BA1AE877;
	Tue, 10 Dec 2024 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VOve/0JE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aYh3RYDp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mrUxiBCl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y3FFs/gu"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C31ACED0
	for <linux-fbdev@vger.kernel.org>; Tue, 10 Dec 2024 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733840620; cv=none; b=WOUkNZ1qLeh0nAXRDYOzLOESsa8g7d3TvVXZR1+OyaG+6k+m6eb4+uoH77ZLl6HWicp4+etad8sS0tnEI7mXa7JrFYZN6P6fNZxzMTrJg4Mkk09hUOHwPHNICNsdgzzOfzJqgfEtvT+HKPFqZAKYmviHdPmqguT0e3PehkXXwtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733840620; c=relaxed/simple;
	bh=OXR7rI5OyR1AbA5wVGwAEqcz49ausujoJtxxDH8OZf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhhtLytEJPVMSU7o8GhGd9h/RnLJg5jsQjKUUjelKNxMPL2GBmS4yS3ldHSY9GK2QPopcIrGKAZcMNE7WB+FN+w1mYiTMZIOa+a90fUQ+j6SKm4gtg0PxYnnAFbQtjS6pxyudau22yBgniUDQlhE/l2rkzw0zbRN4FIg8JVbSaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VOve/0JE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aYh3RYDp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mrUxiBCl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y3FFs/gu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7A2221166;
	Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=VOve/0JEHjApS7cwwJv88EzR7fOFa74+ds4btSsDXKrCXlDHhlf3fpFg1xWyAqv+WK7ym+
	z190UBtFp3aLwEAhT0j5VbZKU/yqpe8wyqFQbAcH81z9TJd/skUyt6vE60ZiyBE0FwL0HI
	3H6iKjNmpTHwKeQoOi46QCWs6bgiwVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=aYh3RYDprAiGxhICTUYkh45iw4Mx2cC7+6T/oD1LDWiCJCwaiffXZpzkQNU+oivROCUcNR
	PN6OnMRt69zjNJBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mrUxiBCl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Y3FFs/gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733840615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=mrUxiBCl6UjVc0YOankPUNv5KtIiboJ6Jh71LKpv5Gi4f/rq6T3/XSl4CNQbU8YhKMq+s3
	ccEdI5tSLEGpFT+2UbBU8RYwUcB1uyg7KGXOuPWH69QTQBJ/cxCEb2oIVDzp6HeOHQUswb
	w3KoT07Rlczellls6ti5VBkfyIj42hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733840615;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GB9q3GASfVdx/kiMIAlNdjcRL4d4cfHFx+cud4xXi/M=;
	b=Y3FFs/gurgcR84Gnh7EVeA1eqV8J3py4LRELHbnAvqcd/fyuuxLVNyHaYPYf/6ForD1TFd
	1sEHLNx8qOzo8xBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E78713A69;
	Tue, 10 Dec 2024 14:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kNJyJedOWGfREwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 10 Dec 2024 14:23:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	arnd@arndb.de,
	deller@gmx.de,
	simona@ffwll.ch,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm: rework FB_CORE dependency
Date: Tue, 10 Dec 2024 15:09:56 +0100
Message-ID: <20241210142329.660801-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241210142329.660801-1-tzimmermann@suse.de>
References: <20241210142329.660801-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E7A2221166
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,arndb.de,gmx.de,ffwll.ch,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,arndb.de:email,patchwork.freedesktop.org:url];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

From: Arnd Bergmann <arnd@arndb.de>

The 'select FB_CORE' statement moved from CONFIG_DRM to DRM_CLIENT_LIB,
but there are now configurations that have code calling into fb_core
as built-in even though the client_lib itself is a loadable module:

x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_set_suspend':
drm_fb_helper.c:(.text+0x2c6): undefined reference to `fb_set_suspend'
x86_64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
drm_fb_helper.c:(.text+0x2e1): undefined reference to `fb_set_suspend'

In addition to DRM_CLIENT_LIB, the 'select' needs to be at least in
DRM_KMS_HELPER and DRM_GEM_SHMEM_HELPER, so add it here.

This patch is the KMS_HELPER part of [1].

Fixes: dadd28d4142f ("drm/client: Add client-lib module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/141411/ # 1
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6105a55eb464..d4efacbb24a3 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -99,6 +99,7 @@ config DRM_KUNIT_TEST
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
+	select FB_CORE if DRM_FBDEV_EMULATION
 	help
 	  CRTC helpers for KMS drivers.
 
-- 
2.47.1


