Return-Path: <linux-fbdev+bounces-1841-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6008A898727
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Apr 2024 14:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19AB829822D
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Apr 2024 12:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E6B8592E;
	Thu,  4 Apr 2024 12:18:30 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668C885644
	for <linux-fbdev@vger.kernel.org>; Thu,  4 Apr 2024 12:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233110; cv=none; b=sytIN4NR/DIdL0ay1/EKTm2vCM9i0C58bXpRk+EI/lb6ZaxdOp+zkhKZ0OY5oIpgKTvia9QsI3b0AACqWcJDSfeAa9kbJBz0UibtrWkcG9CXvc09+D8exLkfys5suowjpplyPqwDEDx+fi1QzENZTLxKXVMW7xVVK4FuiqixLu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233110; c=relaxed/simple;
	bh=d1KxWKIJ3YaIZNwhY4R410HK/60lYdy/l8iO/RibO9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eM6QYiEVJ16/Ls+FMqnV1AdvLn0OkhNEXmTsL9YVOP2mqe3H8r0JwMJkNnaKgx5MtJd2onX4ow2FLt4oE2fM6SDghqkCqdwme2QAVvatkNCNKFlpMS2eK0mxtyR74DSpV112dYj6tj0AhNW9gxM5/UG2kJ7JATKpuUD5+8hSCmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rsM2z-0002UY-Aw; Thu, 04 Apr 2024 14:18:25 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rsM2y-00AN0T-MN; Thu, 04 Apr 2024 14:18:24 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: [PATCH] drivers: video: logo: Don't mention the full path of the input in output
Date: Thu,  4 Apr 2024 14:18:24 +0200
Message-Id: <20240404121824.3330254-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org

This change strips $abs_srctree of the input file containing the
PNM data in the generated output. The motivation for this change
is Yocto emitting a build warning

    WARNING: linux-foo-6.8-r0 do_package_qa: QA Issue:
    File /usr/src/debug/linux-foo/6.8-r0/drivers/video/logo/logo_linux_clut224.c
    in package linux-foo-src contains reference to TMPDIR

So this change brings us one step closer to make the build result
reproducible independent of the build path.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/video/logo/pnmtologo.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
index 2434a25afb64..59ccd721e8af 100644
--- a/drivers/video/logo/pnmtologo.c
+++ b/drivers/video/logo/pnmtologo.c
@@ -223,6 +223,18 @@ static inline int is_equal(struct color c1, struct color c2)
 
 static void write_header(void)
 {
+	const char *abs_srctree = getenv("abs_srctree");
+	const char *rel_filename;
+
+	if (abs_srctree &&
+	    !strncmp(abs_srctree, filename, strlen(abs_srctree))) {
+		rel_filename = filename + strlen(abs_srctree);
+		while (*rel_filename == '/')
+			++rel_filename;
+	} else {
+		rel_filename = filename;
+	}
+
 	/* open logo file */
 	if (outputname) {
 		out = fopen(outputname, "w");
@@ -235,7 +247,7 @@ static void write_header(void)
 	fputs("/*\n", out);
 	fputs(" *  DO NOT EDIT THIS FILE!\n", out);
 	fputs(" *\n", out);
-	fprintf(out, " *  It was automatically generated from %s\n", filename);
+	fprintf(out, " *  It was automatically generated from %s\n", rel_filename);
 	fputs(" *\n", out);
 	fprintf(out, " *  Linux logo %s\n", logoname);
 	fputs(" */\n\n", out);
-- 
2.39.2


