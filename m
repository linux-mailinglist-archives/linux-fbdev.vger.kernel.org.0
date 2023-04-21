Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79D36EA5C9
	for <lists+linux-fbdev@lfdr.de>; Fri, 21 Apr 2023 10:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjDUIZ2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 21 Apr 2023 04:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbjDUIZ2 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 21 Apr 2023 04:25:28 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C39D8A4B;
        Fri, 21 Apr 2023 01:25:19 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.41:47668.59152113
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 23F931002ED;
        Fri, 21 Apr 2023 16:25:01 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id 776fb68c19e2404bb137df3e6d5a7f83 for tzimmermann@suse.de;
        Fri, 21 Apr 2023 16:25:17 CST
X-Transaction-ID: 776fb68c19e2404bb137df3e6d5a7f83
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <9bab889a-edd8-1938-a034-de8e8f73c7c0@189.cn>
Date:   Fri, 21 Apr 2023 16:24:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Cc:     loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <4e4f98d9-ad82-4234-4123-e362aac979e6@suse.de>
Content-Language: en-US
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <4e4f98d9-ad82-4234-4123-e362aac979e6@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi

On 2023/4/21 16:09, Thomas Zimmermann wrote:
> Hi
>
> Am 20.04.23 um 05:05 schrieb Sui Jingfeng:
>> The fbdev test of IGT may write after EOF, which lead to out-of-bound
>> access for drm drivers hire fbdev-generic. For example, run fbdev test
>> on a x86+ast2400 platform, with 1680x1050 resolution, will cause the
>> linux kernel hang with the following call trace:
>
> I've merged this patch into drm-misc-fixes. Thanks for the fix.
>

Thanks a lot!


> Best regards
> Thomas
>
>>
>>    Oops: 0000 [#1] PREEMPT SMP PTI
>>    [IGT] fbdev: starting subtest eof
>>    Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
>>    [IGT] fbdev: starting subtest nullptr
>>
>>    RIP: 0010:memcpy_erms+0xa/0x20
>>    RSP: 0018:ffffa17d40167d98 EFLAGS: 00010246
>>    RAX: ffffa17d4eb7fa80 RBX: ffffa17d40e0aa80 RCX: 00000000000014c0
>>    RDX: 0000000000001a40 RSI: ffffa17d40e0b000 RDI: ffffa17d4eb80000
>>    RBP: ffffa17d40167e20 R08: 0000000000000000 R09: ffff89522ecff8c0
>>    R10: ffffa17d4e4c5000 R11: 0000000000000000 R12: ffffa17d4eb7fa80
>>    R13: 0000000000001a40 R14: 000000000000041a R15: ffffa17d40167e30
>>    FS:  0000000000000000(0000) GS:ffff895257380000(0000) 
>> knlGS:0000000000000000
>>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>    CR2: ffffa17d40e0b000 CR3: 00000001eaeca006 CR4: 00000000001706e0
>>    Call Trace:
>>     <TASK>
>>     ? drm_fbdev_generic_helper_fb_dirty+0x207/0x330 [drm_kms_helper]
>>     drm_fb_helper_damage_work+0x8f/0x170 [drm_kms_helper]
>>     process_one_work+0x21f/0x430
>>     worker_thread+0x4e/0x3c0
>>     ? __pfx_worker_thread+0x10/0x10
>>     kthread+0xf4/0x120
>>     ? __pfx_kthread+0x10/0x10
>>     ret_from_fork+0x2c/0x50
>>     </TASK>
>>    CR2: ffffa17d40e0b000
>>    ---[ end trace 0000000000000000 ]---
>>
>> The is because damage rectangles computed by
>> drm_fb_helper_memory_range_to_clip() function does not guaranteed to be
>> bound in the screen's active display area. Possible reasons are:
>>
>> 1) Buffers are allocated in the granularity of page size, for mmap 
>> system
>>     call support. The shadow screen buffer consumed by fbdev 
>> emulation may
>>     also choosed be page size aligned.
>>
>> 2) The DIV_ROUND_UP() used in drm_fb_helper_memory_range_to_clip()
>>     will introduce off-by-one error.
>>
>> For example, on a 16KB page size system, in order to store a 1920x1080
>> XRGB framebuffer, we need allocate 507 pages. Unfortunately, the size
>> 1920*1080*4 can not be divided exactly by 16KB.
>>
>>   1920 * 1080 * 4 = 8294400 bytes
>>   506 * 16 * 1024 = 8290304 bytes
>>   507 * 16 * 1024 = 8306688 bytes
>>
>>   line_length = 1920*4 = 7680 bytes
>>
>>   507 * 16 * 1024 / 7680 = 1081.6
>>
>>   off / line_length = 507 * 16 * 1024 / 7680 = 1081
>>   DIV_ROUND_UP(507 * 16 * 1024, 7680) will yeild 1082
>>
>> memcpy_toio() typically issue the copy line by line, when copy the last
>> line, out-of-bound access will be happen. Because:
>>
>>   1082 * line_length = 1082 * 7680 = 8309760, and 8309760 > 8306688
>>
>> Note that userspace may stil write to the invisiable area if a larger
>> buffer than width x stride is exposed. But it is not a big issue as
>> long as there still have memory resolve the access if not drafting so
>> far.
>>
>>   - Also limit the y1 (Daniel)
>>   - keep fix patch it to minimal (Daniel)
>>   - screen_size is page size aligned because of it need mmap (Thomas)
>>   - Adding fixes tag (Thomas)
>>
>> Fixes: aa15c677cc34 ("drm/fb-helper: Fix vertical damage clipping")
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Link: 
>> https://lore.kernel.org/dri-devel/ad44df29-3241-0d9e-e708-b0338bf3c623@189.cn/
>> ---
>>   drivers/gpu/drm/drm_fb_helper.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c 
>> b/drivers/gpu/drm/drm_fb_helper.c
>> index 64458982be40..6bb1b8b27d7a 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -641,19 +641,27 @@ static void drm_fb_helper_damage(struct 
>> drm_fb_helper *helper, u32 x, u32 y,
>>   static void drm_fb_helper_memory_range_to_clip(struct fb_info 
>> *info, off_t off, size_t len,
>>                              struct drm_rect *clip)
>>   {
>> +    u32 line_length = info->fix.line_length;
>> +    u32 fb_height = info->var.yres;
>>       off_t end = off + len;
>>       u32 x1 = 0;
>> -    u32 y1 = off / info->fix.line_length;
>> +    u32 y1 = off / line_length;
>>       u32 x2 = info->var.xres;
>> -    u32 y2 = DIV_ROUND_UP(end, info->fix.line_length);
>> +    u32 y2 = DIV_ROUND_UP(end, line_length);
>> +
>> +    /* Don't allow any of them beyond the bottom bound of display 
>> area */
>> +    if (y1 > fb_height)
>> +        y1 = fb_height;
>> +    if (y2 > fb_height)
>> +        y2 = fb_height;
>>         if ((y2 - y1) == 1) {
>>           /*
>>            * We've only written to a single scanline. Try to reduce
>>            * the number of horizontal pixels that need an update.
>>            */
>> -        off_t bit_off = (off % info->fix.line_length) * 8;
>> -        off_t bit_end = (end % info->fix.line_length) * 8;
>> +        off_t bit_off = (off % line_length) * 8;
>> +        off_t bit_end = (end % line_length) * 8;
>>             x1 = bit_off / info->var.bits_per_pixel;
>>           x2 = DIV_ROUND_UP(bit_end, info->var.bits_per_pixel);
>
