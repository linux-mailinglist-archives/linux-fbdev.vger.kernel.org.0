Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC1625065B1
	for <lists+linux-fbdev@lfdr.de>; Tue, 19 Apr 2022 09:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349302AbiDSHZN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 19 Apr 2022 03:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349300AbiDSHZM (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 19 Apr 2022 03:25:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C498232056
        for <linux-fbdev@vger.kernel.org>; Tue, 19 Apr 2022 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650352949;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XE7bs+vMucrnxP7rX6KAEFBKjoWlCkL1ofuWPanz4ws=;
        b=VWWHSkACKSlH6QF1wwznZPBKO1ESP8dUzv8GZCjxrTcVSAj/9z8HY0avsr+g5h+sLVjuri
        d9zABHs6VQZ72JSA95WGmUhV0Zkw08ZPA0LggyIk3+jQuoF7Az1dHZ4oT6MiGTKKrsEllT
        DfOhMfxCY+SyuIINF33fARkvi5ZJUys=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-0i09vS1vN5yA39DGKkreJg-1; Tue, 19 Apr 2022 03:22:27 -0400
X-MC-Unique: 0i09vS1vN5yA39DGKkreJg-1
Received: by mail-wm1-f72.google.com with SMTP id d6-20020a05600c34c600b0039296a2ac7cso807846wmq.1
        for <linux-fbdev@vger.kernel.org>; Tue, 19 Apr 2022 00:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XE7bs+vMucrnxP7rX6KAEFBKjoWlCkL1ofuWPanz4ws=;
        b=sZMyvdhyeBdDrKoerOaddL+zQ/VYY6EfGYjnmo1qpS0YDqGMNVEXlUeuPwghe80sNG
         LRLr22xiJcwlJQh70foYPfjc95RRfrZSbFhfbToTB6G91mcG9vQ1hWEr/UpRwfM0Umj7
         2gAIq1UIzdYFmuHx6XtX55ZmhSSHgDfA/yNxzvBmokNBn0FG3fmgKR9i1Va8UmgAAAgb
         VaGpFw39cQMo8YXgXat3ACJ0MkM2Bw+WCw+rEWhRm/ZKqknboRhkm24SeDen69NJCTGH
         HghuQj56surPUbDhyacNYIeoLGaGfYXwPmpU7fNXo3pvfgouxwcZ45VlfhnzboQ2CAQQ
         WLGw==
X-Gm-Message-State: AOAM532Qzhg/2u488fMZ+sEJN6OxN6ACshaqw0pMTOhqQnxzYdtqraFC
        0rQjgtxiTmeCSbQ9FLgFpSP5qp+pRvLXz+b5XisQIrdzprJU9d1cBfZbcmYYIxqJxm7+T9P0jLT
        3kWRQRFGeTWbPMzuiDDklers=
X-Received: by 2002:a05:6000:1b08:b0:207:ad5b:83a0 with SMTP id f8-20020a0560001b0800b00207ad5b83a0mr10619555wrz.564.1650352946330;
        Tue, 19 Apr 2022 00:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPE0Lfb8036FFd0ol7Vvhr6xWQ3rGpwS+oyiFhkfgu+5MXMGjFNhcWkb9aY1gomEOacxFDLg==
X-Received: by 2002:a05:6000:1b08:b0:207:ad5b:83a0 with SMTP id f8-20020a0560001b0800b00207ad5b83a0mr10619538wrz.564.1650352946065;
        Tue, 19 Apr 2022 00:22:26 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b0038eca3cdbb3sm15128816wmr.13.2022.04.19.00.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 00:22:25 -0700 (PDT)
Message-ID: <fb7b8ca6-a252-c021-fe74-4e7ffbb3eb7e@redhat.com>
Date:   Tue, 19 Apr 2022 09:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        frowand.list@gmail.com, deller@gmx.de,
        linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org, paulus@samba.org, mpe@ellerman.id.au,
        sam@ravnborg.org, linux@roeck-us.net
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
 <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
 <Ylb0316ABOhOe1Rb@phenom.ffwll.local>
 <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9d4599d9-e094-e7dd-5b91-282c2679aae4@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Thomas,

On 4/13/22 20:09, Thomas Zimmermann wrote:

[snip]

>>>> index bc6ed750e915..bdd00d381bbc 100644
>>>> --- a/drivers/video/fbdev/core/fbmem.c
>>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>>> @@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
>>>>   			 * If it's not a platform device, at least print a warning. A
>>>>   			 * fix would add code to remove the device from the system.
>>>>   			 */
>>>> -			if (!device) {
>>>> -				/* TODO: Represent each OF framebuffer as its own
>>>> -				 * device in the device hierarchy. For now, offb
>>>> -				 * doesn't have such a device, so unregister the
>>>> -				 * framebuffer as before without warning.
>>>> -				 */
>>>> -				do_unregister_framebuffer(registered_fb[i]);
>>>
>>> Maybe we could still keep this for a couple of releases but with a big
>>> warning that's not supported in case there are out-of-tree drivers out
>>> there that still do this ?
>>>
>>> Or at least a warning if the do_unregister_framebuffer() call is removed.
>>
>> Yeah dying while holding console_lock isn't fun, and not having a WARN_ON
>> + bail-out code pretty much forces bug reporters to do a bisect here to
>> give us something more than "machine dies at boot with no messages".
>>
>> I'd just outright keep the WARN_ON here for 1-2 years even to really make
>> sure we got all the bug reports, since often these older machines only
>> update onto LTS releases.
> 
> If that's what the consent is, I'll go with it.
> 
> I'm just not sure if we talk about the same problem. offb didn't have a 
> platform device, so we recently added this workaround with 'if 
> (!device)'.  All the other fbdev drivers have a platform device; and 
> anything else that could fail is out-of-tree. We don't really care about 
> those AFAIK.
>

Yes, agreed on the offb change but I'm not really sure if we don't care
about out-of-tree modules. I mean, you are right in theory but I still
feel that we are changing a core behavior without giving people time to
sort out if needed.

Since before commit 27599aacbaef ("fbdev: Hot-unplug firmware fb devices
on forced removal") registered FBs didn't need to have a device, but now
that will lead to a NULL pointer dereference in dev_is_platform(device).

And that change only landed in v5.18-rc1, so it is fairly recent.

I know that we follow https://www.kernel.org/doc/Documentation/process/stable-api-nonsense.rst
but still my opinion is that having a warning for a couple of releases
if registered_fb[i]->device is NULL, instead of just crashing would be
a better way to handle this.
 
> With offb converted, we could practically remove all of the checks here 
> and call platform_device_unregister() unconditionally.
>

Yes for mainline, but as mentioned I thought mostly about out-of-tree. If
folks agree that we shouldn't care about these, I'm Ok with that as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

