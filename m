Return-Path: <linux-fbdev+bounces-7213-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N0uFZ5bA2r75AEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7213-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 18:55:58 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D252539B
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 18:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB80830BC8AE
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 16:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964633DC84B;
	Tue, 12 May 2026 16:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="CDUSx+D8"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward203d.mail.yandex.net (forward203d.mail.yandex.net [178.154.239.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35F3B5F5D;
	Tue, 12 May 2026 16:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604493; cv=none; b=aFveIsOtUnvXXQjyxQOWMuXA8VdO4emGkUsq0cuM9Mmgp9cEnQrEKBV2Gs7akkL4mVt9pVhwSOpuIWWGgARkCud50i8tbLZ3Nec8A8oUyqrtxTpoTbW0EL6DmL/1qTHvdvsC/6ZG71Z7n0/QM9jHgpp9RpBF2bZK/6TZ1xuOeIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604493; c=relaxed/simple;
	bh=NFH6lP7AnuuCgQP4N2w+t3hFItzEvEzxSfBFITYcqEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/waaMj82Xl3zor/1Vx7iyql9JB2i2FmVp9VYb9EysD7tUAOSDq2RPzJ13ByfJm7srZDcaYclv20IEh3w3sgqJFab6QYwmFhfFQiKqXWJp9e4O3h+XrDE2ptKmETu1F2S0i8ifzFdkpOt2UIH73Igb4z7aIb/TMA2l4eeyInyg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=CDUSx+D8; arc=none smtp.client-ip=178.154.239.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
	by forward203d.mail.yandex.net (Yandex) with ESMTPS id B892489AD9;
	Tue, 12 May 2026 19:48:02 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1f87:0:640:a06a:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 10DD7C00A3;
	Tue, 12 May 2026 19:47:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (smtp) with ESMTPSA id nlNSSYsRFCg0-kt0HFlLp;
	Tue, 12 May 2026 19:47:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1778604473;
	bh=/K1xA0pNH+Mstfy9sWoEymUCD5DBap6C3W78i/RVEyw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=CDUSx+D8KfYE72X2BI0LDhIBPSCwgmEqvfIzKpkPkIdTepE8Yd4jw2sTNLtzYjUqH
	 9cVTRmvHzGlhNikZXjeVNHO2nCNZeT4Vu3+QK4EL2fpkDla4Mj34iGGXn8mwWEdO2s
	 cOijCao/2ZALFh/DB3V9SQsWEmoShkzJXf4H6NJE=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 1/4] staging: sm750fb: remove unused includes
Date: Tue, 12 May 2026 16:41:21 +0000
Message-ID: <20260512164124.188210-2-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512164124.188210-1-ahmet@sezginduran.net>
References: <20260512164124.188210-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE5D252539B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sezginduran.net];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7213-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sezginduran.net:email,sezginduran.net:mid,sezginduran.net:dkim]
X-Rspamd-Action: no action

Remove unused header file includes from multiple source files to
declutter the include sections.

Also remove the unused CONFIG_MTRR include block after verifying
that no MTRR interfaces are used by the driver.

No functional changes.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
 drivers/staging/sm750fb/sm750.c        | 12 ------------
 drivers/staging/sm750fb/sm750_accel.c  | 14 --------------
 drivers/staging/sm750fb/sm750_cursor.c | 14 --------------
 drivers/staging/sm750fb/sm750_hw.c     | 17 -----------------
 4 files changed, 57 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 996a586a3727..d26e9fab846a 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1,19 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/aperture.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
 #include <linux/pci.h>
-#include <linux/mm_types.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
 #include <linux/console.h>
 
 #include "sm750.h"
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index ec2f0a6aa57d..f695a2a61c28 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -1,19 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/pci.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
-#include <linux/console.h>
-#include <linux/platform_device.h>
 
 #include "sm750.h"
 #include "sm750_accel.h"
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index f0338e6e76b1..9d6bca3106f4 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -1,19 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/pci.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
-#include <linux/console.h>
-#include <linux/platform_device.h>
 
 #include "sm750.h"
 #include "sm750_cursor.h"
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 6f7c354a34a1..34a837fb4b64 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -1,23 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/fb.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
 #include <linux/pci.h>
-#include <linux/vmalloc.h>
-#include <linux/pagemap.h>
-#include <linux/console.h>
-#ifdef CONFIG_MTRR
-#include <asm/mtrr.h>
-#endif
-#include <linux/platform_device.h>
-#include <linux/sizes.h>
 
 #include "sm750.h"
 #include "ddk750.h"
-- 
2.53.0


