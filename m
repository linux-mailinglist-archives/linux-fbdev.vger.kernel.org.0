Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC858207686
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2020 17:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404124AbgFXPEm (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jun 2020 11:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403833AbgFXPEl (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jun 2020 11:04:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7855EC061573
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:41 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z13so2631582wrw.5
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+GecQ66rmlEvjIvJ7QJtrKlUl0uFGquQecFmVEnG3vQ=;
        b=ggqKLpgIV8maJfSM69W3D1mszs39U+1t28FTlwnkcd84c+gIgGoPdF7HRsq/DM1jMk
         9gqacJBySBP6gXjN151KeET3e+g/ISEwOAe2QvBA2VVsTUgmpGFsUvJcaS0zCbpK8PpK
         M+aW26fbiPFWEyMUqUmXFNJBEcnnX65jccbSs+sWKgE2FztQ4DtJkHSHVvLRRa0xOXG3
         2iYC8lTFzIXBIq6hePP2rZUhhcMAg/AbI9WcyH3NGJwRc/cwRffpnHne6STLhq0zy8Ca
         B6tEj8wsr44ipYX9tEeaSJHZZci9T/rJQqKuCropA5cvL9bD0AGezcuGfPHafWHBXfd/
         BZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+GecQ66rmlEvjIvJ7QJtrKlUl0uFGquQecFmVEnG3vQ=;
        b=OPQX/a6J0WdRc0NxCZ5sidHKz6KiUo18oQYRQItz49fQAu8oih1GCEFYkQ+ZwBx18N
         xoTCwxGi3m5RvktTbmIKNChFC2V/LHy1br5GcMHlaIZL6fQOM8lnJHJ4pE4Ti9UNuDPJ
         V9DIe7TLN5SHVMFQpYrUp6M/xFgrpn2SZhPtE/Su1uKQc7Jl7i7z7YWTXR6p2z7WPVlf
         oTyO2l0BXvoXx7mOow917F7KiK/zWW29FzkkLkLjisT6N9OuJAvqNwihfzU+zaNH8U5A
         MnOqZiTyJKfmMjSMOheNjaHcvjYf4Esf3jJdz4GHQNeXXEYKIPoA2u3QySd8dISJm8xI
         Emzg==
X-Gm-Message-State: AOAM532La2ZgBc7rv2b9BFe6DoCm5MmNUVNcBWifi0j6OIDS/6R4jAD2
        /XcxDKY7NjN2neTiqn2k/t8dKg==
X-Google-Smtp-Source: ABdhPJwlPY1Prth3NQ7J8sQFtWPaPtlNsxgKb6muWk22U+5w0GKI8UWdfsvMJUKmL/9pxgQ4mmDiXg==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr31187536wrw.223.1593011080131;
        Wed, 24 Jun 2020 08:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:04:39 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 0/8] Fix a bunch of W=1 warnings in Backlight
Date:   Wed, 24 Jun 2020 15:57:13 +0100
Message-Id: <20200624145721.2590327-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Attempting to clean-up W=1 kernel builds, which are currently
overwhelmingly riddled with niggly little warnings.

Lee Jones (8):
  backlight: lms501kf03: Remove unused const variables
  backlight: lcd: Add missing kerneldoc entry for 'struct device parent'
  backlight: ili922x: Add missing kerneldoc descriptions for
    CHECK_FREQ_REG() args
  backlight: ili922x: Remove invalid use of kerneldoc syntax
  backlight: ili922x: Add missing kerneldoc description for
    ili922x_reg_dump()'s arg
  backlight: backlight: Supply description for function args in existing
    Kerneldocs
  backlight: lm3630a_bl: Remove invalid checks for unsigned int < 0
  backlight: qcom-wled: Remove unused configs for LED3 and LED4

 drivers/video/backlight/backlight.c  | 2 ++
 drivers/video/backlight/ili922x.c    | 8 ++++++--
 drivers/video/backlight/lcd.c        | 1 +
 drivers/video/backlight/lm3630a_bl.c | 4 ++--
 drivers/video/backlight/lms501kf03.c | 8 --------
 drivers/video/backlight/qcom-wled.c  | 8 --------
 6 files changed, 11 insertions(+), 20 deletions(-)

-- 
2.25.1

