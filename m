Return-Path: <linux-fbdev+bounces-1140-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B115859FEA
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Feb 2024 10:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E2F91C211EB
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Feb 2024 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD3725556;
	Mon, 19 Feb 2024 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EzVTYWi/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zhTT4bPq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EzVTYWi/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zhTT4bPq"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E432377B
	for <linux-fbdev@vger.kernel.org>; Mon, 19 Feb 2024 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708335593; cv=none; b=FhF4uJcUOjoZv0clsXsPqcnNLy0/v0FEWtxiVt9H5C2tVu0T38kkBD26RGu0DUjIot5nCglXeDL3bvKfMfLw/OZ20YuZp5828OMg5uCLZS9SzjQOTrTgd+eFBv+lXvDuagbX4/Pe5eopimQEFLlwMn8Bmb1gCGudW841JoQoGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708335593; c=relaxed/simple;
	bh=6+xj1TFXKbzy9YCpVClL9m1CmkgHCUTMZsN4Sp+5fG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkbuFF4AH2onyF0/pCrSyfPcj/bb+z4WZfPRJ360T3jo8vcibuhERSPCXTM4Yn8hQaGr6TKBgvEb38WiIxm/UQhyIppxCI982Pf0IvMUfMlwiqDhkwy0+zZVzXf41N0Wu0+/WNopVPNuGDZttLU/WwlDza5aMKifEHljs9c9pG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EzVTYWi/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zhTT4bPq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EzVTYWi/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zhTT4bPq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 190C01F7EA;
	Mon, 19 Feb 2024 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708335589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZqPLOCAgjaw/k2J1PQwYFZ7dpltkIZW5PNUL+ZO0z0=;
	b=EzVTYWi/VZ5yoiSw/GQB/i/jnHpJt1kIvlnPjDJJOWl3yMLmKndJkmfWX9YIRFJaEbgCYr
	1Oj4h3yeBD3sPJtL5iejAe88nPcLEWVf+emP42inyoDi9ULWWnYMLYkye9M5/IbJnh6Ehk
	NDrkpUoMgQHYxFtk3a48avxnXLE94g4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708335589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZqPLOCAgjaw/k2J1PQwYFZ7dpltkIZW5PNUL+ZO0z0=;
	b=zhTT4bPqd640NOQrbi3WEzeG7AZlFhRkOXxGOSOzMr4/FKPu4GYiU/zuFTBtC0Xg4mzA+6
	mNXy/eIbAsslONCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708335589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZqPLOCAgjaw/k2J1PQwYFZ7dpltkIZW5PNUL+ZO0z0=;
	b=EzVTYWi/VZ5yoiSw/GQB/i/jnHpJt1kIvlnPjDJJOWl3yMLmKndJkmfWX9YIRFJaEbgCYr
	1Oj4h3yeBD3sPJtL5iejAe88nPcLEWVf+emP42inyoDi9ULWWnYMLYkye9M5/IbJnh6Ehk
	NDrkpUoMgQHYxFtk3a48avxnXLE94g4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708335589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZqPLOCAgjaw/k2J1PQwYFZ7dpltkIZW5PNUL+ZO0z0=;
	b=zhTT4bPqd640NOQrbi3WEzeG7AZlFhRkOXxGOSOzMr4/FKPu4GYiU/zuFTBtC0Xg4mzA+6
	mNXy/eIbAsslONCw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B9AC813A6A;
	Mon, 19 Feb 2024 09:39:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id GMsOLOQh02XlUAAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Mon, 19 Feb 2024 09:39:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	jani.nikula@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 6/9] fbdev: Do not include <linux/notifier.h> in header
Date: Mon, 19 Feb 2024 10:37:31 +0100
Message-ID: <20240219093941.3684-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219093941.3684-1-tzimmermann@suse.de>
References: <20240219093941.3684-1-tzimmermann@suse.de>
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
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:email,gmx.de:email];
	 FREEMAIL_TO(0.00)[gmx.de,redhat.com,linux.intel.com,ffwll.ch,gmail.com,linuxfoundation.org];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[22.21%]
X-Spam-Flag: NO

Forward declare struct notifier_block and remove the include
statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Helge Deller <deller@gmx.de>
---
 include/linux/fb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index f269ba5202809..90f348f14a490 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -10,7 +10,6 @@
 
 #include <linux/init.h>
 #include <linux/workqueue.h>
-#include <linux/notifier.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 
@@ -22,6 +21,7 @@ struct fb_info;
 struct device;
 struct file;
 struct inode;
+struct notifier_block;
 struct videomode;
 struct device_node;
 
-- 
2.43.0


