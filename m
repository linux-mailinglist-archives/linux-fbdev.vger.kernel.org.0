Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC186EF226
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Apr 2023 12:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240541AbjDZKfj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Apr 2023 06:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240505AbjDZKfF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Apr 2023 06:35:05 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D00E85BB7
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Apr 2023 03:34:32 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:34228.184384075
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id EEB58100207;
        Wed, 26 Apr 2023 18:33:47 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-85667d6c59-fm8l8 with ESMTP id 7ff2290f80bf408d93a485a4acdd9b38 for tzimmermann@suse.de;
        Wed, 26 Apr 2023 18:33:50 CST
X-Transaction-ID: 7ff2290f80bf408d93a485a4acdd9b38
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <3731fda4-14d6-b4ee-0036-0ea0dd2e9bc9@189.cn>
Date:   Wed, 26 Apr 2023 18:33:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/6] drm,fbdev: Use fbdev's I/O helpers
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
        deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230425142846.730-1-tzimmermann@suse.de>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,


The whole patch set is tested with fbdev of IGT, on LoongArch with
drm/radeon and efifb driver. Test results say SUCCESS.


On 2023/4/25 22:28, Thomas Zimmermann wrote:
> Make fbdev's built-in helpers for reading and writing I/O and system
> memory available to DRM. Replace DRM's internal helpers.
>
> The first patch resolves a bug that's been in the fbdev code for
> more than 15 years. Makes the read/write helpers work successfully
> with the IGT tests.
>
> Patches 2 to 4 streamline fbdev's file-I/O code and remove a few
> duplicate checks.
>
> Patch 5 moves the default-I/O code into the new helpers fb_cfb_read()
> and fb_cfb_write(); patch 6 uses them in DRM. This allows us to remove
> quite a bit of code from DRM's internal fbdev helpers.
>
> Tested with i915 and simpledrm.
>
> The next step here is to remove the drm_fb_helper_{cfb,sys}_*()
> entirely. They where mostly introduced because fbdev doesn't protect
> it's public interfaces with an CONFIG_FB preprocessor guards. But all
> of DRM driver's fbdev emulation won't be build without CONFIG_FB, so
> this is not an issue in practice. Removing the DRM wrappers will
> further simplify the DRM code.
>
> Thomas Zimmermann (6):
>    fbdev: Return number of bytes read or written
>    fbdev: Use screen_buffer in fb_sys_{read,write}()
>    fbdev: Don't re-validate info->state in fb_ops implementations
>    fbdev: Validate info->screen_{base,buffer} in fb_ops implementations
>    fbdev: Move CFB read and write code into helper functions
>    drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
>
>   drivers/gpu/drm/drm_fb_helper.c        | 174 +------------------------
>   drivers/video/fbdev/cobalt_lcdfb.c     |   6 +
>   drivers/video/fbdev/core/Makefile      |   2 +-
>   drivers/video/fbdev/core/fb_cfb_fops.c | 126 ++++++++++++++++++
>   drivers/video/fbdev/core/fb_sys_fops.c |  36 ++---
>   drivers/video/fbdev/core/fbmem.c       | 111 +---------------
>   drivers/video/fbdev/sm712fb.c          |  10 +-
>   include/linux/fb.h                     |  10 ++
>   8 files changed, 173 insertions(+), 302 deletions(-)
>   create mode 100644 drivers/video/fbdev/core/fb_cfb_fops.c
>
