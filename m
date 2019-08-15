Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD638EB8E
	for <lists+linux-fbdev@lfdr.de>; Thu, 15 Aug 2019 14:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731425AbfHOMaQ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 15 Aug 2019 08:30:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731022AbfHOMaQ (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 15 Aug 2019 08:30:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17CF42083B;
        Thu, 15 Aug 2019 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565872215;
        bh=fcSMZ1hJLe1SylXpsIiEI19jNgj4Ja71oWB1pvH9mE0=;
        h=From:To:Cc:Subject:Date:From;
        b=iCyeKbRHojiJhhwZiRC9bCk1k8tH4WmyxMoMLzl9zNRaKr2F33UYtutxdiliP+MtA
         SD4T8YiQs4wtpIigV47cAxXUwpy9ltZTfqtJoxElPIYuLiYq4AFgEhmZRqh4d9l7Oy
         qkINkjsbMNu0GR9YZnBO//iSzWFtTfRpxfTY6BNM=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     devel@driverdev.osuosl.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Teddy Wang <teddy.wang@siliconmotion.com>,
        linux-fbdev@vger.kernel.org
Subject: [PATCH] staging: sm750fb: fix odd license text
Date:   Thu, 15 Aug 2019 14:30:09 +0200
Message-Id: <20190815123009.16499-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There is some "confusing" license text in some of the sm750fb driver
files.  After discussing it with the company, it turns out to have been
a mistake and these lines can be safely removed.  The files are all to
be licensed under the GPLv2 license.

Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: linux-fbdev@vger.kernel.org
Cc: devel@driverdev.osuosl.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/sm750fb/ddk750.h       | 3 ---
 drivers/staging/sm750fb/ddk750_swi2c.c | 3 ---
 drivers/staging/sm750fb/ddk750_swi2c.h | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750.h b/drivers/staging/sm750fb/ddk750.h
index 482c1c6ba422..64ef4d258a91 100644
--- a/drivers/staging/sm750fb/ddk750.h
+++ b/drivers/staging/sm750fb/ddk750.h
@@ -2,9 +2,6 @@
 /*
  *         Copyright (c) 2007 by Silicon Motion, Inc. (SMI)
  *
- *  All rights are reserved. Reproduction or in part is prohibited
- *  without the written consent of the copyright owner.
- *
  *  RegSC.h --- SM718 SDK
  *  This file contains the definitions for the System Configuration registers.
  */
diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index 5c0ac747ea2b..0ef8d4ff2ef9 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -2,9 +2,6 @@
 /*
  *         Copyright (c) 2007 by Silicon Motion, Inc. (SMI)
  *
- *  All rights are reserved. Reproduction or in part is prohibited
- *  without the written consent of the copyright owner.
- *
  *  swi2c.c --- SM750/SM718 DDK
  *  This file contains the source code for I2C using software
  *  implementation.
diff --git a/drivers/staging/sm750fb/ddk750_swi2c.h b/drivers/staging/sm750fb/ddk750_swi2c.h
index 5868feea791b..dfa166060da7 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.h
+++ b/drivers/staging/sm750fb/ddk750_swi2c.h
@@ -2,9 +2,6 @@
 /*
  *         Copyright (c) 2007 by Silicon Motion, Inc. (SMI)
  *
- *  All rights are reserved. Reproduction or in part is prohibited
- *  without the written consent of the copyright owner.
- *
  *  swi2c.h --- SM750/SM718 DDK
  *  This file contains the definitions for i2c using software
  *  implementation.
-- 
2.22.1

