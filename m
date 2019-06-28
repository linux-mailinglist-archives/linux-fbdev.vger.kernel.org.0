Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D81635980B
	for <lists+linux-fbdev@lfdr.de>; Fri, 28 Jun 2019 12:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfF1KDF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 28 Jun 2019 06:03:05 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55334 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfF1KDF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 28 Jun 2019 06:03:05 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so8492321wmj.5
        for <linux-fbdev@vger.kernel.org>; Fri, 28 Jun 2019 03:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkIKqohD1pWyDDJZwRAR+FLcGS0BmuKJrepunlcK85k=;
        b=wqzma/SfPs0SNGTJrk5pSZ/CDzjE4TIsL1pUirIMru6Dd+k6VggDOtK8vTsC1hGLBl
         LkxecZDEuCSeCquLFAOPUsgoDKzm5faSmD1FnVCT7mAIophBAoibWoibsUUid8aXk7z1
         ReoaPn8iXq3u3x4tzSeci7yYCYibuOp7i9fH0JjNnW3tsNULnII/S3nTg5NJTPxm6n+L
         XQCn7bneeug8DsDsEwH6nFbR7aM+12R56vcL/hhU8Afv3LItBO/gwcnghPvcETXmMDOX
         reWrBAZ8fCMca+WmYEPAZ1tOiCj8kYRTNDsyKdttCYERhyT/eh212yuCPYf61oXc6OCd
         SFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tkIKqohD1pWyDDJZwRAR+FLcGS0BmuKJrepunlcK85k=;
        b=QecZ+ZHZDwIluVBnRzpCdP43uFTMX8MOvFj6BmdbUVjtb9s/z7basulA4WOGIX+30y
         ipgADhMjFqbMKn10liOovlPtnoig4UeUeuLwj5E8h+sKeAKH3DMANhZVyeCqyb7u8zGy
         OFHc/1lT4Jb5v3Kj2f5YfJaojxq5Nk8dt2Gq48vxZgOByR8wJ2+lgHI5SOeYfaqu5J/N
         J6UXo76xxJvWAZ98wNWnw/ls5UJ1deEHT2I1JOqkW2ptF6xOieJ7ikkSCR3Ji+otTu9q
         IXsfJEKx9LPF9Y3ZTtJo05sbxYLXNC2JabLPvT8grhpKliit0+jLc418l+YJLzweCKbV
         5Wsg==
X-Gm-Message-State: APjAAAUvKwa0DHyxoc1PwPM+iwz3OlO9OhlzZiDH3EQi1/KhjbwhzaqO
        kMf1Gbxb24eG+XX0Ut0tVBQbLg==
X-Google-Smtp-Source: APXvYqwhcFL6tQPvDpqRgEZ6o9MP/TYJoYCPuvCjDURwYT5TSOIYtMdW/bnH9RbLDIM8UWBC5Gscrg==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr6526253wme.12.1561716183015;
        Fri, 28 Jun 2019 03:03:03 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id l124sm1628874wmf.36.2019.06.28.03.03.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 03:03:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH RFT 0/4] backlight: gpio: simplify the driver
Date:   Fri, 28 Jun 2019 12:02:49 +0200
Message-Id: <20190628100253.8385-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
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

The first patch sets up all the required structures in the board file,
the second modifies the backlight driver, the third and fourth remove
the leftovers.

This series depends on the three first patches from [1].

I don't have access to this HW but hopefully this works. Only compile
tested.

[1] https://lkml.org/lkml/2019/6/25/900

Bartosz Golaszewski (4):
  sh: ecovec24: add additional properties to the backlight device
  backlight: gpio: simplify the platform data handling
  sh: ecovec24: don't set unused fields in platform data
  backlight: gpio: remove unused fields from platform data

 arch/sh/boards/mach-ecovec24/setup.c         | 33 ++++++++++----
 drivers/video/backlight/gpio_backlight.c     | 46 ++++++--------------
 include/linux/platform_data/gpio_backlight.h |  3 --
 3 files changed, 38 insertions(+), 44 deletions(-)

-- 
2.21.0

