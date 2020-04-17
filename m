Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4621ADF6B
	for <lists+linux-fbdev@lfdr.de>; Fri, 17 Apr 2020 16:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730779AbgDQOHe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 17 Apr 2020 10:07:34 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57983 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730778AbgDQOHd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 17 Apr 2020 10:07:33 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200417140730euoutp02a30cbfd3b886ab8e994264c25eb79880~GoI4chH6W1553115531euoutp02U
        for <linux-fbdev@vger.kernel.org>; Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200417140730euoutp02a30cbfd3b886ab8e994264c25eb79880~GoI4chH6W1553115531euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1587132450;
        bh=lsq2eSUvdBU1vvyLFdk6GKu1kqi9p8k3KwTJyUCI7Ug=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=fBesXSfBbi8jc8LHt5Zc0oOTMLnEoJYnXT80KeSaPG6qRjXfVtkHaA/s2VHT/5/PF
         ErxwrHsgvHdRRgDBO8NhxGLGjCZqtlHYmZOxzbTBeVCFfTRBjyNNhvpsHSTAyYJWLR
         kj3wq9wbsK1QT3uZT8feZvV4ksI4Uwtuc2NJ0eFc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200417140730eucas1p1e0695ecaef0e5846cbe3f882a7cd0adf~GoI4WQPWG1657316573eucas1p1l;
        Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 5D.BA.60698.228B99E5; Fri, 17
        Apr 2020 15:07:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200417140730eucas1p1c314f5fadf3f27aa5268c180a0c1d63b~GoI383igW1445114451eucas1p1i;
        Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200417140730eusmtrp126e85ae9b19c516579c0e491e09efe34~GoI38SGk12167921679eusmtrp1j;
        Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-6a-5e99b822aaab
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 45.B2.08375.228B99E5; Fri, 17
        Apr 2020 15:07:30 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200417140730eusmtip2301934b40db4dd719801f43127a7a95c~GoI3sw5Gm0114701147eusmtip27;
        Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1 1/5] video: ssd1307fb: Convert driver to use
 ->probe_new()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        xllacyx@gmail.com
