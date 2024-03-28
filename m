Return-Path: <linux-fbdev+bounces-1462-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65375879829
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 16:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 973A61C217A2
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Mar 2024 15:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8A37D3E1;
	Tue, 12 Mar 2024 15:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fP5z2wXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+HOXcPy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fP5z2wXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+HOXcPy"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19E7CF10
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Mar 2024 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710258532; cv=none; b=eCEw2WrpLvV7XdXCrcjol+e/5K5ugZkzGh9YaLVl3cY5orbearaQfTZOXVa0figAquZ6+6qmNpZMxTwq87n7ayqKqFNx8jroN90nb4UG3RCk48c6aCT8YyjM/m/TFK/tXH7nYBYvjNV3wuyIkZ3A22C7BpfdvXUaSpTxQnt/1VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710258532; c=relaxed/simple;
	bh=VDppfFcEIZ26yVt1lJEK/yQgKszZatTL8YWoTR2ptlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PghBCeJ8ctV+sIwjBzl+fuZpyLwrkjgPOK0+JipoTXT2N1uqqhbGdOyUTl6m52cWKlTh/IPs6Zipa7yeaOLdf+4ydfKNiygZNwEjS1GJ6LGqIp4cyqcUwlcO7eW0KKHNNe5HXWkqdUi4L7EaQNqlxVOSzO7YCC77BJ2veyifv4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fP5z2wXT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8+HOXcPy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fP5z2wXT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8+HOXcPy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72ACF3788D;
	Tue, 12 Mar 2024 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ol7aSm+N80Qv9pQUo9Esqqz5r4Ajx8xV6UnU98he6y0=;
	b=fP5z2wXTJgx23UZuHj7Dn3arcbyLpIachdtuAYKYbjSQFEK8kOg9OmL+FguHXCuUfUW6sf
	6eZmHuUxKzDhFbPjVrE/xdNW+bO6KG9P0JoZ3XSM6sYn9PXmBtxVymx9nt/GunLDmOD2Uj
	eGht9t6CwSHw4HG5ksxiY46g+mEQQnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ol7aSm+N80Qv9pQUo9Esqqz5r4Ajx8xV6UnU98he6y0=;
	b=8+HOXcPyVaQoIXjwXBKSxiQeZQ/W7lRuA6SEHd1DYLu49fMa1L0OSbHaJ0Bgq1PwmETyOK
	X5S2/azVOUw9MdBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710258529; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ol7aSm+N80Qv9pQUo9Esqqz5r4Ajx8xV6UnU98he6y0=;
	b=fP5z2wXTJgx23UZuHj7Dn3arcbyLpIachdtuAYKYbjSQFEK8kOg9OmL+FguHXCuUfUW6sf
	6eZmHuUxKzDhFbPjVrE/xdNW+bO6KG9P0JoZ3XSM6sYn9PXmBtxVymx9nt/GunLDmOD2Uj
	eGht9t6CwSHw4HG5ksxiY46g+mEQQnA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710258529;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ol7aSm+N80Qv9pQUo9Esqqz5r4Ajx8xV6UnU98he6y0=;
	b=8+HOXcPyVaQoIXjwXBKSxiQeZQ/W7lRuA6SEHd1DYLu49fMa1L0OSbHaJ0Bgq1PwmETyOK
	X5S2/azVOUw9MdBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3219113976;
	Tue, 12 Mar 2024 15:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YMOGCmF58GUhPwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Lechner <david@lechnology.com>
Subject: [PATCH 41/43] drm/tiny/st7735r: Use fbdev-dma
Date: Tue, 12 Mar 2024 16:45:36 +0100
Message-ID: <20240312154834.26178-42-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.89 / 50.00];
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
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.01)[49.64%]
X-Spam-Score: 0.89
X-Spam-Flag: NO

Implement fbdev emulation with fbdev-dma. Fbdev-dma now supports
damage handling, which is required by st7735r. Avoids the overhead of
fbdev-generic's additional shadow buffering. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Lechner <david@lechnology.com>
---
 drivers/gpu/drm/tiny/st7735r.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index 477eb36fbb70d..1676da00883d3 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
@@ -241,7 +241,7 @@ static int st7735r_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, drm);
 
-	drm_fbdev_generic_setup(drm, 0);
+	drm_fbdev_dma_setup(drm, 0);
 
 	return 0;
 }
-- 
2.44.0


