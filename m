Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4E376E7A
	for <lists+linux-fbdev@lfdr.de>; Fri, 26 Jul 2019 18:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbfGZQFo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 26 Jul 2019 12:05:44 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42541 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfGZQFn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 26 Jul 2019 12:05:43 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190726160541euoutp0262ab07f12d303bca63ba00be66d1ebca~1AKIXH1SN2836728367euoutp02_
        for <linux-fbdev@vger.kernel.org>; Fri, 26 Jul 2019 16:05:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190726160541euoutp0262ab07f12d303bca63ba00be66d1ebca~1AKIXH1SN2836728367euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564157141;
        bh=RISvfG3QSfpE3m2rIh/RkuP5NgANGDxSNOFkY0XhZbg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=SIKpSiOjzSTVgsVDdTDuJ5UaRf1GbiaUyHoEKiEjMLgdNs0nFAw4+7QW8KbkfPgWJ
         kXE/n1NZOv47kFCbwN0LodLjgpQSSRVgLTWTseLFU1aW9Dv7rV+TUrKz9n+r9SApzi
         xHa0NHvdM1apmnSCustXRvlc1pcswFINcfBC/D98=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190726160541eucas1p209bc3cc5f465f10651f39640f8badda9~1AKHwb44W2184021840eucas1p2q;
        Fri, 26 Jul 2019 16:05:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 13.EA.04298.4D42B3D5; Fri, 26
        Jul 2019 17:05:40 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190726160540eucas1p156f8b156e822bb021293c42eecfb0426~1AKHDxmYW2095820958eucas1p1k;
        Fri, 26 Jul 2019 16:05:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190726160540eusmtrp2ae2c3b7a37610d352654fe688dd8e07a~1AKG1qWf80348803488eusmtrp2M;
        Fri, 26 Jul 2019 16:05:40 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-1c-5d3b24d4d73b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 83.59.04140.4D42B3D5; Fri, 26
        Jul 2019 17:05:40 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190726160539eusmtip297e45e911d550c7c4b2abe33e36f0f88~1AKGWWPz60191601916eusmtip2T;
        Fri, 26 Jul 2019 16:05:39 +0000 (GMT)
Subject: Re: [PATCH v1 1/1] backlight: drop EARLY_EVENT_BLANK support
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Peter Rosin <peda@axentia.se>,
        Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3ccdeaf2-f235-ac7a-0089-611bae1105a3@samsung.com>
