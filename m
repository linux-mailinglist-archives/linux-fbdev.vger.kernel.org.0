Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 518427917D4
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Sep 2023 15:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240675AbjIDNLA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 4 Sep 2023 09:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjIDNK7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 4 Sep 2023 09:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A390BF
        for <linux-fbdev@vger.kernel.org>; Mon,  4 Sep 2023 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693833011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=N/mSHv5PMuG3bI81Fi8Qqn5MlLsevMB4uVfb4i+YDH0=;
        b=C4tJGItN/UauhqaXpI2ukzVQAh0x4+kiSoXLWdi8vIbKc7c9POFdrl9CgXY62yTsM3SGY8
        qsqXKQ63CRmNXBh2HKHBqo5YYs/gIpIQUZh1+F0AWv5WkNcojEV+JB8j+DspXKwNXYHYyg
        SIXz2OyL1VV9WQJ+FvNOou5aMjkWovo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-5kqQnXinOfaTXhVXg2YehQ-1; Mon, 04 Sep 2023 09:10:10 -0400
X-MC-Unique: 5kqQnXinOfaTXhVXg2YehQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-401db2550e0so10461535e9.1
        for <linux-fbdev@vger.kernel.org>; Mon, 04 Sep 2023 06:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693833009; x=1694437809;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/mSHv5PMuG3bI81Fi8Qqn5MlLsevMB4uVfb4i+YDH0=;
        b=fXEDLr5kbOfsZ4zspXtkqeHKBn3DFudq6PezHGmwp/WnWwQzgFE0rg3bGfG2YG58td
         3wYiFMqG4D8NqxK3t4gJZPxKm/cqc/LFmFbZ/MKal1Tr/Sk/Y8VY/YFWStcvUj+ONnzh
         h01VQRBZfv6NRpLu3pO+NPCJo2iJyr8NpovDeDYyZMDh7gJ/5yHFGPVondhEnqOm3cRY
         zThJWz5YBSc4snsglIHzmIV1WcCNybh7zwvTBmW9vczUbVXWXZdNCpruBiyT9htN73YV
         FX4aMNPj45TFiHhAmkY55bc72pr2B0uzYWtqZi4doyGxZvTPimTJbdB79JVPAcCzd0jq
         mf4w==
X-Gm-Message-State: AOJu0YzxT5ndDFiMG3LRt7jAy3XP3MiRygiAW+hdApHXoWKpnY4XCYBP
        nFkouynlDwBYtk0u8ivg6cpcdYNJM2b5bOudlkurvDOjsD6d93zB5O2bPXiVWi3Z+UkfTmjOLsp
        4eCELkiNv2xVtC1/vioRflIU=
X-Received: by 2002:adf:ef8b:0:b0:30f:c5b1:23ef with SMTP id d11-20020adfef8b000000b0030fc5b123efmr7031993wro.41.1693833009063;
        Mon, 04 Sep 2023 06:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9JbWJdgeGtQs+F3OoOwIvoZMV5mY5Ox6E+5wzrokFqlNDGFgExFwmjqyHm8xhQbFKERp1rA==
X-Received: by 2002:adf:ef8b:0:b0:30f:c5b1:23ef with SMTP id d11-20020adfef8b000000b0030fc5b123efmr7031980wro.41.1693833008804;
        Mon, 04 Sep 2023 06:10:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id r5-20020a5d4985000000b00319779ee691sm14461672wrq.28.2023.09.04.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 06:10:08 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
        daniel@ffwll.ch, sam@ravnborg.org
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
        linux-input@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] fbdev: Add Kconfig macro FB_IOMEM_HELPERS_DEFERRED
In-Reply-To: <20230828132131.29295-4-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-4-tzimmermann@suse.de>
Date:   Mon, 04 Sep 2023 15:10:07 +0200
Message-ID: <87il8qcceo.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The new Kconfig macro FB_IOMEM_HELPERS_DEFERRED selects fbdev's
> helpers for device I/O memory and deferred I/O. Drivers should
> use it if they perform damage updates on device I/O memory.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

