Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808862076A6
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2020 17:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404247AbgFXPFV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 24 Jun 2020 11:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404342AbgFXPEp (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 24 Jun 2020 11:04:45 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A051C061573
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:45 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 17so2865198wmo.1
        for <linux-fbdev@vger.kernel.org>; Wed, 24 Jun 2020 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZjEPJ8/mm+wq5v36TYnyxcBS/a58z/cHHdKeFkfsfDE=;
        b=zPM0JoTekc3JwBTNgIwFO0P3svCMqz6zlvJHpDXyqSoLZJPlvT/40LKl7KnfnXmcOt
         qzD/hMl0Xi1GGBucNTt7iR4B4Xu1v04fUHYnRuvCkawtPjRw8DidaYzoxiJu6TZLLrOr
         Z5F3E2NaRAqvya3W1eGzceaDjDFLn/S08pifh4nAlO3JVcKUm5EOTsr3xiIuocLLSsTd
         /xyUNzkGVlysC/Y0PAaGQhWXhrhlJgo3T0Y83UmpYsnTZd6zUE+GCCuRwdATo1kAt5nc
         NljRyk6f15Lt1rFcApUW2wX5Kdbn9BDptRox73TfhNF0TsdTMSIopA8pPN/+fwS71EaG
         SURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjEPJ8/mm+wq5v36TYnyxcBS/a58z/cHHdKeFkfsfDE=;
        b=FPdMUo4948SCZfuxJinkiePCyg9Y07jtm6i4M7pYPEcK5QWHbk1naRFqqHOnynu4Tg
         vpjv88G2aKhKZcM+V9Ce52NdAwroX9D6FsI16EjmoKPz5hfPU3v261ACkMOqG4UGEMVa
         8xy+HFfLp4PY+YjjYa9yuY1Q29H4PwT14E1tWw1LO83H+xdX9B1Y0zlZIdO4nouH/NGP
         4/KpXRN2h6qm5b1tdY3R4NMIMHrs+xZgGt47llI5o+8SiYrjiUfq9BGZSKENNSBLV4tN
         0xAHSwyzgmWzcoPkABp+u9H8mxiDjhJyhC+ZkuhuQFDX9r0lJIiPBPM8RCz2rqK2OS4/
         0XtA==
X-Gm-Message-State: AOAM5333rkaKzNavIUUgLFJlDtDQrDxZY/7DD0RyCG1GOpRuVV52SlXR
        HWrm8TvE+dqbb690fKk5FbjnaA==
X-Google-Smtp-Source: ABdhPJyBpq4p7XjDew8RzlYmMmVACRb7x1fhGgY5R/YmeMhjkFjmrwgSZSWjfeVp7THuMLPsMbh1fA==
X-Received: by 2002:a7b:c30a:: with SMTP id k10mr25791251wmj.44.1593011084237;
        Wed, 24 Jun 2020 08:04:44 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:04:43 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>, stable@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Software Engineering <sbabic@denx.de>
Subject: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc descriptions for CHECK_FREQ_REG() args
Date:   Wed, 24 Jun 2020 15:57:16 +0100
Message-Id: <20200624145721.2590327-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Kerneldoc syntax is used, but not complete.  Descriptions required.

Prevents warnings like:

 drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 's' not described in 'CHECK_FREQ_REG'
 drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 'x' not described in 'CHECK_FREQ_REG'

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Software Engineering <sbabic@denx.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/ili922x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index 9c5aa3fbb2842..8cb4b9d3c3bba 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -107,6 +107,8 @@
  *	lower frequency when the registers are read/written.
  *	The macro sets the frequency in the spi_transfer structure if
  *	the frequency exceeds the maximum value.
+ * @s: pointer to controller side proxy for an SPI slave device
+ * @x: pointer to the read/write buffer pair
  */
 #define CHECK_FREQ_REG(s, x)	\
 	do {			\
-- 
2.25.1