Date:   Fri, 26 Jul 2019 18:05:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725143224.GB31803@ravnborg.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOKsWRmVeSWpSXmKPExsWy7djP87pXVKxjDZ6vMrA48+Yuu8XCh3eZ
        La58fc9mseLLTHaLZ7dOMlvc/3qU0eJE3wdWi4Uft7JYfHt+itFi76H5jBYrfm5ldOD2mHZg
        NrvH3m8LWDx2zrrL7nHn2h42j3knAz3udx9n8lgy7Sqbx/t9QGJW2z42j8+b5AK4orhsUlJz
        MstSi/TtErgyTn0OKejTqJh1aAJLA+N3+S5GTg4JAROJe+t2MnYxcnEICaxglFh++BcrhPOF
        UeLzt6/sEM5nRonHjdsZYVrmNF6BalnOKLFzyS6olreMErs+3ACrEhZwlVi9+jobiC0ioCxx
        /Pw1sCJmgQXMEg865rKCJNgErCQmtq8Ca+AVsJOYuuoomM0ioCrxsmsOM4gtKhAhcf/YBlaI
        GkGJkzOfsIDYnAJGErt+bAarZxYQl7j1ZD4ThC0v0bx1NjPIMgmBr+wSd74sZ4W420Vi1YSD
        bBC2sMSr41vYIWwZif87QZpBGtYxSvzteAHVvR0YHpP/QXVYSxw+fhFoEgfQCk2J9bv0QUwJ
        AUeJFf2+ECafxI23ghA38ElM2jadGSLMK9HRJgQxQ01iw7INbDBbu3auZJ7AqDQLyWezkHwz
        C8k3sxDWLmBkWcUonlpanJueWmyYl1quV5yYW1yal66XnJ+7iRGY3E7/O/5pB+PXS0mHGAU4
        GJV4eAN+WsUKsSaWFVfmHmKU4GBWEuHdomQdK8SbklhZlVqUH19UmpNafIhRmoNFSZy3muFB
        tJBAemJJanZqakFqEUyWiYNTqoEx4ZDBvfKFT6V334q9rOvM0jtzPbf9uZ13MyIDzmlKljWv
        /nhy0aSrT6UKQ/Namhqdtx+M0O7w/l4ducgn4ciBhlm5JwVfv7cSTX2xR1fy78s3AnsSJr/3
        21e4NX7nvkuPXSVa9/7fNe+T1+3GKzuSVJX3my6Su7m4v2Sl7KSSXe+7mgVulzpdVWIpzkg0
        1GIuKk4EAHO6ZQNqAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsVy+t/xe7pXVKxjDdYeYLY48+Yuu8XCh3eZ
        La58fc9mseLLTHaLZ7dOMlvc/3qU0eJE3wdWi4Uft7JYfHt+itFi76H5jBYrfm5ldOD2mHZg
        NrvH3m8LWDx2zrrL7nHn2h42j3knAz3udx9n8lgy7Sqbx/t9QGJW2z42j8+b5AK4ovRsivJL
        S1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyTn0OKejTqJh1
        aAJLA+N3+S5GTg4JAROJOY1XGLsYuTiEBJYySuxdv5e5i5EDKCEjcXx9GUSNsMSfa11sEDWv
        GSUmr1zACpIQFnCVWL36OhuILSKgLHH8/DVWkCJmgQXMEss3n2GH6GhllFjycQlYFZuAlcTE
        9lWMIDavgJ3E1FVHwWwWAVWJl11zmEFsUYEIiTPvV7BA1AhKnJz5BMzmFDCS2PVjM1g9s4C6
        xJ95l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84
        Mbe4NC9dLzk/dxMjMJq3Hfu5ZQdj17vgQ4wCHIxKPLwBP61ihVgTy4orcw8xSnAwK4nwblGy
        jhXiTUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGCiySuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgj
        JJCeWJKanZpakFoE08fEwSnVwGj4b+vMtrKDess4v6pynHjxWVcjtezf5SWc3+aL213vm/co
        9Mqho5/XZpmVmsdbbtw2kYEzeWGmlv/fxAOJl01MmjQzvhccufbmsl3lb0mlShPVbp0YTcfZ
        nw1aWl/+Kjm5RC2ocsch65mf/RsSfO2Pcbl6ZR94weZQ2nr980kG05+zU9OzDJRYijMSDbWY
        i4oTASsMrhf8AgAA
X-CMS-MailID: 20190726160540eucas1p156f8b156e822bb021293c42eecfb0426
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190725143232epcas2p3e9c37b4d946bc025375a5154ac60b5e8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190725143232epcas2p3e9c37b4d946bc025375a5154ac60b5e8
References: <CGME20190725143232epcas2p3e9c37b4d946bc025375a5154ac60b5e8@epcas2p3.samsung.com>
        <20190725143224.GB31803@ravnborg.org>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


On 7/25/19 4:32 PM, Sam Ravnborg wrote:
> There was no users left - so drop the code to support EARLY_FB_BLANK.
> This patch removes the support in backlight,
> and drop the notifier in fbmem.
> 
> That EARLY_FB_BLANK is not used can be verified that no driver set any of:
> 
>     lcd_ops.early_set_power()
>     lcd_ops.r_early_set_power()
> 
> Noticed while browsing backlight code for other reasons.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: "Michał Mirosław" <mirq-linux@rere.qmqm.pl>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> ---
> 
> Build tested with various architectures, configs.
> 
> Lee, Daniel - OK to commit to drm-misc-next where fbdev stuff is
> maintained today?
> 
> Patch needs ack from Bartlomiej first of course.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

