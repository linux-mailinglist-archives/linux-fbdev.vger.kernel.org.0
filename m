Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 625934AA01B
	for <lists+linux-fbdev@lfdr.de>; Fri,  4 Feb 2022 20:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbiBDTbn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 4 Feb 2022 14:31:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29733 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233868AbiBDTbn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 4 Feb 2022 14:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644003102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XB7EqmHX3QJchDoebIRUn45wKZyDtzMRU7LbvShZrmI=;
        b=BzGoiEmZpEMz7tZOUWNbbNcixiAyjk538Xryzk3cjfVLhq/JxZ/E7KfWcxai2MF4gLvfZP
        xkB3NM1u2Ggp6KzC6xTgYeob/nhNEbxjr44t1YDOb2Z6eb8tzj/NSef0bVCIgLRIprwS6k
        ScjsP18kjtTZcv4785pHwGqa2GdlUCI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-3MX4Fr51P52pNl-BQcIFCg-1; Fri, 04 Feb 2022 14:31:39 -0500
X-MC-Unique: 3MX4Fr51P52pNl-BQcIFCg-1
Received: by mail-wr1-f72.google.com with SMTP id d25-20020adf9b99000000b001e298eecb85so2331479wrc.19
        for <linux-fbdev@vger.kernel.org>; Fri, 04 Feb 2022 11:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XB7EqmHX3QJchDoebIRUn45wKZyDtzMRU7LbvShZrmI=;
        b=DbI+0dyJEH24Sq3+vo5UTSXnDjU8ln+jDcz7Eavx+IlF7zut4IEhCShOsGTeHSBWXi
         4CySIYZnWw9jHgQptubkWoebjFadpJhExLDsKDjdmHriLFQfb0mQwcIJhKI+U46VrDUR
         2VN09dItstR5fSeLVAfI4nd9+rEDv4eqELKnTUSKu9URpji9dWdwubS2/QWYmC3QZX2a
         zWFNUr7du6z92eMVwhJQbrHDfvPw8dsoeCB3QLkndwz+qjZbhEIdTACfwV6Z3g/cQ20f
         pi5PVD9fWt2lqmhR6oA6FQO601V7SWaVilhF1Ps4hJY4t1BzLLC9aqqLmzqy5ArGHOD4
         4RAw==
X-Gm-Message-State: AOAM533I+w0CLPHHvJZh1k5z0jiqG9qk8dpFCSVKChmKW4pJiocdPjHJ
        RPnkQiy5sSuOYxgj8ZCXAr9MDPu15s8F4Gid9T1uy1CgD1+PqnCUvAP5evqv88PDVSanbbJsNBk
        /62GXKYgLMsW6H2NvPLW6ixw=
X-Received: by 2002:a05:600c:308:: with SMTP id q8mr227579wmd.118.1644003098413;
        Fri, 04 Feb 2022 11:31:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnUrl7L5DUkWi88NA0XDtQhKrbGlFf75d9R565igNT1eWA/BV6uT/4ED51bA6rarcBe+VNVg==
X-Received: by 2002:a05:600c:308:: with SMTP id q8mr227567wmd.118.1644003098213;
        Fri, 04 Feb 2022 11:31:38 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y14sm3081929wrd.91.2022.02.04.11.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 11:31:37 -0800 (PST)
Message-ID: <b388f295-920a-b4fc-41ef-d090bdcd69e2@redhat.com>
Date:   Fri, 4 Feb 2022 20:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] drm/format-helper: Add
 drm_fb_{xrgb8888,gray8}_to_mono_reversed()
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org,
        =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-2-javierm@redhat.com>
 <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <47100413-db63-1efa-45e9-028dfc430b7e@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Thomas,

Thanks a lot for your feedback.

On 2/4/22 16:52, Thomas Zimmermann wrote:

[snip]

>> +static void drm_fb_gray8_to_mono_reversed_line(u8 *dst, const u8 *src, size_t pixels)
>> +{
>> +	unsigned int xb, i;
>> +
>> +	for (xb = 0; xb < pixels / 8; xb++) {
> 
> In practice, all mode widths are multiples of 8 because VGA mandated it. 
> So it's ok-ish to assume this here. You should probably at least print a 
> warning somewhere if (pixels % 8 != 0)
>

Agreed.
 
[snip]

>> + * DRM doesn't have native monochrome or grayscale support.
>> + * Such drivers can announce the commonly supported XR24 format to userspace
>> + * and use drm_fb_xrgb8888_to_gray8() to convert to grayscale and then this
>> + * helper function to convert to the native format.
>> + */
>> +void drm_fb_gray8_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
>> +				   const struct drm_rect *clip)
> 
> There's a bug here. You want to pass in a drm_framebuffer as fourth 
> argument.
>
>> +{
>> +
>> +	size_t height = drm_rect_height(clip);
>> +	size_t width = drm_rect_width(clip);
>> +	unsigned int y;
>> +	const u8 *gray8 = src;
>> +	u8 *mono = dst;
>> +
>> +	if (!dst_pitch)
>> +		dst_pitch = width;
> 
> The dst_pitch is given in bytes. You have to device by 8. Here would be 
> a good place to warn if (width % 8 != 0).
>

Ok.
 
>> +
>> +	for (y = 0; y < height; y++) {
>> +		drm_fb_gray8_to_mono_reversed_line(mono, gray8, dst_pitch);
>> +		mono += (dst_pitch / 8);
> 
> The dst_pitch is already given in bytes.
>

Yes, I know but for reversed mono we want only 1/8 of the width since we
are converting from 8 bits per pixel greyscale to 1 bit per pixel mono.

Or am I misunderstanding what you meant ?

>> +		gray8 += dst_pitch;
> 
> 'gray8 += fb->pitches[0]' would be correct.
>

Ok.
 
[snip]

>> + */
>> +void drm_fb_xrgb8888_to_mono_reversed(void *dst, unsigned int dst_pitch, const void *src,
>> +				      const struct drm_framebuffer *fb,
>> +				      const struct drm_rect *clip)
>> +{
>> +	if (WARN_ON(fb->format->format != DRM_FORMAT_XRGB8888))
>> +		return;
>> +
>> +	if (!dst_pitch)
>> +		dst_pitch = drm_rect_width(clip);
>> +
>> +	drm_fb_xrgb8888_to_gray8(dst, dst_pitch, src, fb, clip);
>> +	drm_fb_gray8_to_mono_reversed(dst, dst_pitch, dst, fb, clip);
> 
> Converting from dst into dst can give incorrect results. At some point 
> we probably want to add restrict qualifiers to these pointers, to help 
> the compiler with optimizing.
> 
> A better approach here is to pull the per-line conversion from 
> drm_fb_xrgb8888_to_gray8() into a separate helper and implement a 
> line-by-line conversion here. something like this:
> 
>    drm_fb_xrgb8888_to_mono_reversed()
>    {
>      char *tmp = kmalloc(size of a single line of gray8)
> 
>      for (heigth) {
>         drm_fb_xrgb8888_to_gray8_line(tmp, ..., src, ...);
>         drm_fb_gray8_to_mono_reversed(dst, ..., tmp, ...);
> 
>         src += fb->pitches[0]
>         dst += dst_pitch;
>      }
> 
>      kfree(tmp);
>    }
>

I see. Yes, that sounds a much better approach. I'll change it in v3.
 
Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

