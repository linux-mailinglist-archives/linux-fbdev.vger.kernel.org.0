Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7035D6E2237
	for <lists+linux-fbdev@lfdr.de>; Fri, 14 Apr 2023 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjDNLbi (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 14 Apr 2023 07:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjDNLbh (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 14 Apr 2023 07:31:37 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B66793C9;
        Fri, 14 Apr 2023 04:31:15 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:60072.1839220964
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id 6F53A1002A6;
        Fri, 14 Apr 2023 19:30:54 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-7b48884fd-tj646 with ESMTP id 0a23296908cb403e8e456fa65526adce for daniel@ffwll.ch;
        Fri, 14 Apr 2023 19:30:56 CST
X-Transaction-ID: 0a23296908cb403e8e456fa65526adce
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <e84b5123-0360-9ec5-489e-2c5fc6b650ba@189.cn>
Date:   Fri, 14 Apr 2023 19:30:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/fbdev-generic: fix potential out-of-bounds access
Content-Language: en-US
To:     Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
        Helge Deller <deller@gmx.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
        suijingfeng <suijingfeng@loongson.cn>
References: <20230409132110.494630-1-15330273260@189.cn>
 <ZDV0Te65tSh4Q/vc@phenom.ffwll.local>
 <42f16d0d-4e1a-a016-f4cc-af24efa75f1c@189.cn>
 <ZDbuCWKfFlWyiOGp@phenom.ffwll.local>
 <dbac96b2-0fea-591b-517d-2a23cc36b8de@189.cn>
 <CAKMK7uG_h7htCDARudZpHOOMG4iOOLZmz0_WskvWGf+DKGwU1w@mail.gmail.com>
 <531f0bdf-2ae8-0361-183b-57b40df6345f@189.cn>
 <ZDhQW6El6ztyHK4M@phenom.ffwll.local>
 <1bbc7228-c2fe-0af0-c15c-b378bc4d111c@suse.de>
 <ZDhfkq92hbGc630z@phenom.ffwll.local>
 <1b44a3b5-5053-f121-ee62-de83d505759e@189.cn>
 <CAKMK7uHRWy=7m3=eEQz324kKOh9AM8J3Rma=KgBic0pRmW1NBQ@mail.gmail.com>
 <410baaef-bc55-cb2a-2e92-a407ce5cad04@suse.de>
 <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CAKMK7uGZUJh7JoqPSj=WJeRPDkPrxmNJGVoKcGZGy75=9AWCMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

On 2023/4/14 15:56, Daniel Vetter wrote:
> On Fri, 14 Apr 2023 at 09:34, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 14.04.23 um 07:36 schrieb Daniel Vetter:
>>> On Fri, 14 Apr 2023 at 06:24, Sui Jingfeng <15330273260@189.cn> wrote:
>>>> Hi,
>>>>
>>>> On 2023/4/14 04:01, Daniel Vetter wrote:
>>>>> On Thu, Apr 13, 2023 at 09:20:23PM +0200, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 13.04.23 um 20:56 schrieb Daniel Vetter:
>>>>>> [...]
>>>>>>> This should switch the existing code over to using drm_framebuffer instead
>>>>>>> of fbdev:
>>>>>>>
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>>>>>>> index ef4eb8b12766..99ca69dd432f 100644
>>>>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>>>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>>>>>> @@ -647,22 +647,26 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
>>>>>>>      static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off, size_t len,
>>>>>>>                                              struct drm_rect *clip)
>>>>>>>      {
>>>>>>> +   struct drm_fb_helper *helper = info->par;
>>>>>>> +
>>>>>>>       off_t end = off + len;
>>>>>>>       u32 x1 = 0;
>>>>>>>       u32 y1 = off / info->fix.line_length;
>>>>>>> -   u32 x2 = info->var.xres;
>>>>>>> -   u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
>>>>>>> +   u32 x2 = helper->fb->height;
>>>>>>> +   unsigned stride = helper->fb->pitches[0];
>>>>>>> +   u32 y2 = DIV_ROUND_UP(end, stride);
>>>>>>> +   int bpp = drm_format_info_bpp(helper->fb->format, 0);
>>>>>> Please DONT do that. The code here is fbdev code and shouldn't bother about
>>>>>> DRM data structures. Actually, it shouldn't be here: a number of fbdev
>>>>>> drivers with deferred I/O contain similar code and the fbdev module should
>>>>>> provide us with a helper. (I think I even had some patches somewhere.)
>>>>> Well my thinking is that it's a drm driver,
>>>> Yes, I actually agree with this, and the code looks quite good. And I
>>>> really want to adopt it.
>>>>
>>>> Because here is DRM, we should emulate the fbdev in the DRM's way.
>>>>
>>>> The DRM is really the big brother on the behind of emulated fbdev,
>>>>
>>>> who provide the real displayable backing memory and scant out engine to
>>>> display such a buffer.
>>>>
>>>>
>>>> But currently, the fact is,  drm_fb_helper.c still initializes lots of
>>>> data structure come from fbdev world.
>>>>
>>>> For example, the drm_fb_helper_fill_fix() and drm_fb_helper_fill_var()
>>>> in drm_fb_helper_fill_info() function.
>>>>
>>>> This saying implicitly that the fbdev-generic is a glue layer which copy
>>>> damage frame buffer data
>>>>
>>>> from the front end(fbdev layer) to its drm backend.  It's not a 100%
>>>> replacement its fbdev front end,
>>>>
>>>> rather, it relay on it.
>>>>
>>>>
>>>>> so if we have issue with limit
>>>>> checks blowing up it makes more sense to check them against drm limits.
>>>>> Plus a lot more people understand those than fbdev. They should all match
>>>>> anyway, or if they dont, we have a bug.
>>>> Yes, this is really what I'm worry about.
>>>>
>>>> I see that  members of struct fb_var_screeninfo can be changed by
>>>> user-space. For example, xoffset and yoffset.
>>>>
>>>> There is no change about 'info->var.xres' and 'info->var.yres' from the
>>>> userspace,
>>>>
>>>> therefore, they should all match in practice.
>>>>
>>>>
>>>> User-space can choose a use a smaller dispaly area than 'var.xres x
>>>> var.yres',
>>>>
>>>> but that is implemented with 'var.xoffset' and 'var.xoffset'.
>>>>
>>>> But consider that the name 'var', which may stand for 'variation' or
>>>> 'vary'. This is terrifying.
>>>>
>>>> I imagine, with a shadow buffer, the front end can do any modeset on the
>>>> runtime freely,
>>>>
>>>> including change the format of frame buffer on the runtime.  Just do not
>>>> out-of-bound.
>>>>
>>>> The middle do the conversion on the fly.
>>>>
>>>>
>>>> We might also create double shadow buffer size to allow the front end to
>>>> pan?
>>> Yeah so the front should be able to pan. And the front-end can
>>> actually make xres/yres smalle than drm_fb->height/width, so we _have_
>>> to use the fb side of things. Otherwise it's a bug I just realized.
>> What are you talking about?  The GEM buffer is a full fbdev framebuffer,
>> which is screen resolution multiplied by the overall factor.  The shadow
>> buffer is exactly the same size. You can already easily pan within these
>> buffers.
>>
>> There's also no need/way to change video modes or formats in the shadow
>> buffer. If we'd ever support that, it would be implemented in the DRM
>> driver's modesetting.  The relationship between GEM buffer and shadow
>> buffer remains unaffected by this.
> Try it and be amazed :-) I've seen enough syzkaller bugs and screamed
> at them that yes we do this. Also xres/yres is the wrong thing even if
> you don't use fb ioctl to change things up in multi-monitor cases (we
> allocate the drm_fb/fbdev virtual size to match the biggest
> resolution, but then set fbinfo->var.x/yres to match the smallest to
> make sure fbcon is fully visible everywhere).
>
> I think you're confusion is the perfect case for why we really should
> use fb->height/width/pitches[0] here.
> -Daniel

