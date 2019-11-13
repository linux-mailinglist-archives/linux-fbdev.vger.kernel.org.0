Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC9DFA4FD
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Nov 2019 03:21:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbfKMByS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Nov 2019 20:54:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:44896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728827AbfKMByS (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Nov 2019 20:54:18 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DFDF2245C;
        Wed, 13 Nov 2019 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610057;
        bh=7ZCL7NcTxYsKgq1kH/R/h8GRcaWqaQ0rSb8KFEgYlJQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EOj8trKCKp8saStxDi/Ak1cxgKUcB9lDvHsxVF7PDvTatJheOqXLhRG5Wtq4jrb1h
         s5eU78/AwelGJmoVevJA00rKXk4g3tROv0N+eg6sCBS+4ZDAvvzSqQXzwiyNOqMRxi
         QfZT80Jm9awFaEOBHGb0g9NFEe5f5f4JVsJc/3zM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Mathieu Malaterre <malat@debian.org>,
        Peter Malone <peter.malone@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 141/209] fbdev: sbuslib: use checked version of put_user()
Date:   Tue, 12 Nov 2019 20:49:17 -0500
Message-Id: <20191113015025.9685-141-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit d8bad911e5e55e228d59c0606ff7e6b8131ca7bf ]

I'm not sure why the code assumes that only the first put_user() needs
an access_ok() check.  I have made all the put_user() and get_user()
calls checked.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Mathieu Malaterre <malat@debian.org>
Cc: Peter Malone <peter.malone@gmail.com>,
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/sbuslib.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index a436d44f1b7fb..90c51330969c2 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -106,11 +106,11 @@ int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
 		struct fbtype __user *f = (struct fbtype __user *) arg;
 
 		if (put_user(type, &f->fb_type) ||
-		    __put_user(info->var.yres, &f->fb_height) ||
-		    __put_user(info->var.xres, &f->fb_width) ||
-		    __put_user(fb_depth, &f->fb_depth) ||
-		    __put_user(0, &f->fb_cmsize) ||
-		    __put_user(fb_size, &f->fb_cmsize))
+		    put_user(info->var.yres, &f->fb_height) ||
+		    put_user(info->var.xres, &f->fb_width) ||
+		    put_user(fb_depth, &f->fb_depth) ||
+		    put_user(0, &f->fb_cmsize) ||
+		    put_user(fb_size, &f->fb_cmsize))
 			return -EFAULT;
 		return 0;
 	}
@@ -125,10 +125,10 @@ int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
 		unsigned int index, count, i;
 
 		if (get_user(index, &c->index) ||
-		    __get_user(count, &c->count) ||
-		    __get_user(ured, &c->red) ||
-		    __get_user(ugreen, &c->green) ||
-		    __get_user(ublue, &c->blue))
+		    get_user(count, &c->count) ||
+		    get_user(ured, &c->red) ||
+		    get_user(ugreen, &c->green) ||
+		    get_user(ublue, &c->blue))
 			return -EFAULT;
 
 		cmap.len = 1;
@@ -165,10 +165,10 @@ int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
 		u8 red, green, blue;
 
 		if (get_user(index, &c->index) ||
-		    __get_user(count, &c->count) ||
-		    __get_user(ured, &c->red) ||
-		    __get_user(ugreen, &c->green) ||
-		    __get_user(ublue, &c->blue))
+		    get_user(count, &c->count) ||
+		    get_user(ured, &c->red) ||
+		    get_user(ugreen, &c->green) ||
+		    get_user(ublue, &c->blue))
 			return -EFAULT;
 
 		if (index + count > cmap->len)
-- 
2.20.1

