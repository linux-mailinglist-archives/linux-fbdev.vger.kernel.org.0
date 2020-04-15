Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168141AA9C8
	for <lists+linux-fbdev@lfdr.de>; Wed, 15 Apr 2020 16:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732949AbgDOOUT (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 15 Apr 2020 10:20:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:16721 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732547AbgDOOUR (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 15 Apr 2020 10:20:17 -0400
IronPort-SDR: TAVqN/dMzAyFSB3hVJZpDBJGw5Q/mBaCkDCRSqEaNglrrSoB1HoEof34QE0uf0RznOBRzBGDN0
 TLh857NKoKdA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:20:16 -0700
IronPort-SDR: IX9J3HCoblhxwEvY/1YnMaa2GqE1N7IUcgkzdF+gk8UrnJDwc79Z9g0i6HaHzbXqar2huvcSvB
 FzDhRSQQTBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="271740260"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 15 Apr 2020 07:20:15 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOitm-000nmF-Gw; Wed, 15 Apr 2020 17:20:18 +0300
Date:   Wed, 15 Apr 2020 17:20:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-fbdev@vger.kernel.org, xllacyx@gmail.com
Subject: Re: [PATCH v1 1/5] video: ssd1307fb: Convert driver to use
 ->probe_new()
Message-ID: <20200415142018.GH185537@smile.fi.intel.com>
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
 <20200330095144.GL1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200330095144.GL1922688@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Mar 30, 2020 at 12:51:44PM +0300, Andy Shevchenko wrote:
> On Tue, Mar 24, 2020 at 07:05:28PM +0200, Andy Shevchenko wrote:
> > Use the ->probe_new() callback.
> > 
> > The driver does not use const struct i2c_device_id * argument,
> > so convert it to utilise the simplified I²C driver registration.
> > 
> 
> Bartlomiej, any comments on the series?

Do I need to do something with the series?

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/video/fbdev/ssd1307fb.c | 10 ++--------
> >  1 file changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> > index 142535267fec..397eae246c2c 100644
> > --- a/drivers/video/fbdev/ssd1307fb.c
> > +++ b/drivers/video/fbdev/ssd1307fb.c
> > @@ -586,8 +586,7 @@ static const struct of_device_id ssd1307fb_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, ssd1307fb_of_match);
> >  
> > -static int ssd1307fb_probe(struct i2c_client *client,
> > -			   const struct i2c_device_id *id)
> > +static int ssd1307fb_probe(struct i2c_client *client)
> >  {
> >  	struct backlight_device *bl;
> >  	char bl_name[12];
> > @@ -599,11 +598,6 @@ static int ssd1307fb_probe(struct i2c_client *client,
> >  	void *vmem;
> >  	int ret;
> >  
> > -	if (!node) {
> > -		dev_err(&client->dev, "No device tree data found!\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	info = framebuffer_alloc(sizeof(struct ssd1307fb_par), &client->dev);
> >  	if (!info)
> >  		return -ENOMEM;
> > @@ -808,7 +802,7 @@ static const struct i2c_device_id ssd1307fb_i2c_id[] = {
> >  MODULE_DEVICE_TABLE(i2c, ssd1307fb_i2c_id);
> >  
> >  static struct i2c_driver ssd1307fb_driver = {
> > -	.probe = ssd1307fb_probe,
> > +	.probe_new = ssd1307fb_probe,
> >  	.remove = ssd1307fb_remove,
> >  	.id_table = ssd1307fb_i2c_id,
> >  	.driver = {
> > -- 
> > 2.25.1
> > 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With Best Regards,
Andy Shevchenko


