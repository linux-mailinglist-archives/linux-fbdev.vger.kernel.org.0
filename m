Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB13F72DFD2
	for <lists+linux-fbdev@lfdr.de>; Tue, 13 Jun 2023 12:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240051AbjFMKkM (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 13 Jun 2023 06:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241033AbjFMKjm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 13 Jun 2023 06:39:42 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB06127
        for <linux-fbdev@vger.kernel.org>; Tue, 13 Jun 2023 03:39:40 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30fd128eebcso127927f8f.2
        for <linux-fbdev@vger.kernel.org>; Tue, 13 Jun 2023 03:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652779; x=1689244779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+0q/8B3X2O+bLieXF8c9g+8ohNwELNU1kRNH19cJQQ=;
        b=mp5t8BFsJLvB4B2RBPo6x6uNyPCi8jDPJJpT5/LpidCyzOQv4FCXKrMWr1ZoGeWb2S
         1dBOQjE7wNbB2/NIq8xC5IgXRwNRGlVnZW3Z4RXFfWXN3WDAjIuuNAySekfhnk34w5wO
         NzDIjtTF8SXSuX25qLMn3huo8p/83/zQMv/5E4FEAXUWYyMCx8Mo+LAzcn9buVVIEf25
         xq6WyCppmw0R4kg6OL44jDGiDE0u+RRVrPQ0ZksXnqIcz16sfbXTylvjE97DH2Pg1vn+
         u4HS9GU54OKGBiesVcpBbKbzyQtzvsmO+sXxWBrgzd+eRZlTzu8i2amAs2BDVfmzc8Gh
         L22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652779; x=1689244779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+0q/8B3X2O+bLieXF8c9g+8ohNwELNU1kRNH19cJQQ=;
        b=l6hix0n9/lc4Ua/JsKP6ZSHnkOwXH5/6zr58Y4ED7wsVL3PHQt+IetTgNRl/QRsogg
         pUMjRlS0VSFgGokWV3T4a/D0VLlW9RtLNtZuyZdfYh5dEkdndbOLO6uc07gOmbElBV//
         yMESMEEKQKMvIwsTKsOv9rkrpqDSidqdwzmBbt/c3GODsXHVMHm19qHJyC/CQ7zJNRW6
         S50lDhMb9Q7NrDaG0FWPgh4L4Me8RsfRlD8HGHKeh8+uJ/WWYTojEWbZ8Gseeos8nCHb
         NrCb9+6vUxRpjtULkOwIQSBobuDPqM/FnEJTXn2ArqR6GOPgdFQFVmaemeO6U9DDMFxH
         I4zw==
X-Gm-Message-State: AC+VfDzWUFGP3t43bpZxg7V1H0zDc2mW68wIR25B+KyFPPw3JD/UqHlJ
        DTgF8+bJBBqLyOZY931oCn6xHA==
X-Google-Smtp-Source: ACHHUZ4QXHWcQ+EF1TxBMcwYsV+sIp0eKcDzBEmcY5jt8MfrsM/QF7URk3vwRqxNRqLqrU6BbwKwDg==
X-Received: by 2002:a5d:508a:0:b0:30f:caf6:5bde with SMTP id a10-20020a5d508a000000b0030fcaf65bdemr1780025wrt.32.1686652779043;
        Tue, 13 Jun 2023 03:39:39 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d5482000000b0030fbc96bdffsm7123579wrv.25.2023.06.13.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 03:39:38 -0700 (PDT)
Date:   Tue, 13 Jun 2023 11:39:36 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org,
        deller@gmx.de, geert+renesas@glider.be, lee@kernel.org,
        jingoohan1@gmail.com, dan.carpenter@linaro.org,
        michael.j.ruhl@intel.com, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        stable@vger.kernel.org
Subject: Re: [PATCH v2 05/38] backlight/lv5207lp: Compare against struct
 fb_info.device
Message-ID: <20230613103936.GE169438@aspen.lan>
References: <20230612141352.29939-1-tzimmermann@suse.de>
 <20230612141352.29939-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-6-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Jun 12, 2023 at 04:07:43PM +0200, Thomas Zimmermann wrote:
> Struct lv5207lp_platform_data refers to a platform device within
> the Linux device hierarchy. The test in lv5207lp_backlight_check_fb()
> compares it against the fbdev device in struct fb_info.dev, which
> is different. Fix the test by comparing to struct fb_info.device.
>
> Fixes a bug in the backlight driver and prepares fbdev for making
> struct fb_info.dev optional.
>
> v2:
> 	* move renames into separate patch (Javier, Sam, Michael)
>
> Fixes: 82e5c40d88f9 ("backlight: Add Sanyo LV5207LP backlight driver")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: linux-sh@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v3.12+
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
