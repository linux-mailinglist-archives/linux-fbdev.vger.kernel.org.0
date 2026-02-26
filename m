Return-Path: <linux-fbdev+bounces-6368-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENC9AqD/n2n3fAQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6368-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 26 Feb 2026 09:09:04 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622C1A24C9
	for <lists+linux-fbdev@lfdr.de>; Thu, 26 Feb 2026 09:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E78D73007A42
	for <lists+linux-fbdev@lfdr.de>; Thu, 26 Feb 2026 08:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8044D38F92C;
	Thu, 26 Feb 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cnm515ta"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDE738F228;
	Thu, 26 Feb 2026 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772093337; cv=none; b=fVC3TW/FsBH4ptp3nYJ23n9ZNAdxHtxnbS3VEI77JLQrcuNcPoly6PvzjfAol7AI/0juHbs4O5rMqXTl3R3//jvHoCAQTUgm5P8zgSZ812xrZApiBx8raRI072b3FSAVixMUZ4rcDEorAGLdaSE0YysSyEOZ1LRUe8Q6dnk/fo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772093337; c=relaxed/simple;
	bh=R507udYL6opjuI8np0fBrl0n6cNHN1Ex0n/gN/SM0is=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oouTjPmSJUOCACcgz9yY8GKGfZYYZTtKHO2F8ZG13c2+a4UV68t48zz4o2MewxtDDgzhgA1DRoeGAEScrXJCtOXTOPYCt4L04kDLW16eJxZxUi/no+nE2mjhLnnSDs0f/PmtBuRm92yNy3GAbzT51Im8Ihm4QB/XmCYWtOSNkt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cnm515ta; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772093336; x=1803629336;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R507udYL6opjuI8np0fBrl0n6cNHN1Ex0n/gN/SM0is=;
  b=Cnm515taLCJaBhak20jgMy4JBhtFJroQbewyT9InkD6cm2FouH/HyN9o
   CK6CPYp0bvCvX2IZ0odOqE+bx+YUv7ylAuJAPCXkuWCSGz+2mV58Q3e3N
   WDGDRewS7a39rncRlcvbcPUrCy6XZ7BlfVhi72Mpmq9gOmEpxzXa9m3nF
   fFwvBCgA+vQ9fL0H1UrQ71EkDqE45rDBp00vyFwNYfxi19yjoWv9l4Ncu
   0Z2otuB/WzRE9qo0p0w11gkBqCbwhqHPogpl585xKg5C8ZXiu1okxWGMA
   2VUlDo2Biztg7DLXh1TbJR48U36I3IV4KyfDz0g5IB2Rd/mavDlD3QxCt
   g==;
X-CSE-ConnectionGUID: 0co/ChmbQZCd+4oMs4+A/Q==
X-CSE-MsgGUID: 7qRZaFZSQcO7jADr5RBdnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72180818"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72180818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 00:08:55 -0800
X-CSE-ConnectionGUID: arDF5drgSuiGjuhq6t849g==
X-CSE-MsgGUID: xekKFge0QQGIy7/OLTSd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="220634741"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 26 Feb 2026 00:08:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EEE6D98; Thu, 26 Feb 2026 09:08:51 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Helge Deller <deller@gmx.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v1 1/1] fbtft: Update REAMDE to slow down the stream of undesired cleanups
Date: Thu, 26 Feb 2026 09:08:45 +0100
Message-ID: <20260226080845.4081732-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6368-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,infradead.org,gmx.de,linaro.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3622C1A24C9
X-Rspamd-Action: no action

Lately the enormous amount of some untested cleanups started coming
to a mailing list. This adds an unneeded and undesired burden on
the reviewers and maintainers. Try to stop that by clearly state
what we accept and on what conditions in the README file.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/README | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/fbtft/README b/drivers/staging/fbtft/README
index ba4c74c92e4c..91f152d622bd 100644
--- a/drivers/staging/fbtft/README
+++ b/drivers/staging/fbtft/README
@@ -6,27 +6,12 @@ The module 'fbtft' makes writing drivers for some of these displays very easy.
 
 Development is done on a Raspberry Pi running the Raspbian "wheezy" distribution.
 
-INSTALLATION
-  Download kernel sources
+For new hardware support consider using DRM subsystem (see TODO).
 
-  From Linux 3.15
-    cd drivers/video/fbdev/fbtft
-    git clone https://github.com/notro/fbtft.git
+NOTE:
 
-    Add to drivers/video/fbdev/Kconfig:   source "drivers/video/fbdev/fbtft/Kconfig"
-    Add to drivers/video/fbdev/Makefile:  obj-y += fbtft/
-
-  Before Linux 3.15
-    cd drivers/video
-    git clone https://github.com/notro/fbtft.git
-
-    Add to drivers/video/Kconfig:   source "drivers/video/fbtft/Kconfig"
-    Add to drivers/video/Makefile:  obj-y += fbtft/
-
-  Enable driver(s) in menuconfig and build the kernel
-
-
-See wiki for more information: https://github.com/notro/fbtft/wiki
-
-
-Source: https://github.com/notro/fbtft/
+The driver is in maintenance mode, only performance issue or bug fixes
+are accepted, which effectively means the patches must be tested on
+the real hardware (the patch must be accompanied with the information
+what hardware is that). The treewide changes may also be accepted as
+an exception.
-- 
2.50.1


