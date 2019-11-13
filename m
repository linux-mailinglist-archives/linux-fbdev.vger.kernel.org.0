Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCE2FA4FF
	for <lists+linux-fbdev@lfdr.de>; Wed, 13 Nov 2019 03:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfKMByX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 12 Nov 2019 20:54:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:45042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727843AbfKMByV (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 12 Nov 2019 20:54:21 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA44C2245A;
        Wed, 13 Nov 2019 01:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573610060;
        bh=6tKVNmbw+qYOY0gZtKFGEPhIaxF5nM+KLL6j78blHzQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pRsfk0I3frKV6To2Ym+H+CS2jC1mV52HOR/sv/aGNERcnKajtHbFrLU1CQ/SZyZ8j
         WMBSr8JyZVPJi/YGZuBQITAnLX7SLX7gvSv8OuOEFqA/QNV4ZXA59GB1VSEVtS4Bom
         CasAEhkKIafe+ZHpUveZK0TujUF0L2gVfioZzGfc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Peter Malone <peter.malone@gmail.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Mathieu Malaterre <malat@debian.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 142/209] fbdev: sbuslib: integer overflow in sbusfb_ioctl_helper()
Date:   Tue, 12 Nov 2019 20:49:18 -0500
Message-Id: <20191113015025.9685-142-sashal@kernel.org>
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

[ Upstream commit e5017716adb8aa5c01c52386c1b7470101ffe9c5 ]

The "index + count" addition can overflow.  Both come directly from the
user.  This bug leads to an information leak.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Malone <peter.malone@gmail.com>
Cc: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Mathieu Malaterre <malat@debian.org>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/sbuslib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 90c51330969c2..01a7110e61a76 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -171,7 +171,7 @@ int sbusfb_ioctl_helper(unsigned long cmd, unsigned long arg,
 		    get_user(ublue, &c->blue))
 			return -EFAULT;
 
-		if (index + count > cmap->len)
+		if (index > cmap->len || count > cmap->len - index)
 			return -EINVAL;
 
 		for (i = 0; i < count; i++) {
-- 
2.20.1

