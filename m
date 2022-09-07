Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5ABE5B0364
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Sep 2022 13:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiIGLww (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 7 Sep 2022 07:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiIGLwv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 7 Sep 2022 07:52:51 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5E16CF43
        for <linux-fbdev@vger.kernel.org>; Wed,  7 Sep 2022 04:52:50 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id q7so22033738lfu.5
        for <linux-fbdev@vger.kernel.org>; Wed, 07 Sep 2022 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Q9TkKT3+r01vVZzm+xYD0OiOoUb1Biq2Sme618hwY2k=;
        b=E2WS1W4kTl+lKYjh0LzH3Iv0PROxOKPqSSBUCjc6Ru0c/oRl2CwyXEESKCujDzMVZ4
         vofTbLuMOSJy3uTdgF2dvEfMG3R4J8paHgPsRFJC3Q/RZLqojQAFvSoQ1kFcQZZeYW33
         CKHo+Cl2RMBm/Fr4CFOfRQVW2doulrmXVYUgBIcAheY7NGPH+Rf095FHhf2kpfkbnjUf
         emrsva18+hWuKfGqoEbqx5H3ec599rqRpxPytLgk12j69+ayiuTv8mtICSQmLOH3/r+2
         iUYfbydwCc/0HQk6f5/SAfFZB8u7IF6qVBy+n3AL+qqxjmvZvDJHlKjK/7NWMId5I2dx
         fyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Q9TkKT3+r01vVZzm+xYD0OiOoUb1Biq2Sme618hwY2k=;
        b=vddg1DxuoUM0eQB2af9au87DERDP65C6Cu62qPtwtSN7aLbdxE5uEBXi0s7I00JABA
         hy3GD8EpuH8beDTfzV+NLmSfl51oxJHNvPpK1rC3w/dFKxhe8FF0zIWfoZ5fyVoZA3NA
         6Q+4ntXxdtaEcF7DQp1aXMcqYV3rgILl7KwachcPaZUiDgq+y216LE5TsL1errTdB8++
         Ztpas6kTqAUlpykI0PTjXM/12UUbAwR7v3pfRcsxx4WMLJRwJPkBOOOJ4VrfVpD+CeGd
         Gk6/MDxp1IIuBvOgM+45PJp7tJjxLHlDyGnGD38oR4xSPR5kjuNb7kJTqsfA8rgFHjDO
         VqDg==
X-Gm-Message-State: ACgBeo3CBFsIeZ/SiMj9tNEBGghIhFojSAkRV6yaf1iAnx6IHJEteu3K
        yYIPYl1LdhYT/B8rAugT+iGhAQ==
X-Google-Smtp-Source: AA6agR7gpVa5DIQ2h+vqaTkyvVoEIuRThZItL25KMOVg6jlA6fNSzQ7YUJDL6/meWk9lWYJT9jLdhA==
X-Received: by 2002:a19:5602:0:b0:496:443d:f044 with SMTP id k2-20020a195602000000b00496443df044mr1069081lfb.313.1662551568497;
        Wed, 07 Sep 2022 04:52:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b004947a12232bsm2383321lfv.275.2022.09.07.04.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 04:52:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     broonie@kernel.org, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, airlied@linux.ie,
        linux-samsung-soc@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, hdegoede@redhat.com,
        daniel.lezcano@linaro.org, lee@kernel.org, cw00.choi@samsung.com
Cc:     bzolnier@gmail.com
Subject: Re: (subset) [PATCH 2/3] MAINTAINERS: pwm-fan: Drop Bartlomiej Zolnierkiewicz
Date:   Wed,  7 Sep 2022 13:52:41 +0200
Message-Id: <166255155747.50111.5480583055849352151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808101526.46556-2-krzysztof.kozlowski@linaro.org>
References: <20220808101526.46556-1-krzysztof.kozlowski@linaro.org> <20220808101526.46556-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, 8 Aug 2022 13:15:25 +0300, Krzysztof Kozlowski wrote:
> Bartlomiej's Samsung email address is not working since around last
> year and there was no follow up patch take over of the drivers, so drop
> the email from maintainers.
> 
> 

Applied, thanks!

[2/3] MAINTAINERS: pwm-fan: Drop Bartlomiej Zolnierkiewicz
      https://git.kernel.org/krzk/linux/c/1f88d1e5f9e5d965c2208edc2c757eaff8960bca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
