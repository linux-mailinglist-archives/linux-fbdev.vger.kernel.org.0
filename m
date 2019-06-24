Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0528051C50
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2019 22:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731688AbfFXUbV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jun 2019 16:31:21 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41935 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729857AbfFXUbV (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jun 2019 16:31:21 -0400
Received: by mail-pl1-f195.google.com with SMTP id m7so7515953pls.8
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jun 2019 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8eKR4sWGzU8LALqN+Rywpmmy+C9BMm/CB6qnIMC0UI=;
        b=OerfV0snZfWTKFe6g+LZSlNlk+hlaRZTYdkXi6xFzubIfsuYRqrR478es590r/uipG
         Za9cOfVOlS/Tx8biMdxBPavuRBtuFpD5DqsfSl4Frr5uGAgXHd9EfJPHv7PHPKGz5ykf
         Ha81o5GREDJwrbSfWGjsmCtO9Dqm7iWDvuM8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8eKR4sWGzU8LALqN+Rywpmmy+C9BMm/CB6qnIMC0UI=;
        b=GCqgd12UFhfjQsx1njon5YpNwoEHj3J2o6kCtIs3MEP/ner1Jg4FDrbtUfvheKZGRP
         HLMCCqFeG/UKrnklsYqCF29F06aRrR9PfHTa3v1Aa4tZGpzusHxco9/yoD2+XlulruGw
         tQAHkEh6pWaXpuv8cluH6VMb6slS3QKrR5EDK9JLFMyweSTmFmkHU7/tjWrEILKR95Gi
         CGnv0Q9Ra7P78ELmblXBsievCz5b2gtUzTnQlR4T0bU9+B5sbMpYK/CG4GQ9P9aWROBD
         Lcmp/7WXRpDPBSa9TOsY+w8h1SQlibYggRERE/2nOYWtInd+MG+CLz9z1Qhj3DcsZ6eq
         OAHw==
X-Gm-Message-State: APjAAAWeBVXUSNS4QMFZ2jNbLr/nAhIQqo9rOHzddFJmnfc/b7Xd3Chl
        br1sT7t8XN95C4uwuNN1CfffuQ==
X-Google-Smtp-Source: APXvYqzBKihWAttr4Rykcb5BT7S4M6tWgTs4LN43nmmOkYIKYPwMKpzMISvKirmoiIp5hny8kMFQzQ==
X-Received: by 2002:a17:902:d916:: with SMTP id c22mr20031582plz.195.1561408280395;
        Mon, 24 Jun 2019 13:31:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id u128sm15650127pfu.26.2019.06.24.13.31.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 13:31:19 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 0/4] backlight: Expose brightness curve type through sysfs
Date:   Mon, 24 Jun 2019 13:31:09 -0700
Message-Id: <20190624203114.93277-1-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Backlight brightness curves can have different shapes. The two main
types are linear and non-linear curves. The human eye doesn't
perceive linearly increasing/decreasing brightness as linear (see
also 88ba95bedb79 "backlight: pwm_bl: Compute brightness of LED
linearly to human eye"), hence many backlights use non-linear (often
logarithmic) brightness curves. The type of curve is currently opaque
to userspace, so userspace often relies on more or less reliable
heuristics (like the number of brightness levels) to decide whether
to treat a backlight device as linear or non-linear.

Export the type of the brightness curve via a new sysfs attribute.

Matthias Kaehlcke (4):
  MAINTAINERS: Add entry for stable backlight sysfs ABI documentation
  backlight: Expose brightness curve type through sysfs
  backlight: pwm_bl: Set scale type for CIE 1931 curves
  backlight: pwm_bl: Set scale type for brightness curves specified in
    the DT

 .../ABI/testing/sysfs-class-backlight         | 32 +++++++++++++++++
 MAINTAINERS                                   |  2 ++
 drivers/video/backlight/backlight.c           | 21 +++++++++++
 drivers/video/backlight/pwm_bl.c              | 35 ++++++++++++++++++-
 include/linux/backlight.h                     | 10 ++++++
 5 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-backlight

-- 
2.22.0.410.gd8fdbe21b5-goog

