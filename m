Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B27116E80
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Dec 2019 15:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfLIOEd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 9 Dec 2019 09:04:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:38372 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727268AbfLIOEd (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 9 Dec 2019 09:04:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 06:03:58 -0800
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="215101123"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 06:03:55 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        intel-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
In-Reply-To: <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com> <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
Date:   Mon, 09 Dec 2019 16:03:52 +0200
Message-ID: <87pngx4muv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
> Now that the fbops member of struct fb_info is const, we can start
> making the ops const as well.
>
> Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
> Cc: Robin van der Gracht <robin@protonic.nl>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Acked-by: Robin van der Gracht <robin@protonic.nl>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Miguel, Robin, just to err on the safe side, were you both okay with me
merging this through drm-misc? Not very likely to conflict badly.

BR,
Jani.

> ---
>  drivers/auxdisplay/cfag12864bfb.c | 2 +-
>  drivers/auxdisplay/ht16k33.c      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
> index 4074886b7bc8..2002291ab338 100644
> --- a/drivers/auxdisplay/cfag12864bfb.c
> +++ b/drivers/auxdisplay/cfag12864bfb.c
> @@ -57,7 +57,7 @@ static int cfag12864bfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  	return vm_map_pages_zero(vma, &pages, 1);
>  }
>  
> -static struct fb_ops cfag12864bfb_ops = {
> +static const struct fb_ops cfag12864bfb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_read = fb_sys_read,
>  	.fb_write = fb_sys_write,
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index a2fcde582e2a..d951d54b26f5 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -228,7 +228,7 @@ static int ht16k33_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  	return vm_map_pages_zero(vma, &pages, 1);
>  }
>  
> -static struct fb_ops ht16k33_fb_ops = {
> +static const struct fb_ops ht16k33_fb_ops = {
>  	.owner = THIS_MODULE,
>  	.fb_read = fb_sys_read,
>  	.fb_write = fb_sys_write,

-- 
Jani Nikula, Intel Open Source Graphics Center
