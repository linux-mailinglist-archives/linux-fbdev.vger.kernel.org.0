Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF4F87271B1
	for <lists+linux-fbdev@lfdr.de>; Thu,  8 Jun 2023 00:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjFGWaG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 7 Jun 2023 18:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbjFGW34 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Wed, 7 Jun 2023 18:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40FC2703
        for <linux-fbdev@vger.kernel.org>; Wed,  7 Jun 2023 15:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686176918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=irRG2hn1Ih/d+vMuj88e+Lh/5vC/wBK+G/U1UA7S7zo=;
        b=UPwoq8Jw6iEHtz6qkm97dSgQfa62gP7WEXEAtlqbqG6iyTKDeoDK2+ajhttO4rr6TLSH12
        JuC5BldX/k4l6Ymc0YIk0BA1ODLMqQFybFtttyGF1ODk0084ODjhCJ2vObNxUHlNT4xxmI
        HWFsHy8FQHBX2mXUMfXCvbVfUVil+JU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-9G6kZG8OO5OaWR6yGA7VuA-1; Wed, 07 Jun 2023 18:28:37 -0400
X-MC-Unique: 9G6kZG8OO5OaWR6yGA7VuA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30b88392ac6so4318820f8f.0
        for <linux-fbdev@vger.kernel.org>; Wed, 07 Jun 2023 15:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686176916; x=1688768916;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irRG2hn1Ih/d+vMuj88e+Lh/5vC/wBK+G/U1UA7S7zo=;
        b=QzvpGcHd5BKtFpILxXjumNnFa5WFRaV0YqDK5rHRL7n8Y1kXAlFWRvj8kQeA2V5Lg/
         c7WeOH8BPKm9bTlU15Of6OfcyfDbNQTWrMSEf5FNtzSv+Ivn6cbTIWp51n6TFUdXwin2
         EUjnsRAQKjHmy4XC6PsrKrjyGgCRD0FoH0fq3vAfVROw9Edpr45H52ttl2rKnzoDIdeC
         jANjaNg1YVNCca68fYmp5z2iY6cTvGmv61mXFNW9mJbg56huy2DiVWn9qaR4vfIEm1DN
         QvaOEolgvHPaBdTpImXfEjsItee+RBmnv0pJRByucTlSCyCoRD37PKA0F0hrU+5ezi7h
         Dcqw==
X-Gm-Message-State: AC+VfDx5EWV3YE9QTH/eXnq7ms1AWqw4DlN6xNx5igJh3k5GrhZ97Z4b
        nfC5E6WXhCyAWCYE0loGTyQNS5dBkWRJ3AXZAUjDVN3BWoBj4Oek8QP0N+xeteLeWZp+aMjfMFv
        T7EV5mTqo/ZTWLKxx1jYJYV0=
X-Received: by 2002:a5d:650e:0:b0:307:9da1:c9d8 with SMTP id x14-20020a5d650e000000b003079da1c9d8mr4923761wru.4.1686176916352;
        Wed, 07 Jun 2023 15:28:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61tYV/VqxAjAws580IyjPbyEEBH7wxqnNFkzkRRkVd9vumKgbQUzpT98wO/2M3vhdVG8VhKw==
X-Received: by 2002:a5d:650e:0:b0:307:9da1:c9d8 with SMTP id x14-20020a5d650e000000b003079da1c9d8mr4923745wru.4.1686176916109;
        Wed, 07 Jun 2023 15:28:36 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v25-20020a1cf719000000b003f736735424sm3323437wmh.43.2023.06.07.15.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 15:28:35 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
        sam@ravnborg.org, deller@gmx.de, geert+renesas@glider.be,
        lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 28/30] fbdev/core: Move file-I/O code into separate file
In-Reply-To: <20230605144812.15241-29-tzimmermann@suse.de>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-29-tzimmermann@suse.de>
Date:   Thu, 08 Jun 2023 00:28:35 +0200
Message-ID: <877cseewks.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Move fbdev's file-I/O code into a separate file and contain it in
> init and cleanup helpers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +
> +#include <linux/console.h>

#include <linux/compat.h> here, the robot complained about:

   drivers/video/fbdev/core/fb_devfs.c:183:9: error: unknown type name 'compat_caddr_t'

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

