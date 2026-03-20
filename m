Return-Path: <linux-fbdev+bounces-6693-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAWuC59bvWkA9QIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6693-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Mar 2026 15:37:19 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A23062DBE66
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Mar 2026 15:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B32B5301D4E9
	for <lists+linux-fbdev@lfdr.de>; Fri, 20 Mar 2026 14:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC363B8D59;
	Fri, 20 Mar 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STAwuExd"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58091286409;
	Fri, 20 Mar 2026 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017418; cv=none; b=miAHx1rFLK8Z5eQqW/SitI3LlDYMGzfPE0EPRIwpc2YfDzfct+p4+HjzDli9Dm+cqNkgih150BlbDi78ed9MbjeNpqrQI32CnwGxqGHLx3uVl32Lw6jI28dxAMJbsC68quvzPNPyXTIL4NbUUhKkkGNryyPpwbuyslT+DGn0gzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017418; c=relaxed/simple;
	bh=vrfoLwO/FTvfay85UrFhHzYUQTVGvBxfTjlQlWQxsFg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e2ZS5Vma8NIOStM9ph8MyqvojI5l7AfqV9ULqHAYAf6QX8er81NMcBZsGNDZ+khqoiR0p/irHbTq7xCB6Vh63yQ1pXXt8IB3jocnv+AaFsscXOSA4CmcTyAJ/MBNhCBhyhQ39VBQC3UdCcXxAELg0x1ZDrJaAHNVPQmhM7GDxRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STAwuExd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774017416; x=1805553416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vrfoLwO/FTvfay85UrFhHzYUQTVGvBxfTjlQlWQxsFg=;
  b=STAwuExd/UjNYKO6r3AEK8C+V8bQseOKIMt0vpxvqrgtX0i+p6x74V9r
   8fO70HzSIHMwbJwveY1YHTH3diqrwpQBbXSEG0Nkp0sYS/WLkH9nIRpT0
   N9BnYquxposqHAVPubbyfxrMVix0odg18k4d2uy7U7lK0hSdOTsYio7R7
   eQ9QGgtZuSAA1A1BlnaA0dzP4bsvaMpmCVgeTDSjKxjzbn0Tc9QYB8PEF
   puaLFvl5VRltuofCWS01D+JhDQeFoyJr6R+fZkJm+VYjx0t8uAnmTcbwQ
   bEQLVoXw6bwfrnANggYxGb4mai/beGt90beG70DmOkfYSb3Mai7GA2Np+
   Q==;
X-CSE-ConnectionGUID: IStZovvkSoOrdHPf5FtKKA==
X-CSE-MsgGUID: 5vX9pGHRQqKEulHSeWHDMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75011904"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75011904"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 07:36:55 -0700
X-CSE-ConnectionGUID: qtGnx5r3RmuRASzkFq83Nw==
X-CSE-MsgGUID: d4QWydUcThixM+6K9Je94g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218649764"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 20 Mar 2026 07:36:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0A3B195; Fri, 20 Mar 2026 15:36:52 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Helge Deller <deller@gmx.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jason Yan <yanaijie@huawei.com>
Subject: [PATCH v1 1/1] video: fbdev: matroxfb: Mark variable with __maybe_unused to avoid W=1 build break
Date: Fri, 20 Mar 2026 15:36:46 +0100
Message-ID: <20260320143646.3218199-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,gmail.com,google.com,linux.intel.com,huawei.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6693-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-fbdev,lkml];
	NEURAL_HAM(-0.00)[-0.917];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid,huawei.com:email,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: A23062DBE66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Clang is not happy about set but unused variable:

drivers/video/fbdev/matrox/g450_pll.c:412:18: error: variable 'mnp' set but not used [-Werror,-Wunused-but-set-variable]
   412 |                                 unsigned int mnp;
       |                                              ^
1 error generated.

Since the commit 7b987887f97b ("video: fbdev: matroxfb: remove dead code
and set but not used variable") the 'mnp' became unused, but eliminating
that code might have side-effects. The question here is what should we do
with 'mnp'? The easiest way out is just mark it with __maybe_unused which
will shut the compiler up and won't change any possible IO flow. So does
this change.

Fixes: 7b987887f97b ("video: fbdev: matroxfb: remove dead code and set but not used variable")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

---
Cc: Jason Yan <yanaijie@huawei.com>
---

Below is a dive into the history of the driver.

The problem was revealed when the #if 0 guarded code along with unused
pixel_vco variable was removed. That code was introduced in the original
commit 213d22146d1f ("[PATCH] (1/3) matroxfb for 2.5.3"). And then guarded
in the commit 705e41f82988 ("matroxfb DVI updates: Handle DVI output on
G450/G550. Powerdown unused portions of G450/G550 DAC. Split G450/G550 DAC
from older DAC1064 handling. Modify PLL setting when both CRTCs use same
pixel clocks.").

NOTE: The two commits mentioned above pre-date Git era and available in
history.git repository for archaeological purposes.

Even without that guard the modern compilers may see that the pixel_vco
wasn't ever used and seems a leftover after some debug or review made
25 years ago.

The g450_mnp2vco() doesn't have any IO and as Jason said doesn't seem
to have any side effects either than some unneeded CPU processing during
runtime. I agree that's unlikely that timeout (or heating up the CPU) has
any effect on the HW (GPU/display) functionality.
---
 drivers/video/fbdev/matrox/g450_pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/matrox/g450_pll.c b/drivers/video/fbdev/matrox/g450_pll.c
index e2c1478aa47f..6a08f78cd1ac 100644
--- a/drivers/video/fbdev/matrox/g450_pll.c
+++ b/drivers/video/fbdev/matrox/g450_pll.c
@@ -409,7 +409,7 @@ static int __g450_setclk(struct matrox_fb_info *minfo, unsigned int fout,
 		case M_VIDEO_PLL:
 			{
 				u_int8_t tmp;
-				unsigned int mnp;
+				unsigned int mnp __maybe_unused;
 				unsigned long flags;
 
 				matroxfb_DAC_lock_irqsave(flags);
-- 
2.50.1


