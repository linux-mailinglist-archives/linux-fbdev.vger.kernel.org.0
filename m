Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAFD50503
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2019 11:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbfFXJAb (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jun 2019 05:00:31 -0400
Received: from mga05.intel.com ([192.55.52.43]:6694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbfFXJAb (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jun 2019 05:00:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jun 2019 02:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,411,1557212400"; 
   d="scan'208";a="155102346"
Received: from agusev-mobl1.ger.corp.intel.com (HELO [10.252.34.77]) ([10.252.34.77])
  by orsmga008.jf.intel.com with ESMTP; 24 Jun 2019 02:00:25 -0700
Subject: Re: [PATCH] fbcon: Export fbcon_remap_all
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>, linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20190624083255.13235-1-daniel.vetter@ffwll.ch>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ca17f6dd-b691-b3ce-af28-46f4ba2fe0c7@linux.intel.com>
Date:   Mon, 24 Jun 2019 11:00:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624083255.13235-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Op 24-06-2019 om 10:32 schreef Daniel Vetter:
> Fixes linking fail when fbcon/fbdev is moduler and vgaswitcheroo is
> enabled:
>
> x86_64-linux-gnu-ld: drivers/gpu/vga/vga_switcheroo.o: in function `vga_switchto_stage2':
> vga_switcheroo.c:(.text+0x997): undefined reference to `fbcon_remap_all'
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Yisheng Xie <ysxie@foxmail.com>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> --
> wrt merging probably best if Maarten adds this to the topic branch we
> have already and sends out an updated pull request.
>
> Apologies for the mess.
> -Daniel
> ---
>  drivers/video/fbdev/core/fbcon.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index c9235a2f42f8..199ca723c768 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -3194,6 +3194,7 @@ void fbcon_remap_all(struct fb_info *info)
>  	}
>  	console_unlock();
>  }
> +EXPORT_SYMBOL(fbcon_remap_all);
>  
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>  static void fbcon_select_primary(struct fb_info *info)

Did you test this on a allmodconfig?

fbcon_remap_all is in a module, vga switcheroo is builtin, even with this patch you will still get the same compile failure.

~Maarten

