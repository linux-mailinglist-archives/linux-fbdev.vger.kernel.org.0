Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE6922ACA2
	for <lists+linux-fbdev@lfdr.de>; Thu, 23 Jul 2020 12:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgGWKe4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 23 Jul 2020 06:34:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:44098 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgGWKe4 (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 23 Jul 2020 06:34:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1A1C1AC52;
        Thu, 23 Jul 2020 10:35:03 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Slaby <jslaby@suse.cz>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH -resend] Documentation: fb, fix path to modedb.c
Date:   Thu, 23 Jul 2020 12:34:54 +0200
Message-Id: <20200723103454.26167-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

modedb.c was moved twice since the modedb documentation was written.
Update the path to the current one.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/fb/modedb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
index 624d08fd2856..4d2411e32ebb 100644
--- a/Documentation/fb/modedb.rst
+++ b/Documentation/fb/modedb.rst
@@ -152,7 +152,7 @@ To specify a video mode at bootup, use the following boot options::
     video=<driver>:<xres>x<yres>[-<bpp>][@refresh]
 
 where <driver> is a name from the table below.  Valid default modes can be
-found in linux/drivers/video/modedb.c.  Check your driver's documentation.
+found in drivers/video/fbdev/core/modedb.c.  Check your driver's documentation.
 There may be more modes::
 
     Drivers that support modedb boot options
-- 
2.27.0

