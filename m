Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA94136ED86
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Apr 2021 17:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240730AbhD2PlR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 29 Apr 2021 11:41:17 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43136 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240646AbhD2PlP (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 29 Apr 2021 11:41:15 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TFKUW4076424;
        Thu, 29 Apr 2021 15:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=BQbkytA+PXtTY5YfGP8M5DIYUuBz3K7V5eP2VQDmhNM=;
 b=S9FvGfccgLwiYVaHfVT6jvYI9xpZP3PWhPZeOaPVxfS3KNgYbpuPJI2hbw3XraqSnlyZ
 505RkaClU9/iT4OKzTQ+bczYv+vuWzeaRFjuhq2fmVFED06dzd/eeSqY9SuPEFcM/3MS
 ERuk9MX5h8FdEkgC/Kr+/xCjP9neVJ77JuoK5y731Wr7wGmQsr2F4kEAXslZKd76GOSp
 9MvMREJ777cCo/B9Mf3X/o1koMgac30wg/QmrFyrwm+ecG4h0NZgIwNU+0JVm+LiECek
 pktom7ZUB3L7zljVNBR46D79YXmni3Rp6+sgziRygTzJE1IWbuuyhZG6ln3IogIs75HN Hg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 385aeq4uva-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 15:40:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13TFEule086153;
        Thu, 29 Apr 2021 15:40:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 3874d3pt3x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 15:40:11 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13TFYBrO173166;
        Thu, 29 Apr 2021 15:40:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 3874d3pt3a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 15:40:10 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13TFe9MK014179;
        Thu, 29 Apr 2021 15:40:09 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 29 Apr 2021 08:40:08 -0700
Date:   Thu, 29 Apr 2021 18:40:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Phil Reid <preid@electromag.com.au>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 3/4] staging: fbtft: Don't spam logs when probe is
 deferred
Message-ID: <20210429154002.GF21598@kadam>
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
 <20210428130415.55406-4-andriy.shevchenko@linux.intel.com>
 <20210429144244.GE1981@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429144244.GE1981@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: rKOQ23DLMGvFxRqmwpwTIydtrzopqg3E
X-Proofpoint-GUID: rKOQ23DLMGvFxRqmwpwTIydtrzopqg3E
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9969 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290097
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Apr 29, 2021 at 05:42:44PM +0300, Dan Carpenter wrote:
> On Wed, Apr 28, 2021 at 04:04:14PM +0300, Andy Shevchenko wrote:
> > @@ -75,20 +75,16 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
> >  				  struct gpio_desc **gpiop)
> >  {
> >  	struct device *dev = par->info->device;
> > -	int ret = 0;
> >  
> >  	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
> >  					       GPIOD_OUT_LOW);
> > -	if (IS_ERR(*gpiop)) {
> > -		ret = PTR_ERR(*gpiop);
> > -		dev_err(dev,
> > -			"Failed to request %s GPIO: %d\n", name, ret);
> > -		return ret;
> > -	}
> > +	if (IS_ERR(*gpiop))
> > +		dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);
> 
> This should be a return statement:
> 
> 		return dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);
> 

I've created a new Smatch check for these:

drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:2890 mcp251xfd_probe() warn: pointer error 'PTR_ERR(clk)' not handled

There aren't that many bugs...  Anyway, I'm running a test now and I
guess we'll see tomorrow how it goes.

regards,
dan carpenter

