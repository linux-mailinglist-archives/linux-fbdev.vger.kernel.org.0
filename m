Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD9BB625724
	for <lists+linux-fbdev@lfdr.de>; Fri, 11 Nov 2022 10:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbiKKJoF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 11 Nov 2022 04:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233744AbiKKJno (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 11 Nov 2022 04:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA5871F03
        for <linux-fbdev@vger.kernel.org>; Fri, 11 Nov 2022 01:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668159765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UxbA0lbRcnNSHNC4p6nrgubCZPFh7F5q2151xPoT2H8=;
        b=Z/l+VfVmAbXEL38Nae6f1QpaANMrCNWq5YI2eRVjhjSDRu4EKTdfyzCMfBXwGzNrKAcNUl
        6h3NTBf+h0+ygPuQi4UO9B/NrZfxGBkaBBm2E8QmY4zZmjZzbCS2lhkxNrENnnA4xULkwY
        KXi79FBc9Awxv9YQqYd41nC5MqhspmQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-BRWSCAAnMo2mGioS0K0c5Q-1; Fri, 11 Nov 2022 04:42:43 -0500
X-MC-Unique: BRWSCAAnMo2mGioS0K0c5Q-1
Received: by mail-wm1-f72.google.com with SMTP id m17-20020a05600c3b1100b003cf9cc47da5so2316185wms.9
        for <linux-fbdev@vger.kernel.org>; Fri, 11 Nov 2022 01:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxbA0lbRcnNSHNC4p6nrgubCZPFh7F5q2151xPoT2H8=;
        b=l1dlLC8Ukf6D3sBJVOihxmcf3ZUY18UL9rcz3SBduKlRXH+jDevPJ6ePmL5ZRzIxm3
         E59jg3hD34pqT8Txi/4GCv/R7wVY0kjgjsV4hmleUneoLcNA/CeG05ZShcM2/H/rOHbl
         Ivfgx2sAjbTvR6NUz/lYHIUqp/qrUHJeDQVLCVrffx3m2Dyt0N8kGNu5k0xd7eTvLwC1
         eqGVQ8SUTRHVUqg5khhv/r3n3Fzugp8y7G4ou/Jf4KH/vXfAFEDHOVMPQjt5YhbBZfxm
         jOQtUnv34XU70Rb38batQSrJd5bhHNTuYv3l1HHfOMFsykRDX22BBofhduanpq2yZyiQ
         qLGg==
X-Gm-Message-State: ANoB5pk9/S+pT1w6HGZJs1QMnqO8s5ES8wQRRN9L57Epb5tDHsGE13dl
        rYekrr13uBw8rVuiWwRwoqAP2szP3Mf/9yAYoseGq0CV8zMlhv3O+BzgulyCZJKv0O3wd5nXU5o
        z1+NsJC9z1VIKXCuww+epiHY=
X-Received: by 2002:adf:f210:0:b0:236:63fa:c792 with SMTP id p16-20020adff210000000b0023663fac792mr732417wro.476.1668159762525;
        Fri, 11 Nov 2022 01:42:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5V7QI8/LMvTiTwHK5Kz3y2ZLNLe9qwbmLqWyIAmtlZPTWVFV2ZHifyIyKwGFP/WQxJjjCjlQ==
X-Received: by 2002:adf:f210:0:b0:236:63fa:c792 with SMTP id p16-20020adff210000000b0023663fac792mr732406wro.476.1668159762338;
        Fri, 11 Nov 2022 01:42:42 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j34-20020a05600c1c2200b003cf57329221sm8555745wms.14.2022.11.11.01.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 01:42:42 -0800 (PST)
Message-ID: <712ce623-6b44-8514-822f-91ab980240d3@redhat.com>
Date:   Fri, 11 Nov 2022 10:42:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221107104916.18733-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 11/7/22 11:49, Thomas Zimmermann wrote:
> Support the kernel's nomodeset parameter for all PCI-based fbdev
> drivers that use aperture helpers to remove other, hardware-agnostic
> graphics drivers.
> 
> The parameter is a simple way of using the firmware-provided scanout
> buffer if the hardware's native driver is broken. The same effect
> could be achieved with per-driver options, but the importance of the
> graphics output for many users makes a single, unified approach
> worthwhile.
> 
> With nomodeset specified, the fbdev driver module will not load. This
> unifies behavior with similar DRM drivers. In DRM helpers, modules
> first check the nomodeset parameter before registering the PCI
> driver. As fbdev has no such module helpers, we have to modify each
> driver individually.
> 
> The name 'nomodeset' is slightly misleading, but has been chosen for
> historical reasons. Several drivers implemented it before it became a
> general option for DRM. So keeping the existing name was preferred over
> introducing a new one.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Agreed that makes sense to have this in fbdev as well for consistency.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

