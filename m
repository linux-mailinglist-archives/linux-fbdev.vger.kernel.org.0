Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A27C10E708
	for <lists+linux-fbdev@lfdr.de>; Mon,  2 Dec 2019 09:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfLBItU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-fbdev@lfdr.de>); Mon, 2 Dec 2019 03:49:20 -0500
Received: from hygieia.sysophe.eu ([138.201.91.14]:42623 "EHLO
        hygieia.sysophe.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfLBItU (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 2 Dec 2019 03:49:20 -0500
X-Greylist: delayed 504 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Dec 2019 03:49:19 EST
Received: from aether.lan.sysophe.eu (unknown [IPv6:2001:a18:24b:8201:e8b:fdff:fea0:3408])
        by smtp.sysophe.eu (Postfix) with ESMTPSA id B0DE6103DF1E1;
        Mon,  2 Dec 2019 09:35:27 +0100 (CET)
Date:   Mon, 2 Dec 2019 09:40:47 +0100
From:   Bruno =?UTF-8?B?UHLDqW1vbnQ=?= <bonbons@linux-vserver.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
        linux-input@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v2 11/14] HID: picoLCD: constify fb ops
Message-ID: <20191202094047.34525a7d@aether.lan.sysophe.eu>
In-Reply-To: <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
        <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com>
X-Mailer: Claws Mail 3.17.4git3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Jani,

On Fri, 29 Nov 2019 12:29:41 Jani Nikula <jani.nikula@intel.com> wrote:
> Now that the fbops member of struct fb_info is const, we can start
> making the ops const as well.
>
> v2: fix	typo (Christophe de Dinechin)

Fine with me.
I don't think going through drm-misc would trigger any conflict, but
adding Jiri to CC for the case there was any preference.

Acked-by: Bruno Prémont <bonbons@linux-vserver.org>

> Cc: Bruno Prémont <bonbons@linux-vserver.org>
> Cc: linux-input@vger.kernel.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/hid/hid-picolcd_fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
> index e162a668fb7e..a549c42e8c90 100644
> --- a/drivers/hid/hid-picolcd_fb.c
> +++ b/drivers/hid/hid-picolcd_fb.c
> @@ -417,8 +417,7 @@ static int picolcd_set_par(struct fb_info *info)
>  	return 0;
>  }
>  
> -/* Note this can't be const because of struct fb_info definition */
> -static struct fb_ops picolcdfb_ops = {
> +static const struct fb_ops picolcdfb_ops = {
>  	.owner        = THIS_MODULE,
>  	.fb_destroy   = picolcd_fb_destroy,
>  	.fb_read      = fb_sys_read,

