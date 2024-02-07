Return-Path: <linux-fbdev+bounces-959-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA6B84CBEF
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 14:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBF891F25FAF
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 13:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2040078B44;
	Wed,  7 Feb 2024 13:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fLn7gpA5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7A6gRlNs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fLn7gpA5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7A6gRlNs"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515A417BDD
	for <linux-fbdev@vger.kernel.org>; Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313779; cv=none; b=KiRQ1EbuOcif55BQixUW/c904XbiwQCxtLKyNZbRhfCmobx9SXgoXcKwN1em5zHG5D4XrinTkUHaqo6WqEpgrl1hjIBFcnuxEZGrz351bVR+gtBJnyF1hbi8X+URAnS2tSqRtxpDDDcy0ndrTP+UyFNanLM3R6+ns0f/+Tohx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313779; c=relaxed/simple;
	bh=YKtTfDYYkWb1OMfcY7hrRpa9UVHFMgr4RX8XKNrsTgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nBMnE4UOWc9vNnGGFY9XWkp3jwiH/vtowCvWZOrmmE+McldP7vJyirHSavBrr6++yyx6VeoiY96il3x39iTS/tvE96BesqSKHNIt5i8QHHr/jD3usgeNaHdTnmE2u9gkOdAwyfG60E4K2XhWGJd8lZd9mmTGg3K3WXcwzjU3aNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fLn7gpA5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7A6gRlNs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fLn7gpA5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7A6gRlNs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 57333222E0;
	Wed,  7 Feb 2024 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8YmkPT4cpekHa9EtI4LkzVXfq4PiT9ekycighb0Xjk4=;
	b=fLn7gpA5K4SqTSEoIkQwNjB+hXkPjeqRhN//DACRUvgyUeMvsgLfBaVPwcWwsiboWdFf88
	KN8WCqxxPsQBRabZ4S8HSCZZ/M7IdbqKRsy2koX072/5VT8ycTG5wpzsnT+jD9xQysyg//
	X+L5UwPffWtmxs8qB0r6UiWq3R2R+JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8YmkPT4cpekHa9EtI4LkzVXfq4PiT9ekycighb0Xjk4=;
	b=7A6gRlNszbzkH5Lo2hZ58XoDoWjSWhqcbC9Lbx4R6LBJ6DV4iV9Bxo2HSH0OAflYTU7nkV
	fxRYKesjaj2e6NAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8YmkPT4cpekHa9EtI4LkzVXfq4PiT9ekycighb0Xjk4=;
	b=fLn7gpA5K4SqTSEoIkQwNjB+hXkPjeqRhN//DACRUvgyUeMvsgLfBaVPwcWwsiboWdFf88
	KN8WCqxxPsQBRabZ4S8HSCZZ/M7IdbqKRsy2koX072/5VT8ycTG5wpzsnT+jD9xQysyg//
	X+L5UwPffWtmxs8qB0r6UiWq3R2R+JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=8YmkPT4cpekHa9EtI4LkzVXfq4PiT9ekycighb0Xjk4=;
	b=7A6gRlNszbzkH5Lo2hZ58XoDoWjSWhqcbC9Lbx4R6LBJ6DV4iV9Bxo2HSH0OAflYTU7nkV
	fxRYKesjaj2e6NAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12109139B9;
	Wed,  7 Feb 2024 13:49:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JxO+Am+Kw2V7IQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 13:49:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	sui.jingfeng@linux.dev,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/8] firmware/sysfb: Track parent device for screen_info
Date: Wed,  7 Feb 2024 14:47:09 +0100
Message-ID: <20240207134932.7321-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fLn7gpA5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7A6gRlNs
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 57333222E0
X-Spam-Flag: NO

Detect the firmware framebuffer's parent device from the global
screen_info state and set up the framebuffer's device accordingly.
Remove the equivalent functionality from efifb. Other drivers for
firmware framebuffers, such as simpledrm or vesafb, now add these
new features.

Patches 1 and 2 provide a set of helper functions to avoid parsing
the screen_info values manually. Decoding screen_info is fragile and
many drivers get it wrong. We should later adopt these helpers in
existing drivers, such as efifb, vesafb, as well.

Patches 3 and 4 set the firmware framebuffer's parent device. There
is code in efifb to do something similar for power management. That
is now obsolete and being cleaned up. Setting the parent device makes
Linux track the power management correctly.

Patches 5 and 6 track the parent device's enable state. We don't
create framebuffer devices if the underlying hardware device has been
disabled. Remove the functionality from efifb.

Patches 7 and 8 track the parent device's PCI BAR location. It can
happen on aarch64 that the firmware framebuffer moves its location
during the kernel's boot. We now fix up the screen_info state to
point to the correct location. Again remove such functionality from
efifb.

v3:
	* filter PCI device list with pci_get_base_class() (Sui)
	* fix error handling for screen_info_pci_dev() (Sui)
	* fix build for CONFIG_SYSFB_SIMPLEFB=n (Sui)
	* small cleanups
v2:
	* small refactorings throughout the patchset

Thomas Zimmermann (8):
  video: Add helpers for decoding screen_info
  video: Provide screen_info_get_pci_dev() to find screen_info's PCI
    device
  firmware/sysfb: Set firmware-framebuffer parent device
  fbdev/efifb: Remove PM for parent device
  firmware/sysfb: Create firmware device only for enabled PCI devices
  fbdev/efifb: Do not track parent device status
  firmware/sysfb: Update screen_info for relocated EFI framebuffers
  fbdev/efifb: Remove framebuffer relocation tracking

 drivers/firmware/Kconfig            |   1 +
 drivers/firmware/sysfb.c            |  51 +++++++++-
 drivers/firmware/sysfb_simplefb.c   |   5 +-
 drivers/video/Kconfig               |   4 +
 drivers/video/Makefile              |   4 +
 drivers/video/fbdev/efifb.c         |  97 +-----------------
 drivers/video/screen_info_generic.c | 146 ++++++++++++++++++++++++++++
 drivers/video/screen_info_pci.c     | 136 ++++++++++++++++++++++++++
 include/linux/screen_info.h         | 126 ++++++++++++++++++++++++
 include/linux/sysfb.h               |   6 +-
 10 files changed, 480 insertions(+), 96 deletions(-)
 create mode 100644 drivers/video/screen_info_generic.c
 create mode 100644 drivers/video/screen_info_pci.c

-- 
2.43.0


