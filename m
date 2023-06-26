Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6A273E2BE
	for <lists+linux-fbdev@lfdr.de>; Mon, 26 Jun 2023 17:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbjFZPFY (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 26 Jun 2023 11:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjFZPFU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 26 Jun 2023 11:05:20 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E3F10CA
        for <linux-fbdev@vger.kernel.org>; Mon, 26 Jun 2023 08:05:19 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-313f04ff978so1150241f8f.3
        for <linux-fbdev@vger.kernel.org>; Mon, 26 Jun 2023 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687791917; x=1690383917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=348adPXQRKrKNTWGAwb9z5LOcOD3S5LIRa6IrQyqmGc=;
        b=BpdMkRqMxf6XEjAul5+0XQ4Uqv2kRvyAG7uM//NhkYVZS74eHBo+NlzGx6Km7k8dew
         blQILAw7fwJy27T2x3DKaUlmEQcDJRSCj8uKQURAmWzo7FGHZNgXP+PTFSBy3ViEwxDK
         bwUXavKKzBgmLv3XDq49ITl/dbsCckPuHheh1OyxNCa9H1yrYB1OubNaNBFQMYfXVyf9
         4jZ/Dp+NUWclfn5YkfLFegJDrQ6plDOZ1zLMYwpsVnYWM2AtacotDLe1spyxM2z0yHPk
         j0ZN67PMABHain93jKjzWnpDNib5oPHQXOXXsIpIXONZ9UFxlFj04vrTDLF/c98FZA07
         LqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687791917; x=1690383917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=348adPXQRKrKNTWGAwb9z5LOcOD3S5LIRa6IrQyqmGc=;
        b=d3B0ih+xkDO+W4bJN/d8JBJk+jtH6zdsWP0Udenf4Lg4LqGge8NUWyTNcMYOee/Ek6
         E9xtXwkasuuZwx2fhOnq4gu50KRq2JxGQbeHCSfCVVjYXUPll+Tc2fvGrbB9RVSMJVgO
         Sn8dCUer6keESKF0US2noVwgzEewqgwyjM1gonvP2/1iBbvzXwt4fjSOTxqyrhdpadN7
         Be7f/PPWRhXPLOImJtmvoJFziHke/+WvoD/Xp0UZBAE/FrsWcC5GjP+XKuyWxVDDJMs3
         4o0fiq7r7zYa39AD+/SKff2F0IiGkSN2UUsqIg1HudwIRetW2vxdKgaafQ8uNix5FL/E
         wcjg==
X-Gm-Message-State: AC+VfDwmP9Ns9bRKJy2zU6blqJr89FkrAGvAD1OqOeDAaMC+LogmgVnM
        Re7yetgRMkNWpWi0OHL+5l92+A==
X-Google-Smtp-Source: ACHHUZ5VYTqqVMy0dhtZ4hxs5N4mrJgTTvouyQr7HxLT3nJwXi1SuqaAezHLUswOmb65Bowi8io8Mg==
X-Received: by 2002:a5d:5960:0:b0:30f:c56c:b5b3 with SMTP id e32-20020a5d5960000000b0030fc56cb5b3mr8897292wri.4.1687791917522;
        Mon, 26 Jun 2023 08:05:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id e15-20020adfe7cf000000b0030fae360f14sm7644766wrn.68.2023.06.26.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 08:05:16 -0700 (PDT)
Date:   Mon, 26 Jun 2023 16:05:14 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-pwm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker applying
 initial PWM state
Message-ID: <20230626150514.GD95170@aspen.lan>
References: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jun 08, 2023 at 04:11:14PM +0200, Philipp Zabel wrote:
> The initial PWM state returned by pwm_init_state() has a duty cycle
> of 0 ns. To avoid backlight flicker when taking over an enabled
> display from the bootloader, skip the initial pwm_apply_state()
> and leave the PWM be until backlight_update_state() will apply the
> state with the desired brightness.

backlight_update_state() uses pwm_get_state() to update the PWM.

Without applying something that came from pwm_init_state() then
we will never adopt the reference values from pwm->args.


Daniel.
