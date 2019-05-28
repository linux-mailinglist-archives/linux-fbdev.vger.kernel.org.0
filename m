Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12962C2A7
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfE1JHA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:07:00 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43626 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfE1JDP (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id w33so27262408edb.10
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zV1k/wyKbSK4unVk9Zsa3jP6q9n4lvzRcxAhP6ZZB9c=;
        b=Jr4diFnn4D12FEqGpJQ+RuXfm8du2nWF1rRHD4W7cIEGcbaXABy4y7PYtm1RWYCGsM
         4VUgAtZNFYUQNW5orIhfjotHfmaMRBcdXOU7lv9qvqyzRqJa5qThyVjqHAx5MH9qVK6q
         lTOmQV05XsP0H1DMu730MHM4S7AOOkuX/FVNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zV1k/wyKbSK4unVk9Zsa3jP6q9n4lvzRcxAhP6ZZB9c=;
        b=eTY+OU+ljc60bKdjdZgD5FYCGn2h4EGH60mjzS4LZOyi5BVay6XKv7GjxN/7dff8Rp
         9VfgxQw0kuh7Dq2ZBI9v64G7sH2JcNKSB7Gra8lPCywmZDmczjvOgpDtLZtKQbxm0hrz
         g2HM3bF5juO9DvJzVAHaI5ZANcfjcwQxg0jQ4B8SpO1rl8/r0Odj6AjVLez7MnVl2McG
         53jH+7GTqir2Q6RSX/0TtWu43S3a1ytbA9VR1tSGIk0CEY8o8kmYQJ8NXzxgLWhZNMdX
         SG9mYf6drOV0xOfph4fACvpRff2x3Gk2qECEcqzpW0mqT9UqsrZoDC0EIruAZFopWMpZ
         zNWw==
X-Gm-Message-State: APjAAAU1ZpziEImHEWJjwZngF4sUTs39Ct8Fp6sj74QIk/IliRLQpifW
        xr+yPdohBq7WmAmstrNptw4ZRg==
X-Google-Smtp-Source: APXvYqzAGcPvnepTOvwWRDQxzLcJ/M058MuV1V355eV9v96p3PIpDSwE+P8RHoMQgcX7eCRUeENRAg==
X-Received: by 2002:a50:8a46:: with SMTP id i64mr126930218edi.177.1559034193385;
        Tue, 28 May 2019 02:03:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:12 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Manfred Schlaegl <manfred.schlaegl@ginzinger.com>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH 02/33] fbdev: locking check for fb_set_suspend
Date:   Tue, 28 May 2019 11:02:33 +0200
Message-Id: <20190528090304.9388-3-daniel.vetter@ffwll.ch>
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

Just drive-by, nothing systematic yet.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
Cc: Peter Rosin <peda@axentia.se>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Manfred Schlaegl <manfred.schlaegl@ginzinger.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>
Cc: Kees Cook <keescook@chromium.org>
---
 drivers/video/fbdev/core/fbmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index d1949c92be98..8ba674ffb3c9 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1985,6 +1985,8 @@ void fb_set_suspend(struct fb_info *info, int state)
 {
 	struct fb_event event;
 
+	WARN_CONSOLE_UNLOCKED();
+
 	event.info = info;
 	if (state) {
 		fb_notifier_call_chain(FB_EVENT_SUSPEND, &event);
-- 
2.20.1

