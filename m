Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5DFF8B32C
	for <lists+linux-fbdev@lfdr.de>; Tue, 13 Aug 2019 10:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfHMI7I (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 13 Aug 2019 04:59:08 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41911 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbfHMI7H (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 13 Aug 2019 04:59:07 -0400
Received: by mail-pg1-f196.google.com with SMTP id x15so40569896pgg.8
        for <linux-fbdev@vger.kernel.org>; Tue, 13 Aug 2019 01:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+aISf5UNe4Kt3/nCkOEsWQhdhcDoFXX/1+XapNBII4=;
        b=kyPgWMFDEIhKeNzWByGr1bYKKWNXxiB7U4zI0YX0RE+mbhAFCguKTbvMiTM8jVwua8
         YX/QgqAXDXSQxfi/Vo8qE1hC05+Svn8qx1MWz/kq3h+SIa6aj//peTLp0cHWqGkpedjE
         TBHEN9hFvvuIPp0yOAIat9F+wqm9bTQ9D39Iwoou0WKEwtCHFmTeobTk0DTbVB0kDbYp
         UWMfF0EmsdOGxskyFeM/cOwlYLnKpKsMfjvAXUgEjiWh3lB9MVLzgUGl5Z9kT+xGMNiy
         Nj/f/7+YrLEuMsiw7buRti8zJUCKgNk8h93nc66ByXH6wDDZZt+f1QzVEswdsOOTBB63
         fIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+aISf5UNe4Kt3/nCkOEsWQhdhcDoFXX/1+XapNBII4=;
        b=H0eKrLGrw0Wh+vjUaJQ+Q4oAExOAQzo4Ci9yBUw2byaHA2meS8tzZk6FV8BS+VKFog
         jMrWK+W7neQYHK5OZIl8KVPKrl6qfmAV3nfVBbVM0WxwmZpZrfI9ROSsCb/bBeQXz2T1
         FCK4wkLLDD4cs/Yc+w86RtxNxxYx6bOTcGOHqIqqLxpkfejZJ4sUt3ie0ltOMIdac1cK
         ARL+BQJOn6os/LNPx/ZKTVeq793gonxPpOhX78gFZ3ic+kr07KlvKiET9iZYuigQ9AEF
         NeKMfTzJNm5PV+oTffYjDecoru9lFdK73ESs5kI4t0NotkUM6me2Ksq8SbDpem6gbENp
         1DpQ==
X-Gm-Message-State: APjAAAUc49QhbB6CVFuSzVlddh/TKsOgBdHEeQoAxzrHL25ELpbnj4nY
        +sdwoXVBl9Jb/qRkfvjF8lA=
X-Google-Smtp-Source: APXvYqz5W9D4BBbD2zUwmwQoMa657L6LiCScytPhydugkZIYB+k23t6gV4wprBoxwWZy1QZpaB+fhg==
X-Received: by 2002:a17:90a:86c2:: with SMTP id y2mr330886pjv.46.1565686747080;
        Tue, 13 Aug 2019 01:59:07 -0700 (PDT)
Received: from localhost.localdomain ([122.163.110.75])
        by smtp.gmail.com with ESMTPSA id 3sm115526195pfg.186.2019.08.13.01.59.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 01:59:06 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     lee.jones@linaro.org, daniel.thompson@linaro.org,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] backlight: ipaq_micro: Make structure micro_bl_props constant
Date:   Tue, 13 Aug 2019 14:28:55 +0530
Message-Id: <20190813085855.8302-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Static structure micro_bl_props, having type backlight_properties, is
used only once, when it is passed as the last argument to function
devm_backlight_device_register(). devm_backlight_device_register() is
defined with its last parameter being declared constant. Hence make
micro_bl_props itself constant as well.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/video/backlight/ipaq_micro_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ipaq_micro_bl.c b/drivers/video/backlight/ipaq_micro_bl.c
index 1123f67c12b3..85b16cc82878 100644
--- a/drivers/video/backlight/ipaq_micro_bl.c
+++ b/drivers/video/backlight/ipaq_micro_bl.c
@@ -44,7 +44,7 @@ static const struct backlight_ops micro_bl_ops = {
 	.update_status  = micro_bl_update_status,
 };
 
-static struct backlight_properties micro_bl_props = {
+static const struct backlight_properties micro_bl_props = {
 	.type = BACKLIGHT_RAW,
 	.max_brightness = 255,
 	.power = FB_BLANK_UNBLANK,
-- 
2.19.1

