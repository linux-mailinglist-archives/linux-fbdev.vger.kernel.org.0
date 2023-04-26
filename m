Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793556EF16D
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Apr 2023 11:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239629AbjDZJtz (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Apr 2023 05:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240110AbjDZJtu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Apr 2023 05:49:50 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9875E273D
        for <linux-fbdev@vger.kernel.org>; Wed, 26 Apr 2023 02:49:48 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.31:44278.1567256073
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
        by 189.cn (HERMES) with SMTP id 76D0D1002D6;
        Wed, 26 Apr 2023 17:49:44 +0800 (CST)
Received: from  ([114.242.206.180])
        by gateway-151646-dep-85667d6c59-lhcrq with ESMTP id 2047f5be683341e09036d10316edfbd5 for tzimmermann@suse.de;
        Wed, 26 Apr 2023 17:49:47 CST
X-Transaction-ID: 2047f5be683341e09036d10316edfbd5
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
Message-ID: <2c2394b8-c933-0122-1243-c2697cab72cb@189.cn>
Date:   Wed, 26 Apr 2023 17:49:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [3/6] fbdev: Don't re-validate info->state in fb_ops
 implementations
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
        deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
        teddy.wang@siliconmotion.com
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230425142846.730-4-tzimmermann@suse.de>
From:   Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230425142846.730-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>


On 2023/4/25 22:28, Thomas Zimmermann wrote:
> The file-op entry points fb_read() and fb_write() verify that
> info->state has been set to FBINFO_STATE_RUNNING. Remove the same
> test from the implementations of struct fb_ops.{fb_read,fb_write}.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/video/fbdev/core/fb_sys_fops.c | 6 ------
>   drivers/video/fbdev/sm712fb.c          | 6 ------
>   2 files changed, 12 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
> index 6589123f4127..7dee5d3c7fb1 100644
> --- a/drivers/video/fbdev/core/fb_sys_fops.c
> +++ b/drivers/video/fbdev/core/fb_sys_fops.c
> @@ -22,9 +22,6 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
>   	unsigned long total_size, c;
>   	ssize_t ret;
>   
> -	if (info->state != FBINFO_STATE_RUNNING)
> -		return -EPERM;
> -
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
> @@ -64,9 +61,6 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   	unsigned long total_size, c;
>   	size_t ret;
>   
> -	if (info->state != FBINFO_STATE_RUNNING)
> -		return -EPERM;
> -
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
> diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
> index b528776c7612..6f852cd756c5 100644
> --- a/drivers/video/fbdev/sm712fb.c
> +++ b/drivers/video/fbdev/sm712fb.c
> @@ -1031,9 +1031,6 @@ static ssize_t smtcfb_read(struct fb_info *info, char __user *buf,
>   	if (!info || !info->screen_base)
>   		return -ENODEV;
>   
> -	if (info->state != FBINFO_STATE_RUNNING)
> -		return -EPERM;
> -
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
> @@ -1097,9 +1094,6 @@ static ssize_t smtcfb_write(struct fb_info *info, const char __user *buf,
>   	if (!info || !info->screen_base)
>   		return -ENODEV;
>   
> -	if (info->state != FBINFO_STATE_RUNNING)
> -		return -EPERM;
> -
>   	total_size = info->screen_size;
>   
>   	if (total_size == 0)
