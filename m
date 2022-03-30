Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9BB4EC9E7
	for <lists+linux-fbdev@lfdr.de>; Wed, 30 Mar 2022 18:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244943AbiC3Qsj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 30 Mar 2022 12:48:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349054AbiC3Qsi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 30 Mar 2022 12:48:38 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909FD27B615
        for <linux-fbdev@vger.kernel.org>; Wed, 30 Mar 2022 09:46:51 -0700 (PDT)
Received: from [192.168.0.4] (ip5f5ae8ee.dynamic.kabel-deutschland.de [95.90.232.238])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7353D61EA192A;
        Wed, 30 Mar 2022 18:46:48 +0200 (CEST)
Message-ID: <baebc9c2-a8fc-9b36-6133-7fa8368a93d5@molgen.mpg.de>
Date:   Wed, 30 Mar 2022 18:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] fbdev: defio: fix the pagelist corruption
Content-Language: en-US
To:     Chuansheng Liu <chuansheng.liu@intel.com>
Cc:     tzimmermann@suse.de, linux-fbdev@vger.kernel.org, deller@gmx.de,
        dri-devel@lists.freedesktop.org
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
 <c058f18b-3dae-9ceb-57b4-ed62fedef50a@molgen.mpg.de>
 <BL1PR11MB54455684D2A1B4F0A666F861971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
 <502adc88-740f-fd68-d870-4f5577e1254d@molgen.mpg.de>
 <BL1PR11MB544534F78BE2AB3502981AE5971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <BL1PR11MB544534F78BE2AB3502981AE5971D9@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

[Cc: -jayalk@intworks.biz as it bounces]

Dear Chuansheng,


Am 29.03.22 um 01:58 schrieb Liu, Chuansheng:

>> -----Original Message-----
>> From: Paul Menzel
>> Sent: Monday, March 28, 2022 2:15 PM

>> Am 28.03.22 um 02:58 schrieb Liu, Chuansheng:
>>
>>>> -----Original Message-----
>>
>>>> Sent: Saturday, March 26, 2022 4:11 PM
>>
>>>> Am 17.03.22 um 06:46 schrieb Chuansheng Liu:
>>>>> Easily hit the below list corruption:
>>>>> ==
>>>>> list_add corruption. prev->next should be next (ffffffffc0ceb090), but
>>>>> was ffffec604507edc8. (prev=ffffec604507edc8).
>>>>> WARNING: CPU: 65 PID: 3959 at lib/list_debug.c:26
>>>>> __list_add_valid+0x53/0x80
>>>>> CPU: 65 PID: 3959 Comm: fbdev Tainted: G     U
>>>>> RIP: 0010:__list_add_valid+0x53/0x80
>>>>> Call Trace:
>>>>>     <TASK>
>>>>>     fb_deferred_io_mkwrite+0xea/0x150
>>>>>     do_page_mkwrite+0x57/0xc0
>>>>>     do_wp_page+0x278/0x2f0
>>>>>     __handle_mm_fault+0xdc2/0x1590
>>>>>     handle_mm_fault+0xdd/0x2c0
>>>>>     do_user_addr_fault+0x1d3/0x650
>>>>>     exc_page_fault+0x77/0x180
>>>>>     ? asm_exc_page_fault+0x8/0x30
>>>>>     asm_exc_page_fault+0x1e/0x30
>>>>> RIP: 0033:0x7fd98fc8fad1
>>>>> ==
>>>>>
>>>>> Figure out the race happens when one process is adding &page->lru into
>>>>> the pagelist tail in fb_deferred_io_mkwrite(), another process is
>>>>> re-initializing the same &page->lru in fb_deferred_io_fault(), which is
>>>>> not protected by the lock.
>>>>>
>>>>> This fix is to init all the page lists one time during initialization,
>>>>> it not only fixes the list corruption, but also avoids INIT_LIST_HEAD()
>>>>> redundantly.
>>>>>
>>>>> Fixes: 105a940416fc ("fbdev/defio: Early-out if page is already enlisted")
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
>>>>> ---
>>>>>     drivers/video/fbdev/core/fb_defio.c | 9 ++++++++-
>>>>>     1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/video/fbdev/core/fb_defio.c
>> b/drivers/video/fbdev/core/fb_defio.c
>>>>> index 98b0f23bf5e2..eafb66ca4f28 100644
>>>>> --- a/drivers/video/fbdev/core/fb_defio.c
>>>>> +++ b/drivers/video/fbdev/core/fb_defio.c
>>>>> @@ -59,7 +59,6 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
>>>>>     		printk(KERN_ERR "no mapping available\n");
>>>>>
>>>>>     	BUG_ON(!page->mapping);
>>>>> -	INIT_LIST_HEAD(&page->lru);
>>>>>     	page->index = vmf->pgoff;
>>>>>
>>>>>     	vmf->page = page;
>>>>> @@ -220,6 +219,8 @@ static void fb_deferred_io_work(struct work_struct *work)
>>>>>     void fb_deferred_io_init(struct fb_info *info)
>>>>>     {
>>>>>     	struct fb_deferred_io *fbdefio = info->fbdefio;
>>>>> +	struct page *page;
>>>>> +	int i;
>>>>>
>>>>>     	BUG_ON(!fbdefio);
>>>>>     	mutex_init(&fbdefio->lock);
>>>>> @@ -227,6 +228,12 @@ void fb_deferred_io_init(struct fb_info *info)
>>>>>     	INIT_LIST_HEAD(&fbdefio->pagelist);
>>>>>     	if (fbdefio->delay == 0) /* set a default of 1 s */
>>>>>     		fbdefio->delay = HZ;
>>>>> +
>>>>> +	/* initialize all the page lists one time */
>>>>> +	for (i = 0; i < info->fix.smem_len; i += PAGE_SIZE) {
>>>>> +		page = fb_deferred_io_page(info, i);
>>>>> +		INIT_LIST_HEAD(&page->lru);
>>>>> +	}
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(fb_deferred_io_init);
>>>>>
>>>> Applying your patch on top of current Linus’ master branch, tty0 is
>>>> unusable and looks frozen. Sometimes network card still works, sometimes
>>>> not.
>>>
>>> I don't see how the patch would cause below BUG call stack, need some time to
>>> debug. Just few comments:
>>> 1. Will the system work well without this patch?
>>
>> Yes, the framebuffer works well without the patch.
>>
>>> 2. When you are sure the patch causes the regression you saw, please get free
>> to submit one reverted patch, thanks : )
>>
>> I think you for patch wasn’t submitted yet – at least not pulled by Linus.
> The patch has been in drm-tip, could you have a try with the latest drm-tip to see if the
> Framebuffer works well, in that case, we could revert it in drm-tip then.

With drm-tip (drm-tip: 2022y-03m-29d-13h-14m-35s UTC integration 
manifest) everything works fine. (I had to disable amdgpu driver, as it 
failed to build.) Is anyone able to explain that?


Kind regards,

Paul
