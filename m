Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37B9746B6D
	for <lists+linux-fbdev@lfdr.de>; Tue,  4 Jul 2023 10:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbjGDIGD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 4 Jul 2023 04:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbjGDIF4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 4 Jul 2023 04:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FB61AA
        for <linux-fbdev@vger.kernel.org>; Tue,  4 Jul 2023 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688457907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CTuEnIm0LwkFV691/tfimgfAx52uWY02fSVIZdeEfLg=;
        b=XqD9/0vo1OW2kFVNQ+eXIMjqgo1RbET/Dt5cz7UiWB1tnc1O0H0o+CCpAYPrpkpcE4idsF
        hgPeEhZvv5wvjpfOz+JpZHoSAsmNdZq/wqlvyu7mWVEB1GYoTmwgPUib7W9lxtS6kM/st6
        P6rPkdrnLU8hidPDCYNhqNVmpAnl9C4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-21USRVKzPPG2xVq4RmWH7A-1; Tue, 04 Jul 2023 04:05:06 -0400
X-MC-Unique: 21USRVKzPPG2xVq4RmWH7A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fb8284465aso37261455e9.2
        for <linux-fbdev@vger.kernel.org>; Tue, 04 Jul 2023 01:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457905; x=1691049905;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTuEnIm0LwkFV691/tfimgfAx52uWY02fSVIZdeEfLg=;
        b=OQdCRWwGEXHe2jcUOR0YfiT/g8L+eXAOFsmDYWp5n6SDnsEpXzM3slxnLmfG7MC0cp
         0WrbjNFPNCpYmZOtBlaP31xQvITRouWNfiy+1GYEl4ngXsM0Zsrswg4WY/S4P6rTyuu5
         rgXJMkX45uGZ9xK3XkC85OfzE5tunVHfOBB4HZ5++NScE8P5ldQ/8gK69pIAcSH2a1az
         3LNXX/hLV2Ixkgq3w1P8pn4ekNJoy9M4rPspPaJrPmag0cMIbTZvXdllasxKQ5GqXwWU
         EiuGF3FGzKIqIIwyTnePWD4/eKhexxdeY5cs/svlvKmZUPValDN0keL3GFj7TF5DwweX
         CFbQ==
X-Gm-Message-State: ABy/qLbFr9V3MVE0su924B5gQ/o3TXBhmU4QsTAQnDv+GYXwZHU5Mp5p
        4FVngn8tEDCZpvV4lUnW638IgwAsIhC7/+y8tLWq0GffHgkE4roEPqGijAxFf4avD3O/OZhet36
        ZukjvEFJEUZuW+4mFPKEuV0w=
X-Received: by 2002:a7b:cb94:0:b0:3fb:dbd0:a7e7 with SMTP id m20-20020a7bcb94000000b003fbdbd0a7e7mr3685538wmi.39.1688457905615;
        Tue, 04 Jul 2023 01:05:05 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHI1PUQgJKT44QoZAhMaiwf05ugYH5PcKVDgVeHbws97u9pvTMta/zCZ7DBU3JO67JzvQLBvw==
X-Received: by 2002:a7b:cb94:0:b0:3fb:dbd0:a7e7 with SMTP id m20-20020a7bcb94000000b003fbdbd0a7e7mr3685519wmi.39.1688457905334;
        Tue, 04 Jul 2023 01:05:05 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n10-20020a1c720a000000b003fa96620b23sm24406458wmc.12.2023.07.04.01.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 01:05:05 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-kernel@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helge Deller <deller@gmx.de>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 1/5] video: Add auxiliary display drivers to Graphics
 support menu
In-Reply-To: <CAMuHMdVBkV30X32UWdV5k_PSJfeOF-a5=eCBo_3N2265w+n1hA@mail.gmail.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-2-javierm@redhat.com>
 <CAMuHMdXRg1OUy6UHuH4H+qkK-qO+jTKdVoG_SRM3q_PkyD+Bbw@mail.gmail.com>
 <87h6qkyuv4.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVBkV30X32UWdV5k_PSJfeOF-a5=eCBo_3N2265w+n1hA@mail.gmail.com>
Date:   Tue, 04 Jul 2023 10:05:04 +0200
Message-ID: <878rbwyudr.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,

[...]

>> > This is inside the "if HAS_IOMEM" section, while there was no
>> > such limitation before.
>> >
>>
>> Gah, I missed that. Thanks a lot for pointing it out.
>>
>> If I move the source outside of the if block, are you OK with this patch?
>>
>> I think Thomas is correct and would make sense to put the character-based
>> drivers next to the DRM and fbdev drivers since all these are for display.
>
> Yes, makes sense to me.
>

Good to know. Thanks!

> Gr{oetje,eeting}s,

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

