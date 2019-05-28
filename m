Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1572C1FB
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfE1JDO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:03:14 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45724 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfE1JDN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:13 -0400
Received: by mail-ed1-f67.google.com with SMTP id g57so15790132edc.12
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLUCrKXHKAt3A/bBQVqTCTeOCvNqnrpALUNOe9jfHr4=;
        b=bMQ2bjpJBQsrLyF5NtCNtdDCqdZu00kxLhGVHuMgu5Ecnfugp/vFvZTt9YPT8/0NBT
         jUEC2OIP1/tU6emJgemxpDua5SKNi51ovh5LtpPGk1dY31H2NH0+z5o2haeY9WRwVZEj
         Fd6Bp0VSshVT08iDz2tigAozeP4D6d32wcQR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLUCrKXHKAt3A/bBQVqTCTeOCvNqnrpALUNOe9jfHr4=;
        b=CRgI7l+VynK9GGN7bJwYwiZ8A7MggUR0Mk0HcY6ExV57ILzeIsqmC/pFybKsVzme2c
         MWsGdG4F6v5zfoKGnng/stsQBaDV1cxJxrGpn5ld2BwbALckO7tmxZZjKrstpUHFkNat
         yPhM1EDOaCufnCwqGMnemHcX4GWwIk9iY7RG421N3EhzpWSy4s+ResLQpsg66ZExVJzL
         o30oMBO/6UB9ewc8E1JDuaZzZKn272yrSekA7z+TG+iYENrljZEAXQvxbW7PakNZRtzP
         3RkZZ8CkD9gyOQuUeoWxIekt3kCDEbNXaY0gsL1UojdiDsObbZrftAbOpFilDFJWfsAk
         ve3Q==
X-Gm-Message-State: APjAAAXenL7mUA2D1HK8WxmAEnfa5JjbvTDB4Cq+TcywQ3M5iukM1H/p
        wrQ21w+wu2ai9Ers5j3O+10IEg==
X-Google-Smtp-Source: APXvYqzLN70+l87QPlEz8uE9d+Hi4atwthd0XgMpMbEkaPaxgOCAKWKU1k0iYUwvw4YO9wheHnEZxg==
X-Received: by 2002:a50:b665:: with SMTP id c34mr127787580ede.148.1559034191897;
        Tue, 28 May 2019 02:03:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:11 -0700 (PDT)
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
        Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 01/33] dummycon: Sprinkle locking checks
Date:   Tue, 28 May 2019 11:02:32 +0200
Message-Id: <20190528090304.9388-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

As part of trying to understand the locking (or lack thereof) in the
fbcon/vt/fbdev maze, annotate everything.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
---
 drivers/video/console/dummycon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index ff886e99104b..2a0d0bda7faa 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -34,6 +34,8 @@ static bool dummycon_putc_called;
 
 void dummycon_register_output_notifier(struct notifier_block *nb)
 {
+	WARN_CONSOLE_UNLOCKED();
+
 	raw_notifier_chain_register(&dummycon_output_nh, nb);
 
 	if (dummycon_putc_called)
@@ -42,11 +44,15 @@ void dummycon_register_output_notifier(struct notifier_block *nb)
 
 void dummycon_unregister_output_notifier(struct notifier_block *nb)
 {
+	WARN_CONSOLE_UNLOCKED();
+
 	raw_notifier_chain_unregister(&dummycon_output_nh, nb);
 }
 
 static void dummycon_putc(struct vc_data *vc, int c, int ypos, int xpos)
 {
+	WARN_CONSOLE_UNLOCKED();
+
 	dummycon_putc_called = true;
 	raw_notifier_call_chain(&dummycon_output_nh, 0, NULL);
 }
-- 
2.20.1

