Return-Path: <linux-fbdev+bounces-3200-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4387990F6D
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 21:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03432B2F746
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Oct 2024 19:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1BE230E1F;
	Fri,  4 Oct 2024 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2bZ6Tvu"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C51E1C37;
	Fri,  4 Oct 2024 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728066736; cv=none; b=Wsh3RZ1r/aqK5YhjwaxDATEXMeYg8r1X/4ng74MMfwV5EeAUQqQw4lshsN+YYbBdQ5cgTcrXMMUxyuDPps2aJJdZAChLJn9ZgunNPQXs8sfiZSkSWjP6UeHs1bFY5PRn6GrL7SZKChwvjYx8kKgFHjhw/4JY76/yusksBdrKWWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728066736; c=relaxed/simple;
	bh=kqds2NyBuVvxYXnbgrMcfF/YXMYOO/t54toLJN9wb8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVRnpelHAHEIcCaq7H8w3niJ25qN8SHsxUIw3Z7yA9nEothmCAQeI3inxh4hJS1jRDLgSTHzsLx43aKO0LRSsf8zCNHMWFYcYeGB7z3TPR6tOrthX6Jj8i8ix7jm722Nxrla/O9GBo8whMkOmXzNoOMx3VeP52jARoTa5HoH/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2bZ6Tvu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535E7C4CECC;
	Fri,  4 Oct 2024 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066736;
	bh=kqds2NyBuVvxYXnbgrMcfF/YXMYOO/t54toLJN9wb8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j2bZ6Tvu05cnoTx6BnLQS0kkDB1cC9aRIVRXUIz2erDN5TTLSn/C5Hyza3cQei28G
	 Dc84eYO4opEa9pWoA9AT2N/Q/Y6HvrRiAmnxZ0BjxZdqaWO/51QLbua4nG+pCpMhQk
	 vRwcm5Fn56kD9g1arwd/Jdm1LoFNZZp/HXMjUzczeL1PPW/1V1X3cwvXxTi6jbHHxy
	 6/jKMyT+PGQjS0g0k7k367IMKjRbMmUjDkiUzvomR4CPJeGHRXHaVLOjE9WRLW7YLr
	 rKwk8qoKJmXXdb7OpeYABTknYW3QWXgQc/3tMCAES7nEvfKmmx+IIfiKuszul1BVST
	 drzkpNbh3vEEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrey Shumilin <shum.sdl@nppct.ru>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>,
	tzimmermann@suse.de,
	javierm@redhat.com,
	fullwaywang@outlook.com,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 4.19 16/16] fbdev: sisfb: Fix strbuf array overflow
Date: Fri,  4 Oct 2024 14:31:43 -0400
Message-ID: <20241004183150.3676355-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004183150.3676355-1-sashal@kernel.org>
References: <20241004183150.3676355-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.322
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
index b7f9da690db27..38a772582bc3e 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -197,7 +197,7 @@ static void sisfb_search_mode(char *name, bool quiet)
 {
 	unsigned int j = 0, xres = 0, yres = 0, depth = 0, rate = 0;
 	int i = 0;
-	char strbuf[16], strbuf1[20];
+	char strbuf[24], strbuf1[20];
 	char *nameptr = name;
 
 	/* We don't know the hardware specs yet and there is no ivideo */
-- 
2.43.0


