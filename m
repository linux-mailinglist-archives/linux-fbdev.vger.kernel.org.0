Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143882C299
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfE1JGY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:06:24 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:33587 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbfE1JDf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:35 -0400
Received: by mail-ed1-f67.google.com with SMTP id n17so30688345edb.0
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=01fUYB3VzPGfcTugqgqBx5jW8iq7wLyVUX3qXdYLYSk=;
        b=DIUw/kO/LXyngvpKwzC2ewKvPzp/6OUUrTW3jHZNYZjGOyfUOx9k0Ymf2PWGe0uTX1
         aFGbqCs0JBCbXRctZ3Clc9hEOdMbgD2j3dVb6uM642xcQ+8j4uPyEreOpxw8GzNrxnV1
         fOlYw4DwyEZcV634rmGq6J/k76ZdCQuxlqhWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=01fUYB3VzPGfcTugqgqBx5jW8iq7wLyVUX3qXdYLYSk=;
        b=DeHrtuS7wBRl9DX+SnTqDPTEjw0OMAoYpOwBhXKVQNXSiuYMR3rNYppsTGFBOHj1HJ
         hZtFGNi9cbvayxWDvlyEqP8dKUKqlR2cA1jDS1IeYRYwxmgfPSEgUNx8B/uktWaFP6pn
         /NMKSvrnpnDCJEvHO0h7Baacp6AlgBx26hq8HllsZhZpkXQRbFtMjNJxgAsbrj662yfa
         OL0NBwNak6dPCeKf37pSSd6pzMV/v6bzbJXCp7ytYPgUlrTjSKusAXi3W7o2gUOJuAcN
         hTnYwbh/eyZYuVGJi4TFoI0pnqjNaopDoxNwIZ8udqiGZbngfntcC2Wgqii1akqV4fgh
         ZaMA==
X-Gm-Message-State: APjAAAXiFYxs/fQI1KMMN2QVHKhg1eylWARcuvZv3plhYgdh6+zgUOAk
        7xiOgM1Rty6qBVGc0NGaBSgcrg==
X-Google-Smtp-Source: APXvYqz0EMzb0SG65WaaBqt1bSsx+8cxym9XyhE58ExT9b6/OKWIr27r6jDPAQ9wP/aEEzvPm7cAVg==
X-Received: by 2002:a50:8903:: with SMTP id e3mr126039162ede.11.1559034213606;
        Tue, 28 May 2019 02:03:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:32 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mikulas Patocka <mpatocka@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <syrjala@sci.fi>
Subject: [PATCH 15/33] fbdev/atyfb: lock_fb_info can't fail
Date:   Tue, 28 May 2019 11:02:46 +0200
Message-Id: <20190528090304.9388-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It's properly protected by reboot_lock.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: "Ville Syrjälä" <syrjala@sci.fi>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/video/fbdev/aty/atyfb_base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index b6fe103df145..eebb62d82a23 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3916,8 +3916,7 @@ static int atyfb_reboot_notify(struct notifier_block *nb,
 	if (!reboot_info)
 		goto out;
 
-	if (!lock_fb_info(reboot_info))
-		goto out;
+	lock_fb_info(reboot_info);
 
 	par = reboot_info->par;
 
-- 
2.20.1

