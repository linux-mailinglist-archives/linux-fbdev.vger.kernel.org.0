Return-Path: <linux-fbdev+bounces-1484-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA687AAB4
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 16:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB17C2842BC
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Mar 2024 15:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3FE47A6F;
	Wed, 13 Mar 2024 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eG3j+5/N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CNaFGsgE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eG3j+5/N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CNaFGsgE"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2947A60
	for <linux-fbdev@vger.kernel.org>; Wed, 13 Mar 2024 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710344944; cv=none; b=Do8zubehErINo45rulFsppZJ35NODk40jwzkAMl6zIsY3Q76iK09JFKxlzIHMoUrIFZ95bpsuzY+dlwzO56JKlxyEtD6DWp953vlLl5PZBzWU6/7ZBdS6W2URkwg30aEzbcwBk0y9DMJvWGFIV2vm+c6yGSxTdqJxo+NHhK8ksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710344944; c=relaxed/simple;
	bh=UrCIzyzr4Dy86L9i6wzSUbdR3jPB3SfaIZlAZsb6Dm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9MXIAYhcU4vOV63k4oCKpQniNXIJayJ267lfKMlBO8Gfvk/7tZ0Deqb69yiWoB7hYRjIW7fczoI7OW1ZoG30Ase5Zs2t79x4VV4eW7ErVsg1Fqk38VV1k2qUfEPmF7jHLR33Z8tpsTgThyCODRiPo/FXdHRVYOn48GcWV2pTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eG3j+5/N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CNaFGsgE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eG3j+5/N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CNaFGsgE; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8DB3721C89;
	Wed, 13 Mar 2024 15:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710344940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
	b=eG3j+5/Nr6vS3K47JCzsjFu2BkyGcHxuK8qgItdffjBVEkkq9RJwybaBcCUi4StS/p7BAb
	jip8jGJPfRpjLDTaV2T11mc4pc+FOezrylPGVLCS/+S3lrcQNG6o3VVn6u82d23GJO4j9t
	vIIhEGhfrB8bXDU8xLuDDsC/RPhsnnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710344940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
	b=CNaFGsgE3kmyRNK0TSCG7JlQ7n/+iJVKYOF0FmG/eDHnZZLy74J3MsoGTJlJ+ahkFZtJTw
	0Nh/b7wRyRR2h0Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710344940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
	b=eG3j+5/Nr6vS3K47JCzsjFu2BkyGcHxuK8qgItdffjBVEkkq9RJwybaBcCUi4StS/p7BAb
	jip8jGJPfRpjLDTaV2T11mc4pc+FOezrylPGVLCS/+S3lrcQNG6o3VVn6u82d23GJO4j9t
	vIIhEGhfrB8bXDU8xLuDDsC/RPhsnnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710344940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QzT8f3Jf+KPnpm4sqyZWeBrc/YaULixAXlhpCJEpFKY=;
	b=CNaFGsgE3kmyRNK0TSCG7JlQ7n/+iJVKYOF0FmG/eDHnZZLy74J3MsoGTJlJ+ahkFZtJTw
	0Nh/b7wRyRR2h0Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DC911397F;
	Wed, 13 Mar 2024 15:49:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vxUqDezK8WUhfQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 13 Mar 2024 15:49:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] backlight: Remove struct backlight_properties.fb_blank
Date: Wed, 13 Mar 2024 16:44:59 +0100
Message-ID: <20240313154857.12949-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: **
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [2.96 / 50.00];
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
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.94)[94.70%]
X-Spam-Score: 2.96
X-Spam-Flag: NO

The field fb_blank in struct backlight_properties has been marked for
removal. Remove it in favor of the power and state fields.

Patches 1 to 5 prepare several backlight drivers. They remove fb_blank
or replace driver code with existing helpers.

Patch 6 removes fb_blank from backlight core and drivers. This resolves
another dependency between backlight nad fbdev.

Thomas Zimmermann (6):
  auxdisplay/ht16k33: Replace use of fb_blank with backlight helper
  backlight/omap1-bl: Remove unused struct
    omap_backlight_config.set_power
  backlight/omap1-bl: Replace FB_BLANK_ states with simple on/off
  fbdev/omap2/omapfb: Replace use of fb_blank with backlight helpers
  staging/fbtft: Remove reference to fb_blank
  backlight: Remove fb_blank from struct backlight_properties

 drivers/auxdisplay/ht16k33.c                  |  7 +--
 drivers/staging/fbtft/fb_ssd1351.c            |  4 +-
 drivers/staging/fbtft/fbtft-core.c            |  5 +-
 drivers/video/backlight/backlight.c           |  2 -
 drivers/video/backlight/mp3309c.c             |  1 -
 drivers/video/backlight/omap1_bl.c            | 50 ++++++++-----------
 drivers/video/fbdev/atmel_lcdfb.c             |  1 -
 .../omap2/omapfb/displays/panel-dsi-cm.c      |  7 +--
 .../omapfb/displays/panel-sony-acx565akm.c    | 10 +---
 include/linux/backlight.h                     | 25 +---------
 include/linux/platform_data/omap1_bl.h        |  1 -
 11 files changed, 29 insertions(+), 84 deletions(-)

-- 
2.44.0


