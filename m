Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D703E725964
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Jun 2023 11:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbjFGJFS (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 7 Jun 2023 05:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbjFGJEm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 7 Jun 2023 05:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF4D210D
        for <linux-fbdev@vger.kernel.org>; Wed,  7 Jun 2023 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686128551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
        b=D8jLe4RTtmfGhAcEJxXjAFPx7HjW1vCUC0xw3TIAStKvl36v4DdnO6lLtAn3uwfqjeFSs7
        pUX2ZppUU/gdj50lNON9jlqEMFAkU2xNOgL849yENUDtB8mXiXC40FGwmslqB/55o2ITUu
        vn+nAPQ4jP2U7ZVVwdwvP8CxrBSw+4c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-7i0AebmUPBK5uVCqjMadog-1; Wed, 07 Jun 2023 05:02:30 -0400
X-MC-Unique: 7i0AebmUPBK5uVCqjMadog-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30ae9cf0178so3219133f8f.1
        for <linux-fbdev@vger.kernel.org>; Wed, 07 Jun 2023 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128549; x=1688720549;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1ensWxwtR1H9WH8H1jKCiwbKVNzMfKW0b7Yi6bDGCs=;
        b=Adq40oQS9sg8JHSViL7s48SskrZod5G2GMXH4bGSVY4uIZfqBNIw2qQRxl6Cnmq9/n
         uMT3Hlqe+INwhwPLMbeYp5MLUtzjz6YJngTK8O5FiFw6QNNoxQNaFxOslCBqQBLJ9ppO
         5vqJ9TjL1748nlFh6QrVR/wVHddQQ2+nLkbYSZsBTSV7FUmptuS9unpr49Cum19GWcLg
         90o81KYWoOiKI9r2bhMJoVC8YxBwaeBRB5iO11jmKaTiTvxbpsvyW0If9kHzPC0iz+pw
         2LNDcutAMUoMzKT/9CBhzEQQMuruWzRT+OnsuqEdL4hXAncj6c0YOULj+NBLtfLyrCil
         6Vkw==
X-Gm-Message-State: AC+VfDxD7zQ877c9/FWSL9EhAMIZSkkikP6sheqmuoHb1732n0h87jSX
        SS+nlqyY2iUlrYNFdptATrpkg/8NcugXpqy9K6bm9m7MZ5TONZRw0iMHj0ONE5Z5Nyp2HrPXE+S
        A9mONPfi2U1ucZvZNFyDVI5k=
X-Received: by 2002:a5d:5611:0:b0:30a:f030:8637 with SMTP id l17-20020a5d5611000000b0030af0308637mr3810371wrv.22.1686128549045;
        Wed, 07 Jun 2023 02:02:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tdzlumiDh+lcZSgp5sjiYX3gXCJJUKDHiUf2E4K2nudny411fzwbP2HTNQbZ/H/p4MQRLhw==
X-Received: by 2002:a5d:5611:0:b0:30a:f030:8637 with SMTP id l17-20020a5d5611000000b0030af0308637mr3810350wrv.22.1686128548788;
        Wed, 07 Jun 2023 02:02:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y4-20020a056000108400b0030e5da3e295sm449804wrw.65.2023.06.07.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:02:28 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Antonino Daplas <adaplas@gmail.com>
Subject: Re: [PATCH 15/30] fbdev/nvidiafb: Use hardware device as backlight
 parent
In-Reply-To: <20230605144812.15241-16-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-16-tzimmermann@suse.de>
Date:   Wed, 07 Jun 2023 11:02:27 +0200
Message-ID: <877csffxwc.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Antonino Daplas <adaplas@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

