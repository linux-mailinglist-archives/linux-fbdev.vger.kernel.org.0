Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3F7185AEB
	for <lists+linux-fbdev@lfdr.de>; Sun, 15 Mar 2020 08:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgCOHPf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sun, 15 Mar 2020 03:15:35 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49192 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727444AbgCOHPe (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sun, 15 Mar 2020 03:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Sender:Reply-To:Content-ID:Content-Description;
        bh=geChFULqiY9Qc5SvHVzZJBad8vXBVakwRLiv7qGppg4=; b=X4ZzG6l2kt6LRNml+3PFZwy6FU
        XeJ297XxbtTXbNwsU7xOEUT2qsnoYDV8tE9+0HZuP6EJNNjbTmdttTl3q+M3vJEeqDVFRRRGh5ye8
        0QdJOjuOAqW/q0Bp/dS4Jcq8gE3w72u3wh+gS9nbovQVOdQQIkY/qpLL1Nc6WqR+TspJsZN4h6khF
        5nuQ5AXmif64N5/VPrM2DXs/WekAJcW+oGhPSjeK9v5giDPmeJMXlf7hsvEFxLAOX1qU45XvAa9zB
        /wlh3mRWmU/MK242NQy8FX9bh1l7ps0zA8oJl3AB4vg8GebzVoWJRQBqvQkpitIQS+mku+zkmhiNg
        UgTuGGqw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jDKbE-0003dY-L5; Sun, 15 Mar 2020 04:10:04 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Antonino Daplas <adaplas@gmail.com>,
        Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Subject: [PATCH 1/6] fbdev: fbmon: fix -Wextra build warnings
Date:   Sat, 14 Mar 2020 21:09:57 -0700
Message-Id: <20200315041002.24473-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200315041002.24473-1-rdunlap@infradead.org>
References: <20200315041002.24473-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

When 'DEBUG' is not defined, modify the DPRINTK() macro to use the
no_printk() macro instead of using <empty>.
This fixes a build warning when -Wextra is used and provides
printk format checking:

../drivers/video/fbdev/core/fbmon.c:812:47: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../drivers/video/fbdev/core/fbmon.c:842:24: warning: suggest braces around empty body in an ‘else’ statement [-Wempty-body]
../drivers/video/fbdev/core/fbmon.c:847:24: warning: suggest braces around empty body in an ‘else’ statement [-Wempty-body]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
---
Alternative: use pr_debug() so that CONFIG_DYNAMIC_DEBUG can be used
at these sites.

 drivers/video/fbdev/core/fbmon.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200313.orig/drivers/video/fbdev/core/fbmon.c
+++ linux-next-20200313/drivers/video/fbdev/core/fbmon.c
@@ -44,7 +44,7 @@
 #ifdef DEBUG
 #define DPRINTK(fmt, args...) printk(fmt,## args)
 #else
-#define DPRINTK(fmt, args...)
+#define DPRINTK(fmt, args...) no_printk(fmt, ##args)
 #endif
 
 #define FBMON_FIX_HEADER  1