Message-ID: <a53b8cfd-dc4b-322b-6661-ea4312152e92@samsung.com>
Date:   Fri, 17 Apr 2020 16:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7pKO2bGGbQu07LobZrOZHHl63s2
        ixN9H1gtli1by+rA4rFz1l12j3knAz3udx9n8vi8SS6AJYrLJiU1J7MstUjfLoErY/nK08wF
        C/kqenZfYGtgPM7dxcjJISFgInFz/h/GLkYuDiGBFYwS/5s62UASQgJfGCWWbNWGSHxmlLj5
        /QA7TMeL433sEInljBJ/Xi2Aan/LKPHwwHFmkCo2ASuJie2rgBIcHMICwRK/TnmBhEUEzCXW
        TVoEtoFZIFRiQ8N7dpASXgE7iSmzwcIsAqoSN893soDYogIREp8eHGYFsXkFBCVOznwCFucU
        cJfom70Xaoy4xK0n85kgbHmJ5q2zmUHOkRCYzC5x9W4fI8TRLhIPvm1hgrCFJV4d3wL1jIzE
        6ck9LBAN6xgl/na8gOreziixfPI/Nogqa4k7536xgVzKLKApsX6XPkTYUeL9hW9MIGEJAT6J
        G28FIY7gk5i0bTozRJhXoqNNCKJaTWLDsg1sMGu7dq5knsCoNAvJa7OQvDMLyTuzEPYuYGRZ
        xSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZhWTv87/nUH474/SYcYBTgYlXh4DXpmxgmx
        JpYVV+YeYpTgYFYS4T3oBhTiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampB
        ahFMlomDU6qBUbFcsXB+6OU7X4seMFvvaE49celhb+9Xi171zOsKb/PjLm1eXc+j0hLssuZ4
        whKZTY1fzrFpCd3feTq7+8q+K5MFjxkesU17l739k1d66SQe21faL9n5b+9wM/N9LXnmLN/n
        RbP6ljHMCXV/e+ZU8t4d0649mTV9y53bS5LTtIvFhO/zK37Je6DEUpyRaKjFXFScCAAxU5gE
        JwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xe7pKO2bGGaycKWbR2zSdyeLK1/ds
        Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
        oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvKVp5kLFvJV9Oy+wNbAeJy7i5GTQ0LA
        ROLF8T72LkYuDiGBpYwSH74uBnI4gBIyEsfXl0HUCEv8udbFBlHzmlGibe9pFpAEm4CVxMT2
        VYwg9cICwRK/TnmBhEUEzCXWTVrEBmIzC4RK3L+9jgmidxajxMRzq9hA6nkF7CSmzAarYRFQ
        lbh5vhNspKhAhMThHbMYQWxeAUGJkzOfgMU5Bdwl+mbvhZqpLvFn3iVmCFtc4taT+UwQtrxE
        89bZzBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyjbcd+
        bt7BeGlj8CFGAQ5GJR5eg56ZcUKsiWXFlbmHGCU4mJVEeA+6AYV4UxIrq1KL8uOLSnNSiw8x
        mgI9N5FZSjQ5HxjjeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUa
        GIUmaOortRxtfJ8n/H3rerkS2wUPVYP6IrdlX/B4l3tD1/fWnwttf7v/Li9q5psd9DSbxdtr
        xSx+jwtrcib++bZM5M8n768ymhP/eCyYEtO1d3LrmYlzEj7cCrl+d+WJ85k29nvmanhsujiF
        4+ML/0zTMsbcuXcau0WNHfl/TOiVZVuR0yRy670SS3FGoqEWc1FxIgDkf0QLuQIAAA==
X-CMS-MailID: 20200417140730eucas1p1c314f5fadf3f27aa5268c180a0c1d63b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200324170539eucas1p25909201d48429c9489c286ac18af0f1c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324170539eucas1p25909201d48429c9489c286ac18af0f1c
References: <CGME20200324170539eucas1p25909201d48429c9489c286ac18af0f1c@eucas1p2.samsung.com>
        <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org


[ added dri-devel ML to Cc: ]

On 3/24/20 6:05 PM, Andy Shevchenko wrote:
> Use the ->probe_new() callback.
> 
> The driver does not use const struct i2c_device_id * argument,
> so convert it to utilise the simplified I²C driver registration.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch queued for v5.8, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/video/fbdev/ssd1307fb.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> index 142535267fec..397eae246c2c 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -586,8 +586,7 @@ static const struct of_device_id ssd1307fb_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ssd1307fb_of_match);
>  
> -static int ssd1307fb_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int ssd1307fb_probe(struct i2c_client *client)
>  {
>  	struct backlight_device *bl;
>  	char bl_name[12];
> @@ -599,11 +598,6 @@ static int ssd1307fb_probe(struct i2c_client *client,
>  	void *vmem;
>  	int ret;
>  
> -	if (!node) {
> -		dev_err(&client->dev, "No device tree data found!\n");
> -		return -EINVAL;
> -	}
> -
>  	info = framebuffer_alloc(sizeof(struct ssd1307fb_par), &client->dev);
>  	if (!info)
>  		return -ENOMEM;
> @@ -808,7 +802,7 @@ static const struct i2c_device_id ssd1307fb_i2c_id[] = {
>  MODULE_DEVICE_TABLE(i2c, ssd1307fb_i2c_id);
>  
>  static struct i2c_driver ssd1307fb_driver = {
> -	.probe = ssd1307fb_probe,
> +	.probe_new = ssd1307fb_probe,
>  	.remove = ssd1307fb_remove,
>  	.id_table = ssd1307fb_i2c_id,
>  	.driver = {
> 

