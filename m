Return-Path: <linux-fbdev+bounces-1036-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76685107B
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 11:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 892871F223C3
	for <lists+linux-fbdev@lfdr.de>; Mon, 12 Feb 2024 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA1217C70;
	Mon, 12 Feb 2024 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HBd+aFeK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rrwkHsog";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HBd+aFeK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rrwkHsog"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8A182C7
	for <linux-fbdev@vger.kernel.org>; Mon, 12 Feb 2024 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733040; cv=none; b=QiSJnxcVALEGP/MbuOjRRkg2lH3tD9r+bOkJTrPSjaS2zAfI+ZZuKOSWgrw4UDTrVt7AWNOj+gWtptxEwb/CnZE0rTbbYN3qg2NXEU9kzPhsyTqAhr66cZWmrTlS+ugesFTr3oIttNGJ/Y6rKCeId7BhLjY56XIcxg+rKmelS/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733040; c=relaxed/simple;
	bh=0ZgMKxuTWBFpUEV6QQHcaWdMgMhdKK/M+9LsX88jJ5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7gEiIpzR775p/3+Xq0jZ/06U0WQSWC2ktDyUEvfbOEN0kVKqf7yJ3w6q2rJUF5uRDhpEvGakNzUDkpp74iSvuYyeWnrcPsKDiIDUcUP3jxdYCBbAzCW2mMnKs/Lkfv+Dhoe8OjRp8VSYYABZyXg62xAjqSJN/ifquG839B0CD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HBd+aFeK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rrwkHsog; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HBd+aFeK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rrwkHsog; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A66E31FBAA;
	Mon, 12 Feb 2024 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707733036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLqD/J6g/u5f0e148IyBU3qRazqfeeJF0t5wjSt53PA=;
	b=HBd+aFeKmoPAYBRys+upiKaJ5xXNVfZ48EPKy0ISqvnIPuLYibv5odxsxj5QygTfK7S4kE
	g9hhDsptR41PQuqvRKgbjV3K75GnC76OiUe09nxR7rr6WzrBhr/ztOJqV9xRgGAOkcR0DN
	i1uRz22/avuaJ1+lSNmduyEiiN9l0cI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707733036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLqD/J6g/u5f0e148IyBU3qRazqfeeJF0t5wjSt53PA=;
	b=rrwkHsog2DwLwyVoUy6PMHtma3eVt92YKajLric5aNNbREvJvHx9suODDAKzsr9nOLZAV5
	q3gC2xzDJVd+4HAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707733036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLqD/J6g/u5f0e148IyBU3qRazqfeeJF0t5wjSt53PA=;
	b=HBd+aFeKmoPAYBRys+upiKaJ5xXNVfZ48EPKy0ISqvnIPuLYibv5odxsxj5QygTfK7S4kE
	g9hhDsptR41PQuqvRKgbjV3K75GnC76OiUe09nxR7rr6WzrBhr/ztOJqV9xRgGAOkcR0DN
	i1uRz22/avuaJ1+lSNmduyEiiN9l0cI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707733036;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLqD/J6g/u5f0e148IyBU3qRazqfeeJF0t5wjSt53PA=;
	b=rrwkHsog2DwLwyVoUy6PMHtma3eVt92YKajLric5aNNbREvJvHx9suODDAKzsr9nOLZAV5
	q3gC2xzDJVd+4HAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 57F7F13A2D;
	Mon, 12 Feb 2024 10:17:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id OBI4FCzwyWVdBgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 10:17:16 +0000
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
Subject: [PATCH 1/7] drm/nouveau: Include <linux/backlight.h>
Date: Mon, 12 Feb 2024 11:13:13 +0100
Message-ID: <20240212101712.23675-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212101712.23675-1-tzimmermann@suse.de>
References: <20240212101712.23675-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com,ffwll.ch,gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Resolved the proxy include via <linux/fb.h>, which does not require the
backlight header.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 8d37a694b7724..0c3d88ad0b0ea 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -28,6 +28,7 @@
 #include "wndw.h"
 #include "handles.h"
 
+#include <linux/backlight.h>
 #include <linux/dma-mapping.h>
 #include <linux/hdmi.h>
 #include <linux/component.h>
-- 
2.43.0