Exactly,

This what I'm worry about, if someone add code with changing xres/yres 
from userspace

via fb ioctl implemented.  Then, xres/yres and 
fb->height/width/pitches[0] may not match.

so fetch data from fbinfo->var.x/yres still more safe.


Yet, on our platform with drm/loongson driver with two screen,  I just 
tested,

fbinfo->var.x/yres do match the smallest of the display resolution.

V2 of this patch also have been respin, and sent, welcome to review.


It also will be proved that it's more easy  to do the modeset on the 
emulated fbdev side.

It just adjust a few parameter, without the need of touch the real 
hardware.

The drm/GEM backend side do not need to do anything, just using their 
native display mode supported respectively.

Which allow the emulated fbdev side use the smaller display area freely 
and may support any resolution smaller

than the common display area.

>> Best regards
>> Thomas
>>
>>> The xres_virtual/yres_virtual should always match drm_fb sizes (but
>>> we've had bugs in the past for that, only recently fixed all in
>>> linux-next), because that's supposed to be the max size. And since we
>>> never reallocate the fbdev emulation fb (at least with the current
>>> code) this should never change.
>>>
>>> But fundamentally you're bringing up a very good point, we've had
>>> piles of bugs in the past with not properly validating the fbdev side
>>> information in info->var, and a bunch of resulting bugs. So validating
>>> against the drm side of things should be a bit more robust.
>>>
>>> It's kinda the same we do for legacy kms ioctls: We translate that to
>>> atomic kms as fast as possible, and then do the entire subsequent
>>> validation with atomic kms data structures.
>>> -Daniel
>>>
>>>>> The thing is, if you change this
>>>>> further to just pass the drm_framebuffer, then this 100% becomes a drm
>>>>> function, which could be used by anything in drm really.
>>>> I agree with you.
>>>>
>>>> If I use fb_width/fb_height directly and bypassing 'info->var.xres" and
>>>> "info->var.yres",
>>>>
>>>> the code style diverged then. As far as I am understanding,  the clip
>>>> happen on the front end,
>>>>
>>>> the actual damage update happen at back end.
>>>>
>>>> Using the data structure come with the front end is more reasonable for
>>>> current implement.
>>>>
>>>>> But also *shrug*.
>>>> I can convert this single function to 100% drm with another patch.
>>>>
>>>> But, maybe there also have other functions are not 100% drm
>>>>
>>>> I would like do something to help achieve this in the future,
>>>>
>>>> let me help to fix this bug first?
>>>>
>>>>> -Daniel
>>>
>>>
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 Nürnberg, Germany
>> (HRB 36809, AG Nürnberg)
>> Geschäftsführer: Ivo Totev
>
>
