Return-Path: <linux-fbdev+bounces-1769-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1802897729
	for <lists+linux-fbdev@lfdr.de>; Wed,  3 Apr 2024 19:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B1A1F309F8
	for <lists+linux-fbdev@lfdr.de>; Wed,  3 Apr 2024 17:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5133416F261;
	Wed,  3 Apr 2024 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oABUAQFL"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954A16F0FF;
	Wed,  3 Apr 2024 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712164834; cv=none; b=bIAnoCfUrn0c0dc9U8mFJMFNCm01WQ09cVY9FsMhVCpWIt99FokwA3cdnvm1i3ZPyZkdtsmb5EeC+vo2k+18znyJiZ0/5rI4Cg6nsJfvEYd8dBFj07v0iEo6zdyx6wgZ2Ctd5YzbwL+Arc4taUUa+iyBSgKMz//7YZao82LkIAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712164834; c=relaxed/simple;
	bh=KGum2UiFM/XeeIttcKMIY9uAmatsd+1YLL7DOdMp7+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DR3XfQJwEWdjXHg+Wu9i+v0rfuous4HTor5uRKwXNYBDRPPckNlJhmX0lJrDVSU7Og+sxWrbE0s5/YGaIN+3QfISVX0GX8JK/cCh7fJDas82gYAji+PndGsNND5m5OnAB49XlMosus3xmQz1msP8Y+TQsXKOcCNOCe1Lyf2FIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oABUAQFL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB08C433C7;
	Wed,  3 Apr 2024 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712164834;
	bh=KGum2UiFM/XeeIttcKMIY9uAmatsd+1YLL7DOdMp7+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oABUAQFLE5rvlGRe9n33r2gluGm1nhYrM58Nds1JcHq4Tse28NX+PRcjApIBpJTe6
	 jjXSj1o7YyyRsGTwTvbaokeWMRj8q3GXqoocOe0loN+rEl0RSnhawOnXsWPb6oEIPE
	 H++DAFYiu+drq3DujSJRPGVW20SzGgno+7N+4gOh6x7gskw9V4pUS2Da+hUtJp1ADo
	 lytWdCQl+f47oB/GewaULhQgHnm3QP92LARr5dmSSm1x0gwbBrNnXgJzZSrKgbhney
	 PiYgv/cWNUWW90amdoTit7D6KD6Gh5SFGE5rbQ9U+g3/C+AnYVFenfLQsqoFv9+sbX
	 I2CWKBL/1AuBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aleksandr Burakov <a.burakov@rosalinux.ru>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	FlorianSchandinat@gmx.de,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 5/6] fbdev: viafb: fix typo in hw_bitblt_1 and hw_bitblt_2
Date: Wed,  3 Apr 2024 13:20:21 -0400
Message-ID: <20240403172026.353926-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403172026.353926-1-sashal@kernel.org>
References: <20240403172026.353926-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.273
Content-Transfer-Encoding: 8bit

From: Aleksandr Burakov <a.burakov@rosalinux.ru>

[ Upstream commit bc87bb342f106a0402186bcb588fcbe945dced4b ]

There are some actions with value 'tmp' but 'dst_addr' is checked instead.
It is obvious that a copy-paste error was made here and the value
of variable 'tmp' should be checked here.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Aleksandr Burakov <a.burakov@rosalinux.ru>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/via/accel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/via/accel.c b/drivers/video/fbdev/via/accel.c
index 0a1bc7a4d7853..1e04026f08091 100644
--- a/drivers/video/fbdev/via/accel.c
+++ b/drivers/video/fbdev/via/accel.c
@@ -115,7 +115,7 @@ static int hw_bitblt_1(void __iomem *engine, u8 op, u32 width, u32 height,
 
 	if (op != VIA_BITBLT_FILL) {
 		tmp = src_mem ? 0 : src_addr;
-		if (dst_addr & 0xE0000007) {
+		if (tmp & 0xE0000007) {
 			printk(KERN_WARNING "hw_bitblt_1: Unsupported source "
 				"address %X\n", tmp);
 			return -EINVAL;
@@ -260,7 +260,7 @@ static int hw_bitblt_2(void __iomem *engine, u8 op, u32 width, u32 height,
 		writel(tmp, engine + 0x18);
 
 		tmp = src_mem ? 0 : src_addr;
-		if (dst_addr & 0xE0000007) {
+		if (tmp & 0xE0000007) {
 			printk(KERN_WARNING "hw_bitblt_2: Unsupported source "
 				"address %X\n", tmp);
 			return -EINVAL;
-- 
2.43.0


