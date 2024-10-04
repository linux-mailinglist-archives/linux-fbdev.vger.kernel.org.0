Return-Path: <linux-fbdev+bounces-3199-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDB4990EFF
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 21:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D768C1F21B8A
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 19:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E19A22EB23;
	Fri,  4 Oct 2024 18:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1/Q1TFc"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2F1E0DAD;
	Fri,  4 Oct 2024 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066702; cv=none; b=Y7M+FuKRiWM0xgFRmXyIyla+sYNUED9sP+gXQwalo76A9BVM3XritCiiYIFwi//Qf+Bu3pub7FKTQa3TADYm8i8mKVFYKqVLLU4xeD3d+zXmaUv1J7Y3Yav03VvXrFiw/7xh6PotXgUV3ESEu3H5QuBas7ZmQymYimUqQM/vn3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066702; c=relaxed/simple;
	bh=B8Fx3Q+Xw1jiIfd8zISR/GfjM0Tn9csC0lTW5Rn8nQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a82hd0LYvhFVMd0nz7scK92AMVJpWOJ7aEPfWXnUezUSbskPWU52rrxVXW+HFvCsZ+yxW++cMrkqiAYzctgW7Um8JBZytA/wgXljaoe5qPTnuJXbh7/lUefprX/He3eurzS3n5j0WnGkg910PsBobssNf21JRdve/zKYKSIIuus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1/Q1TFc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD0FC4CEC6;
	Fri,  4 Oct 2024 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066702;
	bh=B8Fx3Q+Xw1jiIfd8zISR/GfjM0Tn9csC0lTW5Rn8nQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1/Q1TFcveFrmhuEK2IregLyLNmwUFQ4M7EB04OODcW4vfIF0SFWkQnPKIXsyrGFH
	 w47IsVXSyR2YFHBQJxvYEN/6PAhdH3qDWVPfOBvgnBq3uqHVx/fX2KvgxMmQV3R/Ui
	 qISI+dhQg7s2HSsUFzyxb0lHu4k26Qec+cbWYojNueqeT0EBCPXAUh6YX0cCmSyBZX
	 37PVmRyU+E5xYm2GxWocWtpQQec62QdHIzp6MdzYv4UHkJ8wkx9leVuhwfMFX8MZq9
	 AOHSW8zZcWDmpX9PCf3orxxMG+IWKjEMDirC9MC3togfl6d6cavqa9Abth83oxtTxu
	 DBDms5NQVLMig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrey Shumilin <shum.sdl@nppct.ru>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	tzimmermann@suse.de,
	fullwaywang@outlook.com,
	javierm@redhat.com,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 21/21] fbdev: sisfb: Fix strbuf array overflow
Date: Fri,  4 Oct 2024 14:30:56 -0400
Message-ID: <20241004183105.3675901-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183105.3675901-1-sashal@kernel.org>
References: <20241004183105.3675901-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.284
Content-Transfer-Encoding: 8bit

From: Andrey Shumilin <shum.sdl@nppct.ru>

[ Upstream commit 9cf14f5a2746c19455ce9cb44341b5527b5e19c3 ]

The values of the variables xres and yres are placed in strbuf.
These variables are obtained from strbuf1.
The strbuf1 array contains digit characters
and a space if the array contains non-digit characters.
Then, when executing sprintf(strbuf, "%ux%ux8", xres, yres);
more than 16 bytes will be written to strbuf.
It is suggested to increase the size of the strbuf array to 24.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/sis/sis_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 2fdd02e51f5fc..db745dc3cebe2 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -183,7 +183,7 @@ static void sisfb_search_mode(char *name, bool quiet)
 {
 	unsigned int j = 0, xres = 0, yres = 0, depth = 0, rate = 0;
 	int i = 0;
-	char strbuf[16], strbuf1[20];
+	char strbuf[24], strbuf1[20];
 	char *nameptr = name;
 
 	/* We don't know the hardware specs yet and there is no ivideo */
-- 
2.43.0


