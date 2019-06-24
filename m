Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD4F5058E
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2019 11:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfFXJWB (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jun 2019 05:22:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36611 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfFXJWB (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jun 2019 05:22:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id k21so20782939edq.3
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jun 2019 02:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+BUYv0zqx8JIAejbVUFuWCyUFzi0Ma0oiXTkdM9XeBA=;
        b=D5WZwKUOqaEYxf9YiCGA1hGGeS+fnJ87Uk5TnGhZMEmbhxOZBjbdtmZi5JFaciO6rf
         fYk4DRN8WEzOg5rJR6avnD3k16txo0YzxSmxnlh68316/FKyoLfFUebCQ7IGOZqBH7ii
         KwbVftADxitSPXm1+Z5+bbC5EWcXZytEwhHbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+BUYv0zqx8JIAejbVUFuWCyUFzi0Ma0oiXTkdM9XeBA=;
        b=d/nFWg7APGUjz0xHBbEHBDTHzefbgnijZ7X8sxmDNIyjb9Oly4joknQnmazviKvzr6
         7/yN1EtP9QVxHO6E/d9ux0EYDILiEZEMau9K1sLCxK3bQh/JK5JyzBbBkm78fOFKtD7q
         kkSfU18s/TxKY7YWN+hQWNPa+OZmwOYfKOVjfAj2cv0x7ZOtljubjg3jcVbtcf4QmscK
         G7Q56L10zfaPZiRVmMmklx4WAlc8Iw9ZQ4B5OGX+nNYSfHZWS3CSFFWjj8l3TIzbj/mg
         4OaPZQKZ7hy2kSG8U1UpkXYgI/OK+eKvLrP7QGMcqc57kst3BDrN2jUmJtYUiWtzqy53
         EN3A==
X-Gm-Message-State: APjAAAXBDNvz4/6vpS6HF81xO1nzxlUiM6NR8mdBE4CZuBeEif5G391o
        /xT1Lihj3wqIgGEUfxNqaaV0DCtboPY=
X-Google-Smtp-Source: APXvYqz8Q2nVLs1tDAdsiwqZ2dYDUxN/Py220zuadxrweoxy+8stjJzd4MvG81Wi2CYIZ1kAGnzZXw==
X-Received: by 2002:a17:906:1dcb:: with SMTP id v11mr1768180ejh.218.1561368119634;
        Mon, 24 Jun 2019 02:21:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id c3sm1769156ejo.43.2019.06.24.02.21.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 24 Jun 2019 02:21:58 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>, linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if enabled
Date:   Mon, 24 Jun 2019 11:21:53 +0200
Message-Id: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fixes linking fail when fbcon/fbdev is modular and vgaswitcheroo is
enabled:

x86_64-linux-gnu-ld: drivers/gpu/vga/vga_switcheroo.o: in function `vga_switchto_stage2':
vga_switcheroo.c:(.text+0x997): undefined reference to `fbcon_remap_all'

v2: I first tried to fix this with an EXPORT_SYMBOL, but vga_switcheroo is
never a module, so this doesn't work.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Yisheng Xie <ysxie@foxmail.com>
Cc: linux-fbdev@vger.kernel.org
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
--
wrt merging probably best if Maarten adds this to the topic branch we
have already and sends out an updated pull request.

Apologies for the mess.
-Daniel
---
 drivers/gpu/vga/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
index 84ab482d0db6..c8c770b05ed9 100644
--- a/drivers/gpu/vga/Kconfig
+++ b/drivers/gpu/vga/Kconfig
@@ -23,6 +23,7 @@ config VGA_SWITCHEROO
 	depends on X86
 	depends on ACPI
 	depends on PCI
+	depends on (FRAMEBUFFER_CONSOLE=n || FB=y)
 	select VGA_ARB
 	help
 	  Many laptops released in 2008/9/10 have two GPUs with a multiplexer
-- 
2.20.1

