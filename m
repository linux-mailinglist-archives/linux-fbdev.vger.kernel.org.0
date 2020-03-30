Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2515B19780A
	for <lists+linux-fbdev@lfdr.de>; Mon, 30 Mar 2020 11:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgC3Jvs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 30 Mar 2020 05:51:48 -0400
Received: from mga04.intel.com ([192.55.52.120]:64883 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727183AbgC3Jvs (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 30 Mar 2020 05:51:48 -0400
IronPort-SDR: veeICvahpIIId1aJ23ru4iqhacphvKG0UT36+ndBSiVVaaU221YJ/ACvV9qcqTyfBeSjsGsK0u
 8jp/LLOlRa4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 02:51:47 -0700
IronPort-SDR: ue1O0p7CzbpwjktU84UOXiMcrPVEKdY692ZRuuKnfmfx4Rc+5Ixqi7bpuq7jjvZEj6Qlt2Vi2Q
 N0HJMFmIkdLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,323,1580803200"; 
   d="scan'208";a="449747171"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2020 02:51:47 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jIr56-00E9st-Iv; Mon, 30 Mar 2020 12:51:44 +0300
Date:   Mon, 30 Mar 2020 12:51:44 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, xllacyx@gmail.com
Subject: Re: [PATCH v1 1/5] video: ssd1307fb: Convert driver to use
 ->probe_new()
Message-ID: <20200330095144.GL1922688@smile.fi.intel.com>
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, Mar 24, 2020 at 07:05:28PM +0200, Andy Shevchenko wrote:
> Use the ->probe_new() callback.
> 
> The driver does not use const struct i2c_device_id * argument,
> so convert it to utilise the simplified I²C driver registration.
> 

Bartlomiej, any comments on the series?

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


