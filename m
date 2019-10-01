Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090ABC34FE
	for <lists+linux-fbdev@lfdr.de>; Tue,  1 Oct 2019 15:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388124AbfJAM72 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 1 Oct 2019 08:59:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38588 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387833AbfJAM71 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 1 Oct 2019 08:59:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id 3so3141899wmi.3
        for <linux-fbdev@vger.kernel.org>; Tue, 01 Oct 2019 05:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9pO+0MHgzeKL2RcdyibfEgdagmW4iIx3RKTGovDgU8=;
        b=u4pYneTQzTMfqKIneJ+jhBxo32+eE1GwceL9ysZrc8f2tvOcstNDoaKkJQl1nbl+Ao
         6P3gq0jMdTVzSgHdStBHb/dblw7AifsDwmT2WULmhx+XzH5eyFiqBZiu3RBxqpKMns3p
         PYsleSE1ip85l87GJ+TqXIGekOkdHa+YcZ8ie87g7R7dn6/IoOyp/YZ90NXKJUx1xVUf
         7tCRMhmeMthTNRPtxRqcYYppS0ZoSb8Kh4UJ9zRYf9Y5D6XlKKW0d3mbk5Q2Wo1a615C
         Ks0pjYRCdT3yCg50J/ikzSsCuh0XiTQ8J/vzgbqiRjZIbjzSm7OjXCRQPaUaU3EhcvaJ
         zUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9pO+0MHgzeKL2RcdyibfEgdagmW4iIx3RKTGovDgU8=;
        b=jkpvkOSoyTGGwtyU4qVEl9f0H+big0FuvbkYH7kOTxdeRdehe/RAOGxHFEcM5mSjWD
         qILcoOjg3QzQbN1Vnm1nV/Hf5D0/qPmFeMNOSFX2svn60QEFpjRb0h9Z3xbuOjJAZb1k
         Qjw6LF18/JuKvlHrFuydBA5cO4tBwYx7OIvq4jCKEQCzOSQAQrLysNCLP6q7JYcf7/Ok
         aFUocM03larPA2J+34+xjNPR6/851LQy4gMrCzTwZMZFhIsd7ZUmqNuWTtjBm7HOBv+D
         RlBCgjki0s3zzM3jgQkhxbmIEuY6q+OXLH6AUtvCQtN/Dny7YPMM9nvrUuWC/cTeYO4X
         FguQ==
X-Gm-Message-State: APjAAAVbkD/3NiM8/XOfMw3zmetrCc2kUrqCy2+2FX18Y1srUyvpfB+m
        Th/uUrJYKPBfBLcXS1bkZqRMIg==
X-Google-Smtp-Source: APXvYqwgsoHTTN2O/sjhKwhf6VnENZ+BBq9+zR+gMQ1rVj7IWWaM9XkzP/4I7WftaJ6UQlRAXrFYIg==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr3528237wmk.11.1569934765149;
        Tue, 01 Oct 2019 05:59:25 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id 3sm3561400wmo.22.2019.10.01.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 05:59:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 0/7] backlight: gpio: simplify the driver
Date:   Tue,  1 Oct 2019 14:58:30 +0200
Message-Id: <20191001125837.4472-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

While working on my other series related to gpio-backlight[1] I noticed
that we could simplify the driver if we made the only user of platform
data use GPIO lookups and device properties. This series tries to do
that.

The first patch adds all necessary data structures to ecovec24. Patch
2/7 unifies much of the code for both pdata and non-pdata cases. Patches
3-4/7 remove unused platform data fields. Last three patches contain
additional improvements for the GPIO backlight driver while we're already
modifying it.

I don't have access to this HW but hopefully this works. Only compile
tested.

[1] https://lkml.org/lkml/2019/6/25/900

v1 -> v2:
- rebased on top of v5.3-rc1 and adjusted to the recent changes from Andy
- added additional two patches with minor improvements

v2 -> v3:
- in patch 7/7: used initializers to set values for pdata and dev local vars

v3 -> v4:
- rebased on top of v5.4-rc1
- removed changes that are no longer relevant after commit ec665b756e6f
  ("backlight: gpio-backlight: Correct initial power state handling")
- added patch 7/7

Bartosz Golaszewski (7):
  backlight: gpio: remove unneeded include
  sh: ecovec24: add additional properties to the backlight device
  backlight: gpio: simplify the platform data handling
  sh: ecovec24: don't set unused fields in platform data
  backlight: gpio: remove unused fields from platform data
  backlight: gpio: use a helper variable for &pdev->dev
  backlight: gpio: pull gpio_backlight_initial_power_state() into probe

 arch/sh/boards/mach-ecovec24/setup.c         |  33 ++++--
 drivers/video/backlight/gpio_backlight.c     | 107 +++++--------------
 include/linux/platform_data/gpio_backlight.h |   3 -
 3 files changed, 52 insertions(+), 91 deletions(-)

-- 
2.23.0

