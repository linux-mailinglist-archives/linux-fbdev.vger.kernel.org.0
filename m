Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92346E6BE3
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Apr 2023 20:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjDRSQy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Apr 2023 14:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjDRSQw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Apr 2023 14:16:52 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 405DC4ECB;
        Tue, 18 Apr 2023 11:16:50 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:36206.1084606344
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id A4080100567;
        Wed, 19 Apr 2023 02:16:45 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-7b48884fd-tj646 with ESMTP id ce235540f5fb4e348657788457610f7a for maarten.lankhorst@linux.intel.com;
        Wed, 19 Apr 2023 02:16:48 CST
X-Transaction-ID: ce235540f5fb4e348657788457610f7a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
Date:   Wed, 19 Apr 2023 02:16:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
From:   Sui Jingfeng <15330273260@189.cn>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Li Yi <liyi@loongson.cn>,
        Helge Deller <deller@gmx.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
 <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
Content-Language: en-US
In-Reply-To: <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

On 2023/4/19 01:52, Sui Jingfeng wrote:
> Hi,
>
> On 2023/4/18 16:32, Daniel Vetter wrote:
>> On Mon, Apr 17, 2023 at 07:32:19PM +0800, Sui Jingfeng wrote:
>>> The fbdev test of IGT may write after EOF, which lead to out-of-bound
>>> access for the drm drivers using fbdev-generic. For example, on a x86
>>> + aspeed bmc card platform, with a 1680x1050 resolution display, 
>>> running
>>> fbdev test if IGT will cause the linux kernel hang with the following
>>> call trace:
>>>
>>>    Oops: 0000 [#1] PREEMPT SMP PTI
>>>    [IGT] fbdev: starting subtest eof
>>>    Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
>>>    [IGT] fbdev: starting subtest nullptr
>>>
>>>    RIP: 0010:memcpy_erms+0xa/0x20
>>>    RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
>>>    RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
>>>    RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
>>>    RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
>>>    R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
>>>    R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
>>>    FS:  0000000000000000(0000) GS:ffff895257380000(0000) 
>>> knlGS:0000000000000000
>>>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>    CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
>>>    Call Trace:
>>>     <TASK>
>>>     ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
>>>     drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
>>>     process_one_work+0x21f/0x430
>>>     worker_thread+0x4e/0x3c0
>>>     ? __pfx_worker_thread+0x10/0x10
>>>     kthread+0xf4/0x120
>>>     ? __pfx_kthread+0x10/0x10
>>>     ret_from_fork+0x2c/0x50
>>>     </TASK>
>>>    CR2: ffffa17d40e0b000
>>>    ---[ end trace 0000000000000000 ]---
>>>
>>> The direct reason is that damage rectange computed by
>>> drm_fb_helper_memory_range_to_clip() does not guaranteed to be 
>>> in-bound.
>>> It is already results in workaround code populate to elsewhere. Another
>>> reason is that exposing a larger buffer size than the actual needed 
>>> help
>>> to trigger this bug intrinsic in drm_fb_helper_memory_range_to_clip().
>>>
>>> Others fbdev emulation solutions write to the GEM buffer directly, they
>>> won't reproduce this bug because the .fb_dirty function callback do not
>>> being hooked, so no chance is given to 
>>> drm_fb_helper_memory_range_to_clip()
>>> to generate a out-of-bound when drm_fb_helper_sys_write() is called.
>>>
>>> This patch break the trigger condition of this bug by shrinking the 
>>> shadow
>>> buffer size to sizes->surface_height * buffer->fb->pitches[0].
>>>
>>> Fixes: '8fbc9af55de0 ("drm/fbdev-generic: Set screen size to size of 
>>> GEM
>>> buffer")'
>>>
>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>> ---
>>>   drivers/gpu/drm/drm_fbdev_generic.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c 
>>> b/drivers/gpu/drm/drm_fbdev_generic.c
>>> index 8e5148bf40bb..b057cfbba938 100644
>>> --- a/drivers/gpu/drm/drm_fbdev_generic.c
>>> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
>>> @@ -94,7 +94,7 @@ static int 
>>> drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
>>>       fb_helper->buffer = buffer;
>>>       fb_helper->fb = buffer->fb;
>>>   -    screen_size = buffer->gem->size;
>>> +    screen_size = sizes->surface_height * buffer->fb->pitches[0];
>> So I read core some more and stumbled over drm_fb_helper_deferred_io().
>> Which has all the code and comments about this, including limiting.
>>
>> I think it would be clearer if we fix the issue there, instead of 
>> passing
>> limits around in obscure places that then again get broken?
>
> No, it is more obscure doing that way...
>
>
> As the size of the shadow screen buffer will be exposed to userspace.
>
> The size 'helper->fb->height * helper->fb->pitches[0]' is a 
> exactly(best) fit,
>
> You are guaranteed to waste at lease one byte by increasing one byte,
>
> and can not store all pixels by decreasing one byte (In the case where 
> `helper->fb->pitches[0] = helper->fb->width * 4`).
>
> It implicitly tell the userspace do not go beyond that boundary.
>
> although userspace program can still choose to write  after EOF,
>
> But it is for test purpose, to test the kernel if it can return a 
> -EFBIG or not.
>
>> The thing is,
>> Thomas both authored the limit checks in drm_fb_helper_deferred_io() and
>> the patch which broken them again, so clearly this isn't very 
>> obvious. I'm
>> thinking of something like this:
>>
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>> b/drivers/gpu/drm/drm_fb_helper.c
>> index ef4eb8b12766..726dab67c359 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -697,10 +697,7 @@ void drm_fb_helper_deferred_io(struct fb_info 
>> *info, struct list_head *pagerefli
>>        * of the screen and account for non-existing scanlines. Hence,
>>        * keep the covered memory area within the screen buffer.
>>        */
>> -    if (info->screen_size)
>> -        total_size = info->screen_size;
>> -    else
>> -        total_size = info->fix.smem_len;
>> +    total_size = helper->fb->height * helper->fb->pitches[0];
>
> This is just to mitigate the mistakes already has been made,
>
> because it  do not do a good splitting between the *clip* part and the 
> *damage update* part.
>
> An ideal clipping do not obscure its updating backend with a 
> out-of-bound damage rectangle.
>
> Why did the drm_fb_helper_memory_range_to_clip() can not do a good job 
> in all case
>
> to pass its backend a always meaningful damage rect ?
>
>>       max_off = min(max_off, total_size);
>>         if (min_off < max_off) {
>>
>>
>> I think that would make it utmost clear on what we're doing and why.
>> Otherwise we're just going to re-create the same bug again, like we've
>> done already :-)
>
> No, we create no bugs, we fix one.
>
> Thanks.
>
But honestly I do not have strong feel toward this, I just type what I'm 
understand without seeing you resend a V3.

It's OK in overall,  I will help to test this tomorrow.  :-)

>> -Daniel
>>
>>>       screen_buffer = vzalloc(screen_size);
>>>       if (!screen_buffer) {
>>>           ret = -ENOMEM;
>>> -- 
>>> 2.25.1
>>>