>  drivers/video/backlight/lcd.c    |  8 --------
>  drivers/video/fbdev/core/fbmem.c | 12 +-----------
>  include/linux/fb.h               |  4 ----
>  include/linux/lcd.h              | 10 ----------
>  4 files changed, 1 insertion(+), 33 deletions(-)
> 
> diff --git a/drivers/video/backlight/lcd.c b/drivers/video/backlight/lcd.c
> index d6b653aa4ee9..78b033358625 100644
> --- a/drivers/video/backlight/lcd.c
> +++ b/drivers/video/backlight/lcd.c
> @@ -39,14 +39,6 @@ static int fb_notifier_callback(struct notifier_block *self,
>  		if (event == FB_EVENT_BLANK) {
>  			if (ld->ops->set_power)
>  				ld->ops->set_power(ld, *(int *)evdata->data);
> -		} else if (event == FB_EARLY_EVENT_BLANK) {
> -			if (ld->ops->early_set_power)
> -				ld->ops->early_set_power(ld,
> -						*(int *)evdata->data);
> -		} else if (event == FB_R_EARLY_EVENT_BLANK) {
> -			if (ld->ops->r_early_set_power)
> -				ld->ops->r_early_set_power(ld,
> -						*(int *)evdata->data);
>  		} else {
>  			if (ld->ops->set_mode)
>  				ld->ops->set_mode(ld, evdata->data);
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 00fe0efeaee9..e6a1c805064f 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1058,7 +1058,7 @@ int
>  fb_blank(struct fb_info *info, int blank)
>  {	
>  	struct fb_event event;
> -	int ret = -EINVAL, early_ret;
> +	int ret = -EINVAL;
>  
>   	if (blank > FB_BLANK_POWERDOWN)
>   		blank = FB_BLANK_POWERDOWN;
> @@ -1066,21 +1066,11 @@ fb_blank(struct fb_info *info, int blank)
>  	event.info = info;
>  	event.data = &blank;
>  
> -	early_ret = fb_notifier_call_chain(FB_EARLY_EVENT_BLANK, &event);
> -
>  	if (info->fbops->fb_blank)
>   		ret = info->fbops->fb_blank(blank, info);
>  
>  	if (!ret)
>  		fb_notifier_call_chain(FB_EVENT_BLANK, &event);
> -	else {
> -		/*
> -		 * if fb_blank is failed then revert effects of
> -		 * the early blank event.
> -		 */
> -		if (!early_ret)
> -			fb_notifier_call_chain(FB_R_EARLY_EVENT_BLANK, &event);
> -	}
>  
>   	return ret;
>  }
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 50948e519897..756706b666a1 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -135,10 +135,6 @@ struct fb_cursor_user {
>  
>  /*      A display blank is requested       */
>  #define FB_EVENT_BLANK                  0x09
> -/*      A hardware display blank early change occurred */
> -#define FB_EARLY_EVENT_BLANK		0x10
> -/*      A hardware display blank revert early change occurred */
> -#define FB_R_EARLY_EVENT_BLANK		0x11
>  
>  struct fb_event {
>  	struct fb_info *info;
> diff --git a/include/linux/lcd.h b/include/linux/lcd.h
> index 851eee8fff25..238fb1dfed98 100644
> --- a/include/linux/lcd.h
> +++ b/include/linux/lcd.h
> @@ -41,16 +41,6 @@ struct lcd_ops {
>  	/* Get the LCD panel power status (0: full on, 1..3: controller
>  	   power on, flat panel power off, 4: full off), see FB_BLANK_XXX */
>  	int (*get_power)(struct lcd_device *);
> -	/*
> -	 * Enable or disable power to the LCD(0: on; 4: off, see FB_BLANK_XXX)
> -	 * and this callback would be called proir to fb driver's callback.
> -	 *
> -	 * P.S. note that if early_set_power is not NULL then early fb notifier
> -	 *	would be registered.
> -	 */
> -	int (*early_set_power)(struct lcd_device *, int power);
> -	/* revert the effects of the early blank event. */
> -	int (*r_early_set_power)(struct lcd_device *, int power);
>  	/* Enable or disable power to the LCD (0: on; 4: off, see FB_BLANK_XXX) */
>  	int (*set_power)(struct lcd_device *, int power);
>  	/* Get the current contrast setting (0-max_contrast) */

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
