Return-Path: <linux-fbdev+bounces-963-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D042184CBF9
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 14:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4033E1F26116
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 13:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630DD7A736;
	Wed,  7 Feb 2024 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZOeZL/+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8R+z7i3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZOeZL/+5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="T8R+z7i3"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE177F17
	for <linux-fbdev@vger.kernel.org>; Wed,  7 Feb 2024 13:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707313780; cv=none; b=oaiP6xKIWmvWaHrl/gQKKDyAorZcqMU+aTCRr1hU06eu2BUw/dAqL4gKph3Ehq/gUE/jCrkBX9CqTeEMv1Lc43Q6u6StuuZVQGwewoUpHAO4b1uL73naVaEMLipMt7RS3FhB30nOD3/4kGIjBU98Rpn2rjFPAJy6GtLy5WzdqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707313780; c=relaxed/simple;
	bh=yswhvoU5cv/gq/vI0GXvP0jALoAZr9Q7Oa8oWQa6x3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLOZKW0yapK7yE8Bi0bGQPuBfuK64c0i5wapgr2RQpNKm95xRv+cRLD3JfD8T/uG2yoQX+2tMi+Kl7MAcirzUPbjTXfC54p1uTWtpKyeV8jmF4tJHKNNkIe8IzDfD+mWOC4pKbsAjDraRswBwhS1bpri79BbATZnQdY1l3OEvw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZOeZL/+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T8R+z7i3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZOeZL/+5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=T8R+z7i3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DB67322304;
	Wed,  7 Feb 2024 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
	b=ZOeZL/+5nyvkE1j+Pgqxt9HQx3Xxy/feU1Un6STjXe3CYs+LVSKx5uM6DgvyZiRx52jjzQ
	FaDfBvBkc8v8bjbi5y8uCHsDeGqijaXm2oUqn99fA3vIxQP9Lqq4r6YMttdEBVdkApUR6b
	GSxePdIGvHbazCRrGKVkRhjGdpg136k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
	b=T8R+z7i33MS5Nu+McLRjAEyRfED7hiwb2UzrRkyIpugvQCxFoGLbOYWGNAuWt887agMcNz
	dknBfLHLuatbmZBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707313776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
	b=ZOeZL/+5nyvkE1j+Pgqxt9HQx3Xxy/feU1Un6STjXe3CYs+LVSKx5uM6DgvyZiRx52jjzQ
	FaDfBvBkc8v8bjbi5y8uCHsDeGqijaXm2oUqn99fA3vIxQP9Lqq4r6YMttdEBVdkApUR6b
	GSxePdIGvHbazCRrGKVkRhjGdpg136k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707313776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
	b=T8R+z7i33MS5Nu+McLRjAEyRfED7hiwb2UzrRkyIpugvQCxFoGLbOYWGNAuWt887agMcNz
	dknBfLHLuatbmZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98A3B139D8;
	Wed,  7 Feb 2024 13:49:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oJ23I3CKw2V7IQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 13:49:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	sui.jingfeng@linux.dev,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 5/8] firmware/sysfb: Create firmware device only for enabled PCI devices
Date: Wed,  7 Feb 2024 14:47:14 +0100
Message-ID: <20240207134932.7321-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207134932.7321-1-tzimmermann@suse.de>
References: <20240207134932.7321-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ZOeZL/+5";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=T8R+z7i3
X-Spamd-Result: default: False [4.01 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.68)[83.12%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.01
X-Rspamd-Queue-Id: DB67322304
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Test if the firmware framebuffer's parent PCI device, if any, has
been enabled. If not, the firmware framebuffer is most likely not
working. Hence, do not create a device for the firmware framebuffer
on disabled PCI devices.

So far, efifb tracked the status of the PCI parent device internally
and did not bind if it was disabled. This patch implements the
functionality for all PCI-based firmware framebuffers.

v3:
	* make commit message more precise (Sui)
v2:
	* rework sysfb_pci_dev_is_enabled() (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 4e104f3de4b95..170b7cd0cfcbf 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -70,15 +70,41 @@ void sysfb_disable(void)
 }
 EXPORT_SYMBOL_GPL(sysfb_disable);
 
+#if defined(CONFIG_PCI)
+static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
+{
+	/*
+	 * TODO: Try to integrate this code into the PCI subsystem
+	 */
+	int ret;
+	u16 command;
+
+	ret = pci_read_config_word(pdev, PCI_COMMAND, &command);
+	if (ret != PCIBIOS_SUCCESSFUL)
+		return false;
+	if (!(command & PCI_COMMAND_MEMORY))
+		return false;
+	return true;
+}
+#else
+static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
+{
+	return false;
+}
+#endif
+
 static __init struct device *sysfb_parent_dev(const struct screen_info *si)
 {
 	struct pci_dev *pdev;
 
 	pdev = screen_info_pci_dev(si);
-	if (IS_ERR(pdev))
+	if (IS_ERR(pdev)) {
 		return ERR_CAST(pdev);
-	else if (pdev)
+	} else if (pdev) {
+		if (!sysfb_pci_dev_is_enabled(pdev))
+			return ERR_PTR(-ENODEV);
 		return &pdev->dev;
+	}
 
 	return NULL;
 }
@@ -99,6 +125,8 @@ static __init int sysfb_init(void)
 	sysfb_apply_efi_quirks();
 
 	parent = sysfb_parent_dev(si);
+	if (IS_ERR(parent))
+		goto unlock_mutex;
 
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
-- 
2.43.0


