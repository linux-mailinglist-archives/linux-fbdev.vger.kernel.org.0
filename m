Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25674F7B62
	for <lists+linux-fbdev@lfdr.de>; Thu,  7 Apr 2022 11:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243704AbiDGJRw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 7 Apr 2022 05:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243706AbiDGJRv (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 7 Apr 2022 05:17:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BF941D557E
        for <linux-fbdev@vger.kernel.org>; Thu,  7 Apr 2022 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649322950;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CmxBb4M+/kdbgcE8GirSAAcAN2ciEIElRp8Y7WJjwMM=;
        b=Cf6+wb09S4d3vn0Kr/YiJVGuCixamPsRLhLrO90hRw1+vvbsN5ADfNfAK6xVMw+sdGeYzh
        zbf9u1S+vMuIXo0g6XOMXNUzZLXI5/0wFCT4hwEmzHK7GNGIvLZWStWYXb7M8QJfo/dfrk
        e8/Qh/4K9sT6gbxjB5ots5x5BgnuJVs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-fQ23iPYzNmKzltoSJh470Q-1; Thu, 07 Apr 2022 05:15:49 -0400
X-MC-Unique: fQ23iPYzNmKzltoSJh470Q-1
Received: by mail-wm1-f69.google.com with SMTP id 189-20020a1c02c6000000b0038e6c4c6472so4315924wmc.1
        for <linux-fbdev@vger.kernel.org>; Thu, 07 Apr 2022 02:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CmxBb4M+/kdbgcE8GirSAAcAN2ciEIElRp8Y7WJjwMM=;
        b=s7ecJjrn1f45qQPwItaXaZTrPBOnG05NWnPaIQYALNkcYteqeSf2Wv4zUe6eBv3Beo
         VxC1LJQ2QngtsIIQiCy91P6e/BbZ5pL1qzPXHdhUeTu7KCAQ7tBH9p5F8gv414ueoaiJ
         d9jMKOk5MrLYKU0v6iN/yjWEFeaR3A44MhvrMGhMKu/ORMN4p0oyIhsLwuyxNnJQcole
         Gra/yDc0fzmDK1Y3A2UeZJE9oticLlvnF6mt8M5qwsy07b+gL3afe+Vo9EjEi4ETlycu
         bIj2xYNB17GYk3E/24nDBkAzaIxoa9d81/o1C31yeX4VebJmBWnTbsLFfeq6UT8K7s7K
         hMVg==
X-Gm-Message-State: AOAM533tLmp8UsaRKuPwMUTbcOHs1vrGHqV3g4ktxNjAdHUl84IeWEIM
        5R4eKNT0yOZIRrGuewe9Qidqg+d/uTp7x90LQ2c1U+FJBirDS81ai/QROPvEhZqBio6xzVAF3HZ
        u2OTa/aB/cxVxeWqkRelGR6E=
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id c11-20020a05600c0a4b00b0037bea2b5583mr11418261wmq.139.1649322948601;
        Thu, 07 Apr 2022 02:15:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR+LYKbt9u3VokYFVPcbGSqCBhtUuOTFAakMiYXEbr6yt5DBwUZeDZJFTJ+SKPtiP285isGg==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id c11-20020a05600c0a4b00b0037bea2b5583mr11418242wmq.139.1649322948426;
        Thu, 07 Apr 2022 02:15:48 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id s10-20020adf978a000000b002060c258514sm11680472wrb.23.2022.04.07.02.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 02:15:48 -0700 (PDT)
Message-ID: <31932dda-bfd2-01ca-8ff4-9239ce0b0dd4@redhat.com>
Date:   Thu, 7 Apr 2022 11:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND RFC PATCH 4/5] fbdev: Fix some race conditions between
 fbmem and sysfb
Content-Language: en-US
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>,
        Xiyu Yang <xiyuyang19@fudan.edu.cn>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-fbdev@vger.kernel.org
References: <20220406213919.600294-1-javierm@redhat.com>
 <20220406213919.600294-5-javierm@redhat.com>
 <Yk6qwiP2kEh2M3Fm@phenom.ffwll.local>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Yk6qwiP2kEh2M3Fm@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 4/7/22 11:11, Daniel Vetter wrote:
> On Wed, Apr 06, 2022 at 11:39:18PM +0200, Javier Martinez Canillas wrote:

[snip]

> 
> Yeah it's disappointing, but no worse than the piles of hacks we have now.
> 
> With the bikesheds addressed above:
>

Agree with all your comments and will address in the next version.
 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks for reviewing these patches so quickly!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

