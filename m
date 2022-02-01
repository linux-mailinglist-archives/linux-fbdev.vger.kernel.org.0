Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEEB94A567C
	for <lists+linux-fbdev@lfdr.de>; Tue,  1 Feb 2022 06:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234153AbiBAFVa (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 1 Feb 2022 00:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233713AbiBAFUn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 1 Feb 2022 00:20:43 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF62AC06176D
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 21:20:42 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id x52-20020a05683040b400b0059ea92202daso15145372ott.7
        for <linux-fbdev@vger.kernel.org>; Mon, 31 Jan 2022 21:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AxUIbjg3SvCLBVXCrv9jIsGx71GsTQ6qIWnsAt6VTbY=;
        b=BiSXSMEsNtBTkDinyXlJ67kpwdj31ar6lPoZA/5iikJbtUTbyv+x8iSa7vv7ZCPYq6
         R7Nv0ANSJk6YgAKMwKENalGwcFVeYxJ7V2bekO9F5h1eAxArRCkEJ+lG56yEr9XWpOxd
         j2UrqPc78k5N69ULMd+CcgKOfYHmCINMvzaZAjVplmKnLYhCFakcrm4CQledQ5fmW064
         2J0OepZDuPZHszaOu2m/zgWix3+PDZZGPT2LMzNHLZVSXKE7Jp/jdpgT+cVMmsIampR7
         hre70NoxFVAjnX75mUVPc1J863wP7tru5EaM0vZP9LKpUoOAE8n6/QQyI2vekIi4LFOB
         I8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AxUIbjg3SvCLBVXCrv9jIsGx71GsTQ6qIWnsAt6VTbY=;
        b=lhMQ+4Qebi4hDBvvq+1h6psFLWewTDj4wNDTtUEaEp4mKYZKUDIJ3HhsaPGr3lW9en
         U8rpONYUNsYBxYs9jd39Z10D8wWPCsaHysz7puqV9j5Lg64J/7f899rJweCxRF6/kxUM
         j0dBKGpWlpDOf2gHnyWihRwvjx1pXUISVVsZkbJyehdfYZr6rdSfgUDFcm59QCaRJM3M
         5ztfnb/xoVYDsnPmlhXa+N0IpmMiTNPjxZ5bjVNgm/Tt/UC89R/PXyHbqFNcK8j+sVvb
         FYX6ID8vFtCcuDfhZNwFRJJr+lFk3fJISRdo1t9X8IMaCg+5fHgtEsAzIIHqiSCEiBmU
         S34Q==
X-Gm-Message-State: AOAM530OS627sux73YRt4Y+PS9yzdPlYNhgTS6mPbKl6bARnJBnRHsBY
        I+Ni5AXhQO6RUKpFWYe+G8sykA==
X-Google-Smtp-Source: ABdhPJz7xSZzfdlELJEKFP+8VoUH7pamHFIqMvwPRNtJNI8E/x0hnVAHOllmRicnrMtz2Q1gMZswNw==
X-Received: by 2002:a05:6830:1084:: with SMTP id y4mr9564994oto.42.1643692842301;
        Mon, 31 Jan 2022 21:20:42 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:41 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-fbdev@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: (subset) [PATCH 0/4] Enable display backlight on Fairphone 4
Date:   Mon, 31 Jan 2022 23:19:51 -0600
Message-Id: <164369277344.3095904.11289204126111973872.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229170358.2457006-1-luca.weiss@fairphone.com>
References: <20211229170358.2457006-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 29 Dec 2021 18:03:54 +0100, Luca Weiss wrote:
> Add and enable PM6150L wled which is used for controlling the display
> backlight on Fairphone 4.
> 
> This series depends on the recent wled series by Marijn Suijten,
> currently applied in the for-backlight-next branch of
> kernel/git/lee/backlight.git (or linux-next).
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: pm6150l: Add wled node
      commit: fe508ced49dd51a700c0f9ec7826d523cfe621b2
[4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED
      commit: 7a52967d9050f3e430373bc51c56865b49a38573

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
