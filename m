Return-Path: <linux-fbdev+bounces-273-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D5802E88
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Dec 2023 10:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0631F21026
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Dec 2023 09:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001EA182AC;
	Mon,  4 Dec 2023 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qrpchBWZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B5zHMmO9"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89516C3
	for <linux-fbdev@vger.kernel.org>; Mon,  4 Dec 2023 01:28:15 -0800 (PST)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3391321FD5;
	Mon,  4 Dec 2023 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701682094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yHQg3T75THfOlnonDSAyRYz2QxWafdXl5MRoZyuIIGc=;
	b=qrpchBWZ2H2+85Q1yNGPNiCNAy5SpA7ZsLBtYT6304Da9KaCMspCIhSb8jCnjUcpU2T3pV
	qcniM2v1yq0ZNq7B8q7VgLyTpXOJWmlbmKUdcxCnc/bpekf3ek+086uAoBk71NVoTmcy6t
	raSuwNWpNVQn0L2G6SVP5E/8Vo+Z+Og=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701682094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=yHQg3T75THfOlnonDSAyRYz2QxWafdXl5MRoZyuIIGc=;
	b=B5zHMmO9qdS6axg/FmyKxXbnAXXjXXAXuKElfSmP6l3EN/InvMYttn3WxRDRIarBu0oKA0
	x8tEgFwzLc2kP4DQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E7ED713588;
	Mon,  4 Dec 2023 09:28:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id +7zlNq2bbWWwLgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 04 Dec 2023 09:28:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	pjones@redhat.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] fbdev: Remove global screen_info in efifb/vesafb
Date: Mon,  4 Dec 2023 10:27:18 +0100
Message-ID: <20231204092812.2612-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 3.63
X-Spamd-Result: default: False [3.63 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.07)[62.29%]

Replace the global instance of screen_info with the per-device instance
that is set by the sysfb code. The use of the global screen_info should
be limited and ideally be pushed into per-architecture code.

v2:
	* comment on devm_kmemdup() usage (Javier)

Thomas Zimmermann (4):
  fbdev/efifb: Replace references to global screen_info by local pointer
  fbdev/efifb: Use screen_info pointer from device
  fbdev/vesafb: Replace references to global screen_info by local
    pointer
  fbdev/vesafb: Use screen_info pointer from device

 drivers/video/fbdev/efifb.c  | 125 ++++++++++++++++++++---------------
 drivers/video/fbdev/vesafb.c |  78 +++++++++++++---------
 2 files changed, 117 insertions(+), 86 deletions(-)

-- 
2.43.0


